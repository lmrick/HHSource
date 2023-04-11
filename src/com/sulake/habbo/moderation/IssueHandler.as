package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import flash.utils.getTimer;
   import package_137.class_1612;
   import package_36.class_1634;
   import package_36.class_1671;
   import package_59.class_541;
   import package_59.class_970;
   
   public class IssueHandler implements ITrackedWindow, IIssueHandler, class_41
   {
      
      private static const USELESS_REPORTS_TOPIC_ID:int = 27;
      
      private static const AUTO_TOPIC_ID:int = 28;
      
      private static const const_622:int = 1;
      
      private static const AUTO_TRIGGERED_CATEGORY_ID:int = 3;
       
      
      private var _moderationManager:com.sulake.habbo.moderation.ModerationManager;
      
      private var var_1528:com.sulake.habbo.moderation.IssueBundle;
      
      private var var_1955:class_1612;
      
      private var _window:class_3281;
      
      private var var_4178:Vector.<class_1634>;
      
      private var var_3035:Array;
      
      private var _topicDropdown:class_3287;
      
      private var _callerUserInfo:com.sulake.habbo.moderation.UserInfoCtrl;
      
      private var _reportedUserInfo:com.sulake.habbo.moderation.UserInfoCtrl;
      
      private var _disposed:Boolean;
      
      private var var_3943:int;
      
      private var var_2507:com.sulake.habbo.moderation.ChatlogCtrl;
      
      private var _chatFrame:class_3151;
      
      private var var_2289:IItemListWindow;
      
      private var var_3064:int = 0;
      
      private var var_2233:int;
      
      private var var_2183:int;
      
      private var _lastWindowWidth:int;
      
      private var var_2259:int;
      
      private var var_3386:uint;
      
      private var var_2655:class_3151;
      
      private var var_2759:ITextFieldWindow;
      
      public function IssueHandler(param1:com.sulake.habbo.moderation.ModerationManager, param2:com.sulake.habbo.moderation.IssueBundle, param3:Vector.<class_1634>, param4:int, param5:int, param6:int, param7:int)
      {
         var_3386 = getTimer();
         super();
         _moderationManager = param1;
         var_1528 = param2;
         var_4178 = param3;
         var_2233 = param4;
         var_2183 = param5;
         _lastWindowWidth = param6;
         var_2259 = param7;
      }
      
      public function getType() : int
      {
         return 8;
      }
      
      public function getId() : String
      {
         return "undefined";
      }
      
      public function getFrame() : class_3281
      {
         return _window;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(this._callerUserInfo != null)
         {
            this._callerUserInfo.dispose();
            this._callerUserInfo = null;
         }
         if(this._reportedUserInfo != null)
         {
            this._reportedUserInfo.dispose();
            this._reportedUserInfo = null;
         }
         if(this.var_2507 != null)
         {
            this.var_2507.dispose();
            this.var_2507 = null;
         }
         if(var_2655)
         {
            var_2655.dispose();
            var_2655 = null;
         }
         if(var_2759)
         {
            var_2759.dispose();
            var_2759 = null;
         }
         _moderationManager.removeUpdateReceiver(this);
         _moderationManager = null;
         var_1528 = null;
      }
      
      public function show() : void
      {
         var _loc5_:IItemListWindow = null;
         var _loc6_:class_3127 = null;
         if(_window != null)
         {
            return;
         }
         if(true || true)
         {
            return;
         }
         _window = _moderationManager.getXmlWindow("issue_handler") as class_3281;
         if(_window == null)
         {
            return;
         }
         var _loc3_:IItemListWindow = _window.findChildByName("issues_item_list") as IItemListWindow;
         var_2655 = _loc3_.getListItemAt(0) as class_3151;
         _loc3_.removeListItems();
         var _loc2_:IItemListWindow = _window.findChildByName("msg_item_list") as IItemListWindow;
         var_2759 = _loc2_.getListItemAt(0) as ITextFieldWindow;
         _loc2_.removeListItems();
         var _loc7_:class_3127;
         if((_loc7_ = _window.findChildByTag("close")) != null)
         {
            _loc7_.addEventListener("WME_CLICK",onClose);
         }
         if((_loc7_ = _window.findChildByName("issue_cont")) != null)
         {
            _loc7_.addEventListener("WE_RELOCATED",onWindowRelocatedOrResized);
            _loc7_.addEventListener("WE_RESIZED",onWindowRelocatedOrResized);
            _moderationManager.registerUpdateReceiver(this,1000);
         }
         var_3386 = getTimer();
         setProc("close_useless",onCloseUseless);
         setProc("close_sanction",onCloseSanction);
         setProc("close_resolved",onCloseResolved);
         setProc("release",onRelease);
         if((_loc7_ = _window.findChildByName("move_to_player_support")) != null)
         {
            _loc7_.disable();
         }
         _moderationManager.issueManager.requestSanctionData(var_1528.id,-1);
         initializeTopicDropdown();
         var_1955 = var_1528.getHighestPriorityIssue();
         _callerUserInfo = new com.sulake.habbo.moderation.UserInfoCtrl(_window,_moderationManager,var_1955,this);
         _reportedUserInfo = new com.sulake.habbo.moderation.UserInfoCtrl(_window,_moderationManager,var_1955,this);
         _callerUserInfo.load(class_3151(_window.findChildByName("caller_user_info")),var_1955.reporterUserId);
         if(false && false)
         {
            _topicDropdown.selection = var_3943;
            _moderationManager.issueManager.requestSanctionData(var_1528.id,1);
         }
         var _loc1_:class_3151 = class_3151(_window.findChildByName("reported_user_info"));
         if(false)
         {
            _reportedUserInfo.load(_loc1_,var_1528.reportedUserId);
         }
         else
         {
            _loc5_ = IItemListWindow(_window.findChildByName("issue_cont"));
            _loc6_ = _window.findChildByName("reported_user_info_caption");
            _loc5_.removeListItem(_loc6_);
            _loc5_.removeListItem(_loc1_);
         }
         var _loc4_:class_3176;
         if((_loc4_ = _window.findChildByName("handle_next_checkbox") as class_3176) != null)
         {
            _loc4_.select();
         }
         _chatFrame = class_3151(_window.findChildByName("chat_cont"));
         var_2289 = IItemListWindow(_chatFrame.findChildByName("evidence_list"));
         var_2507 = new com.sulake.habbo.moderation.ChatlogCtrl(new class_970(var_1955.issueId),_moderationManager,3,var_1955.issueId,var_1955,_chatFrame,var_2289,true);
         var_2507.show();
         class_14.log("HARASSER: undefined");
         updateIssueList();
         updateMessages();
      }
      
      private function sendWindowPreferences() : void
      {
         var_2233 = _window.x;
         var_2183 = _window.y;
         _lastWindowWidth = _window.width;
         var_2259 = _window.height;
         _moderationManager.issueManager.setToolPreferences(var_2233,var_2183,_lastWindowWidth,var_2259);
         _moderationManager.connection.send(new class_541(var_2233,var_2183,_lastWindowWidth,var_2259));
      }
      
      private function windowDimensionsChanged() : Boolean
      {
         if(var_2233 != _window.x)
         {
            return true;
         }
         if(var_2183 != _window.y)
         {
            return true;
         }
         if(_lastWindowWidth != _window.width)
         {
            return true;
         }
         if(var_2259 != _window.height)
         {
            return true;
         }
         return false;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:uint = uint(getTimer());
         if(windowDimensionsChanged() && _loc2_ - var_3386 > 5000)
         {
            sendWindowPreferences();
         }
      }
      
      private function onWindowRelocatedOrResized(param1:class_3134) : void
      {
         var _loc4_:IItemListWindow;
         if((_loc4_ = param1.window as IItemListWindow) == null)
         {
            return;
         }
         var _loc5_:IItemListWindow = _loc4_.getListItemByName("issues_item_list") as IItemListWindow;
         var _loc3_:IItemListWindow = _loc4_.getListItemByName("msg_item_list") as IItemListWindow;
         if(_loc5_ == null || _loc3_ == null)
         {
            return;
         }
         var _loc2_:int = (_loc4_.height - _loc4_.scrollableRegion.height + _loc5_.height + _loc3_.height) * 0.5;
         _loc4_.autoArrangeItems = false;
         _loc5_.height = _loc2_;
         _loc3_.height = _loc2_;
         _loc4_.autoArrangeItems = true;
      }
      
      private function updateIssueList() : void
      {
         var _loc1_:class_3151 = null;
         var _loc10_:class_3151 = null;
         var _loc2_:class_3127 = null;
         var _loc4_:* = null;
         var _loc13_:String = null;
         if(_window == null)
         {
            return;
         }
         var _loc6_:IItemListWindow;
         if((_loc6_ = _window.findChildByName("issues_item_list") as IItemListWindow) == null)
         {
            return;
         }
         var _loc8_:Array = var_1528.issues;
         var _loc7_:int = 0;
         var _loc12_:int = _loc6_.numListItems;
         var _loc3_:int = int(_loc8_.length);
         if(_loc12_ < _loc3_)
         {
            _loc1_ = var_2655.clone() as class_3151;
            _loc6_.addListItem(_loc1_);
            _loc7_ = 1;
            while(_loc7_ < _loc3_ - _loc12_)
            {
               if((_loc10_ = _loc1_.clone() as class_3151) == null)
               {
                  return;
               }
               _loc6_.addListItem(_loc10_);
               _loc7_++;
            }
         }
         else if(_loc12_ > _loc3_)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc12_ - _loc3_)
            {
               _loc2_ = _loc6_.removeListItemAt(0);
               _loc2_.dispose();
               _loc7_++;
            }
         }
         var _loc9_:class_1612;
         var _loc11_:int = int((_loc9_ = var_1528.getHighestPriorityIssue()) == null ? 0 : _loc9_.issueId);
         var _loc5_:int = getTimer();
         _loc7_ = 0;
         for each(_loc4_ in _loc8_)
         {
            _loc1_ = _loc6_.getListItemAt(_loc7_) as class_3151;
            if(_loc1_ == null)
            {
               return;
            }
            _loc1_.background = _loc7_++ % 2 == 0;
            _loc1_.id = _loc4_.issueId;
            _loc1_.removeEventListener("WME_CLICK",onIssueClicked);
            _loc1_.addEventListener("WME_CLICK",onIssueClicked);
            setCaption(_loc1_.findChildByName("reporter"),_loc4_.reporterUserName);
            setCaption(_loc1_.findChildByName("type"),class_3243.getSourceName(_loc4_.categoryId));
            setCaption(_loc1_.findChildByName("category"),class_3243.getCategoryName(_loc4_.reportedCategoryId));
            setCaption(_loc1_.findChildByName("time_open"),_loc4_.getOpenTime(_loc5_));
            _loc13_ = _loc4_.issueId == _loc11_ && _loc3_ > 1 ? "Volter Bold" : "Volter";
            (_loc1_.findChildByName("category") as ITextWindow).fontFace = _loc13_;
         }
      }
      
      private function updateMessages() : void
      {
         var _loc1_:ITextFieldWindow = null;
         var _loc6_:ITextWindow = null;
         var _loc2_:class_3127 = null;
         var _loc5_:* = null;
         if(_window == null)
         {
            return;
         }
         var _loc4_:IItemListWindow;
         if((_loc4_ = _window.findChildByName("msg_item_list") as IItemListWindow) == null)
         {
            return;
         }
         var _loc8_:Array = var_1528.issues;
         var _loc7_:int = 0;
         var _loc9_:int = _loc4_.numListItems;
         var _loc3_:int = int(_loc8_.length);
         if(_loc9_ < _loc3_)
         {
            _loc1_ = var_2759.clone() as ITextFieldWindow;
            _loc1_.selectable = true;
            _loc1_.editable = false;
            _loc4_.addListItem(_loc1_);
            _loc7_ = 1;
            while(_loc7_ < _loc3_ - _loc9_)
            {
               if((_loc6_ = _loc1_.clone() as ITextWindow) == null)
               {
                  return;
               }
               _loc4_.addListItem(_loc6_);
               _loc7_++;
            }
         }
         else if(_loc9_ > _loc3_)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc9_ - _loc3_)
            {
               _loc2_ = _loc4_.removeListItemAt(0);
               _loc2_.dispose();
               _loc7_++;
            }
         }
         _loc7_ = 0;
         for each(_loc5_ in _loc8_)
         {
            _loc1_ = _loc4_.getListItemAt(_loc7_) as ITextFieldWindow;
            if(_loc1_ == null)
            {
               return;
            }
            _loc1_.width = _loc4_.width;
            _loc1_.background = _loc7_++ % 2 == 0;
            _loc1_.caption = _loc5_.reporterUserName + ": " + _loc5_.message;
            _loc1_.height = _loc1_.textHeight + 10;
         }
      }
      
      private function setCaption(param1:class_3127, param2:String) : void
      {
         if(param1 != null)
         {
            param1.caption = param2;
         }
      }
      
      private function initializeTopicDropdown() : void
      {
         _topicDropdown = _window.findChildByName("cfh_topics") as class_3287;
         var _loc1_:* = -1;
         var _loc6_:int;
         if((_loc6_ = var_1528.getHighestPriorityIssue().reportedCategoryId) == 27)
         {
            _topicDropdown.disable();
            return;
         }
         var_3035 = [];
         var _loc2_:* = [];
         var _loc3_:int = 0;
         for each(var _loc5_ in var_4178)
         {
            for each(var _loc4_ in _loc5_.topics)
            {
               _loc2_[_loc3_] = "${help.cfh.topic." + _loc4_.id + "}";
               var_3035[_loc3_] = _loc4_.id;
               if(_loc4_.id == 1)
               {
                  var_3943 = _loc3_;
               }
               if(_loc4_.id == _loc6_)
               {
                  _loc1_ = _loc3_;
               }
               _loc3_++;
            }
         }
         _topicDropdown.populate(_loc2_);
         if(_loc1_ >= 0)
         {
            _topicDropdown.selection = _loc1_;
         }
         _topicDropdown.addEventListener("WE_SELECTED",refreshSanctionDataForSelectedTopic);
      }
      
      private function refreshSanctionDataForSelectedTopic(param1:class_3134) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         _moderationManager.issueManager.requestSanctionData(var_1528.id,_loc2_);
      }
      
      private function setProc(param1:String, param2:Function) : void
      {
         _window.findChildByName(param1).addEventListener("WME_CLICK",param2);
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         if(_moderationManager != null && false && var_1528 != null)
         {
            _moderationManager.issueManager.removeHandler(var_1528.id);
            trackAction("closeWindow");
         }
         this.dispose();
      }
      
      private function onCloseUseless(param1:WindowMouseEvent) : void
      {
         class_14.log("Close useless clicked");
         trackAction("closeUseless");
         _moderationManager.trackGoogle("actionCountUseless",var_3064);
         _moderationManager.issueManager.closeBundle(var_1528.id,1);
         checkAutoHandling();
         dispose();
      }
      
      private function onCloseResolved(param1:WindowMouseEvent) : void
      {
         class_14.log("Close resolved clicked");
         trackAction("closeResolved");
         _moderationManager.trackGoogle("actionCountResolved",var_3064);
         _moderationManager.issueManager.closeBundle(var_1528.id,3);
         checkAutoHandling();
         dispose();
      }
      
      private function onCloseSanction(param1:WindowMouseEvent) : void
      {
         class_14.log("Close with default sanction clicked");
         trackAction("closeSanction");
         _moderationManager.trackGoogle("actionCountSanction",var_3064);
         var _loc2_:int = -1;
         var _loc3_:int = 0;
         if(_loc3_ >= 0)
         {
            _loc2_ = 0;
         }
         if(_loc2_ <= 0 && var_1528.getHighestPriorityIssue().reportedCategoryId == 28)
         {
            _moderationManager.windowManager.alert("Topic missing","You need to select the topic first.",0,null);
         }
         else
         {
            _moderationManager.issueManager.closeDefaultAction(var_1528.id,_loc2_);
            checkAutoHandling();
            dispose();
         }
      }
      
      private function onRelease(param1:WindowMouseEvent) : void
      {
         class_14.log("Release clicked");
         trackAction("release");
         _moderationManager.issueManager.releaseBundle(var_1528.id);
         checkAutoHandling();
         dispose();
      }
      
      private function onIssueClicked(param1:WindowMouseEvent) : void
      {
         var _loc3_:int = 0;
         for each(var _loc2_ in var_1528.issues)
         {
            if(_loc2_.issueId == param1.window.id)
            {
               var_1955 = _loc2_;
               _loc3_ = _loc2_.reporterUserId;
               if(_loc3_ != 0)
               {
                  if(_callerUserInfo != null)
                  {
                     _callerUserInfo.dispose();
                  }
                  _callerUserInfo = new com.sulake.habbo.moderation.UserInfoCtrl(_window,_moderationManager,_loc2_,this);
                  _callerUserInfo.load(class_3151(_window.findChildByName("caller_user_info")),_loc3_);
                  _moderationManager.connection.send(new class_970(_loc2_.issueId));
                  var_2507.setId(_loc2_.issueId);
                  _moderationManager.messageHandler.addChatlogListener(var_2507);
                  break;
               }
               break;
            }
         }
      }
      
      public function updateIssuesAndMessages() : void
      {
         updateIssueList();
         updateMessages();
      }
      
      public function showDefaultSanction(param1:int, param2:String) : void
      {
         if(_window == null || _moderationManager == null || true || var_1528 == null)
         {
            return;
         }
         if(param1 != var_1528.reportedUserId)
         {
            return;
         }
         var _loc3_:ITextWindow = _window.findChildByName("sanction_label") as ITextWindow;
         if(_loc3_ != null)
         {
            _loc3_.caption = param2;
         }
      }
      
      private function checkAutoHandling() : void
      {
         if(_window == null || _moderationManager == null || true)
         {
            return;
         }
         var _loc1_:class_3176 = _window.findChildByName("handle_next_checkbox") as class_3176;
         if(_loc1_ != null && Boolean(_loc1_.isSelected))
         {
            _moderationManager.issueManager.autoPick("issue handler pick next");
         }
      }
      
      internal function get callerUserInfo() : com.sulake.habbo.moderation.UserInfoCtrl
      {
         return _callerUserInfo;
      }
      
      internal function get reportedUserInfo() : com.sulake.habbo.moderation.UserInfoCtrl
      {
         return _reportedUserInfo;
      }
      
      internal function trackAction(param1:String) : void
      {
         if(_moderationManager == null || false)
         {
            return;
         }
         var_3064++;
         _moderationManager.trackGoogle("issueHandler_" + param1);
      }
   }
}
