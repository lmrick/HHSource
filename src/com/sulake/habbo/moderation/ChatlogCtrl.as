package com.sulake.habbo.moderation
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.utils.StringUtil;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import package_137.class_1612;
   import package_50.class_1644;
   import package_50.class_1660;
   
   public class ChatlogCtrl implements class_13, ITrackedWindow, class_3350
   {
      
      private static var CHAT_LINE_POOL:Array = [];
      
      private static var CHAT_LINE_POOL_MAX_SIZE:int = 1000;
      
      private static const CHAT_REPORTED_USER_COLOUR:uint = 4293973667;
      
      private static const CHAT_REPORTEE_COLOUR:uint = 4288921072;
       
      
      private var var_271:int;
      
      private var var_247:int;
      
      private var _msg:IMessageComposer;
      
      private var _main:com.sulake.habbo.moderation.ModerationManager;
      
      private var _frame:class_3151;
      
      private var var_19:IItemListWindow;
      
      private var _rooms:Array;
      
      private var _embedded:Boolean;
      
      private var _disposed:Boolean;
      
      private var var_2315:class_3151;
      
      private var var_2688:class_3151;
      
      private var _hilitedUserIds:Dictionary;
      
      private var var_2004:Timer;
      
      private var var_3185:class_24;
      
      private var var_3425:class_1612;
      
      private var var_2271:Array;
      
      private var _headers:Array;
      
      public function ChatlogCtrl(param1:IMessageComposer, param2:com.sulake.habbo.moderation.ModerationManager, param3:int, param4:int, param5:class_1612 = null, param6:class_3151 = null, param7:IItemListWindow = null, param8:Boolean = false)
      {
         var_2271 = [];
         _headers = [];
         super();
         _main = param2;
         var_271 = param3;
         var_247 = param4;
         _msg = param1;
         var_3185 = new class_24();
         var_3425 = param5;
         _frame = param6;
         var_19 = param7;
         _embedded = param8;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function show() : void
      {
         var _loc2_:class_3127 = null;
         var _loc1_:class_3281 = class_3281(_main.getXmlWindow("evidence_frame"));
         _loc1_.visible = false;
         var _loc3_:IItemListWindow = IItemListWindow(_loc1_.findChildByName("evidence_list"));
         var_2688 = _loc3_.getListItemAt(0) as class_3151;
         var_2315 = _loc3_.getListItemAt(1) as class_3151;
         _loc3_.removeListItems();
         var_2004 = new Timer(1000,1);
         var_2004.addEventListener("timer",onResizeTimer);
         if(!_embedded)
         {
            _frame = _loc1_;
            _frame.procedure = onWindow;
            _frame.visible = true;
            _loc2_ = _frame.findChildByTag("close");
            _loc2_.procedure = onClose;
            var_19 = _loc3_;
         }
         else
         {
            _loc1_.dispose();
         }
         _main.connection.send(_msg);
         _main.messageHandler.addChatlogListener(this);
      }
      
      public function hide() : void
      {
         dispose();
      }
      
      public function onChatlog(param1:String, param2:int, param3:int, param4:Array, param5:Dictionary) : void
      {
         var _loc6_:* = null;
         if(param2 != var_271 || param3 != var_247 || _disposed)
         {
            return;
         }
         for each(_loc6_ in var_2271)
         {
            recycleContentLine(_loc6_);
         }
         for each(_loc6_ in _headers)
         {
            _loc6_.dispose();
         }
         var_2271 = [];
         _headers = [];
         _main.messageHandler.removeChatlogListener(this);
         _rooms = param4;
         _hilitedUserIds = param5;
         populate();
         onResizeTimer(null);
         if(!_embedded)
         {
            _frame.caption = param1;
            _frame.visible = true;
         }
      }
      
      public function getType() : int
      {
         return var_271;
      }
      
      public function getId() : String
      {
         return "" + var_247;
      }
      
      public function setId(param1:int) : void
      {
         var_247 = param1;
      }
      
      public function getFrame() : class_3281
      {
         return _frame as class_3281;
      }
      
      private function populate() : void
      {
         var _loc1_:* = null;
         var_19.autoArrangeItems = false;
         var_19.removeListItems();
         for each(_loc1_ in _rooms)
         {
            populateEvidence(_loc1_);
         }
         var_19.autoArrangeItems = true;
      }
      
      private function populateEvidence(param1:class_1644) : void
      {
         var _loc10_:String = null;
         var _loc7_:int = 0;
         var _loc8_:class_1660 = null;
         var _loc6_:class_3151;
         var _loc9_:class_3127 = (_loc6_ = createHeaderLine()).findChildByName("text");
         var _loc2_:class_3140 = class_3140(_loc6_.findChildByName("btnHeaderAction"));
         var _loc3_:class_3140 = class_3140(_loc6_.findChildByName("btnHeaderAction2"));
         if(_loc3_)
         {
            _loc3_.visible = false;
         }
         switch(param1.recordType - 1)
         {
            case 0:
               if(param1.roomId > 0)
               {
                  _loc2_.caption = "Room tool";
                  if(param1.roomName == null)
                  {
                     _loc9_.caption = "Room #" + param1.roomId;
                  }
                  else
                  {
                     _loc9_.caption = "Room: " + param1.roomName;
                  }
                  _loc3_.visible = true;
                  _loc3_.caption = "View room";
                  new OpenRoomInSpectatorMode(_main,_loc3_,param1.roomId);
                  if(_embedded)
                  {
                     new OpenRoomTool(null,_main,_loc2_,param1.roomId);
                     break;
                  }
                  new OpenRoomTool(_frame as class_3281,_main,_loc2_,param1.roomId);
                  break;
               }
               break;
            case 1:
               _loc9_.caption = "IM session";
               break;
            case 2:
               _loc9_.caption = "Forum thread";
               _loc3_.visible = true;
               _loc3_.caption = "Open thread";
               new OpenDiscussionThread(_main,_loc3_,param1.groupId,param1.threadId);
               _loc2_.caption = "Delete";
               new HideDiscussionThread(_main,this,_loc2_,param1.groupId,param1.threadId);
               break;
            case 3:
               _loc9_.caption = "Forum message";
               _loc3_.visible = true;
               _loc3_.caption = "Open Message";
               new OpenDiscussionMessage(_main,_loc3_,param1.groupId,param1.threadId,param1.context.messageIndex);
               _loc2_.caption = "Delete";
               new HideDiscussionMessage(_main,this,_loc2_,param1.groupId,param1.threadId,param1.messageId);
               break;
            case 4:
               _loc9_.caption = "Selfie report";
               _loc3_.visible = true;
               _loc3_.caption = "View selfie";
               new OpenExternalLink(_main,_loc3_,param1.context.url);
               _loc2_.visible = true;
               _loc2_.caption = "Room tool";
               if(_embedded)
               {
                  new OpenRoomTool(null,_main,_loc2_,param1.roomId);
                  break;
               }
               new OpenRoomTool(_frame as class_3281,_main,_loc2_,param1.roomId);
               break;
            case 5:
               _loc9_.caption = "Photo report";
               _loc3_.visible = true;
               _loc3_.caption = "Moderate photo";
               _loc10_ = _main.getProperty("stories.admin.tool.base.url");
               if(StringUtil.isEmpty(_loc10_))
               {
                  _loc10_ = "https://theallseeingeye.sulake.com/habbo-stories-admin/#/photos/";
               }
               _loc10_ += param1.context.extraDataId;
               new OpenExternalLink(_main,_loc3_,_loc10_);
               _loc2_.visible = true;
               _loc2_.caption = "Room tool";
               if(_embedded)
               {
                  new OpenRoomTool(null,_main,_loc2_,param1.roomId);
                  break;
               }
               new OpenRoomTool(_frame as class_3281,_main,_loc2_,param1.roomId);
               break;
         }
         addHeaderLineToList(_loc6_);
         var _loc4_:* = true;
         var _loc5_:* = -1;
         _loc7_ = 0;
         while(_loc7_ < param1.chatlog.length)
         {
            _loc8_ = param1.chatlog[_loc7_];
            populateContentLine(_loc8_,_loc4_);
            _loc4_ = !_loc4_;
            if(_loc8_.hasHighlighting && _loc5_ == -1)
            {
               _loc5_ = _loc7_;
            }
            _loc7_++;
         }
         if(_loc5_ > -1)
         {
            var_19.autoArrangeItems = true;
            if(false)
            {
               var_19.scrollV = var_19.getListItemAt(_loc5_).y / 0;
            }
         }
      }
      
      private function addContentLineToList(param1:class_3151) : void
      {
         var_19.addListItem(param1);
         var_2271.push(param1);
      }
      
      private function addHeaderLineToList(param1:class_3151) : void
      {
         var_19.addListItem(param1);
         _headers.push(param1);
      }
      
      private function createContentLine() : class_3151
      {
         if(false)
         {
            return CHAT_LINE_POOL.pop() as class_3151;
         }
         return class_3151(var_2315.clone());
      }
      
      private function recycleContentLine(param1:class_3151) : void
      {
         var _loc2_:ITextWindow = null;
         if(CHAT_LINE_POOL.length < CHAT_LINE_POOL_MAX_SIZE)
         {
            _loc2_ = ITextWindow(param1.findChildByName("chatter_txt"));
            _loc2_.removeEventListener("WME_CLICK",onUserClick);
            param1.width = var_2315.width;
            param1.height = -10;
            CHAT_LINE_POOL.push(param1);
         }
         else
         {
            param1.dispose();
         }
      }
      
      private function createHeaderLine() : class_3151
      {
         return var_2688.clone() as class_3151;
      }
      
      private function populateContentLine(param1:class_1660, param2:Boolean) : void
      {
         var _loc5_:TextFormat = null;
         var _loc7_:class_3151;
         var _loc8_:class_3127 = (_loc7_ = createContentLine()).findChildByName("time_txt");
         var _loc4_:ITextWindow = ITextWindow(_loc7_.findChildByName("chatter_txt"));
         var _loc6_:ITextWindow = _loc7_.findChildByName("msg_txt") as ITextWindow;
         _loc8_.caption = param1.timeStamp;
         var _loc9_:*;
         if((_loc9_ = _hilitedUserIds[param1.chatterId]) != null)
         {
            _loc7_.color = _loc9_ as int == 0 ? 4293973667 : 4288921072;
         }
         else
         {
            _loc7_.color = param2 ? 4291030266 : 4294967295;
         }
         if(param1.hasHighlighting)
         {
            (_loc5_ = _loc6_.getTextFormat()).bold = true;
            _loc6_.setTextFormat(_loc5_);
            _loc6_.bold = true;
         }
         if(param1.chatterId > 0)
         {
            _loc4_.text = param1.chatterName;
            _loc4_.underline = true;
            _loc4_.addEventListener("WME_CLICK",onUserClick);
            if(!var_3185.getValue(param1.chatterName))
            {
               var_3185.add(param1.chatterName,param1.chatterId);
            }
         }
         else if(param1.chatterId == 0)
         {
            _loc4_.text = "Bot / pet";
            _loc4_.underline = false;
         }
         else
         {
            _loc4_.text = "-";
            _loc4_.underline = false;
         }
         _loc4_.color = _loc7_.color;
         _loc8_.color = _loc7_.color;
         _loc6_.color = _loc7_.color;
         _loc6_.text = param1.msg;
         var _loc3_:int = Math.max(_loc8_.height,_loc6_.textHeight + 5);
         _loc6_.height = _loc3_;
         if(_loc6_.getTextFormat())
         {
            _loc6_.getTextFormat().align = "left";
            _loc6_.getTextFormat().rightMargin = _loc6_.getTextFormat().rightMargin + 10;
         }
         _loc4_.height = _loc3_;
         _loc8_.height = _loc3_;
         _loc7_.height = _loc3_;
         addContentLineToList(_loc7_);
      }
      
      private function onUserClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:String = param1.target.caption;
         var _loc3_:int = var_3185.getValue(_loc2_);
         _main.windowTracker.show(new UserInfoFrameCtrl(_main,_loc3_,var_3425),_frame as class_3281,false,false,true);
      }
      
      private function onClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         dispose();
      }
      
      private function onWindow(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WE_RESIZED" || param2 != _frame)
         {
            return;
         }
         var_2004.reset();
         var_2004.start();
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         refreshListDims();
         var _loc2_:Boolean = refreshScrollBarVisibility();
      }
      
      private function refreshListDims() : void
      {
         var _loc4_:class_3151 = null;
         var _loc2_:ITextWindow = null;
         var _loc3_:int = 0;
         var_19.autoArrangeItems = false;
         var _loc1_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            if((_loc4_ = class_3151(var_19.getListItemAt(_loc3_))).name == "chatline")
            {
               _loc2_ = ITextWindow(_loc4_.findChildByName("msg_txt"));
               _loc2_.width = _loc4_.width - _loc2_.x;
               _loc2_.height = _loc2_.textHeight + 5;
               _loc4_.height = _loc2_.height;
            }
            _loc3_++;
         }
         var_19.autoArrangeItems = true;
      }
      
      private function refreshScrollBarVisibility() : Boolean
      {
         var _loc2_:class_3151 = class_3151(var_19.parent);
         var _loc4_:class_3127 = _loc2_.getChildByName("scroller") as class_3127;
         var _loc3_:* = var_19.scrollableRegion.height > var_19.height;
         if(_loc4_.visible)
         {
            if(_loc3_)
            {
               return false;
            }
            _loc4_.visible = false;
            var_19.width = NaN;
            return true;
         }
         if(_loc3_)
         {
            _loc4_.visible = true;
            var_19.width = -22;
            return true;
         }
         return false;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         _main = null;
         _msg = null;
         var_3425 = null;
         if(var_19 != null)
         {
            var_19.removeListItems();
            var_19.dispose();
            var_19 = null;
         }
         if(_frame != null)
         {
            _frame.destroy();
            _frame = null;
         }
         _rooms = null;
         _hilitedUserIds = null;
         if(var_2004 != null)
         {
            var_2004.stop();
            var_2004.removeEventListener("timer",onResizeTimer);
            var_2004 = null;
         }
         if(!_embedded)
         {
            for each(_loc1_ in var_2271)
            {
               recycleContentLine(_loc1_);
            }
            for each(_loc1_ in _headers)
            {
               _loc1_.dispose();
            }
         }
         var_2271 = [];
         _headers = [];
         if(var_2315 != null)
         {
            var_2315.dispose();
            var_2315 = null;
         }
         if(var_2688 != null)
         {
            var_2688.dispose();
            var_2688 = null;
         }
      }
   }
}
