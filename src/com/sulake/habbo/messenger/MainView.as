package com.sulake.habbo.messenger
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendlist.class_3191;
   import com.sulake.habbo.messenger.events.NewMessageEvent;
   import com.sulake.habbo.window.widgets.IIlluminaChatBubbleWidget;
   import com.sulake.habbo.window.widgets.IIlluminaInputHandler;
   import com.sulake.habbo.window.widgets.IIlluminaInputWidget;
   import com.sulake.habbo.window.widgets.class_3308;
   import com.sulake.habbo.window.widgets.class_3366;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import package_33.class_309;
   import package_33.class_430;
   import package_49.class_898;
   import package_7.class_197;
   import package_7.class_313;
   
   public class MainView implements class_13, IIlluminaInputHandler
   {
      
      private static const HIDDEN:String = "HIDDEN";
      
      private static const NO_CONVERSATION:int = -1;
      
      private static const NOTIFICATION_ICON_WIDTH:int = 55;
      
      private static const CHAT_ITEM_RENDER_BUNDLE_SIZE:int = 5;
      
      private static const SCROLL_TRIGGER_HEIGHT:int = 150;
      
      private static const ERROR_MESSAGES:Dictionary = new Dictionary();
      
      {
         ERROR_MESSAGES[3] = "${messenger.error.receivermuted}";
         ERROR_MESSAGES[4] = "${messenger.error.sendermuted}";
         ERROR_MESSAGES[5] = "${messenger.error.offline}";
         ERROR_MESSAGES[6] = "${messenger.error.notfriend}";
         ERROR_MESSAGES[7] = "${messenger.error.busy}";
         ERROR_MESSAGES[8] = "${messenger.error.receiverhasnochat}";
         ERROR_MESSAGES[9] = "${messenger.error.senderhasnochat}";
         ERROR_MESSAGES[10] = "${messenger.error.offline_failed}";
         ERROR_MESSAGES[11] = "${messenger.error.not_group_member}";
         ERROR_MESSAGES[12] = "${messenger.error.not_group_admin}";
         ERROR_MESSAGES[13] = "${messenger.error.sender_im_unavailable}";
         ERROR_MESSAGES[14] = "${messenger.error.recipient_im_unavailable}";
      }
      
      private var _messenger:com.sulake.habbo.messenger.HabboMessenger;
      
      private var _frame:class_3151;
      
      private var var_1503:IItemListWindow;
      
      private var var_1857:class_3151;
      
      private var _avatarListPosition:int;
      
      private var var_2697:Boolean;
      
      private var var_1941:Dictionary;
      
      private var var_1517:int = -1;
      
      private var var_2587:class_3151;
      
      private var var_2581:class_3217;
      
      private var var_2718:class_3151;
      
      private var var_2883:class_3151;
      
      private var var_2830:class_3151;
      
      private var var_2299:Boolean;
      
      private var var_4165:Boolean = false;
      
      private var var_2760:Array;
      
      private var var_1879:Timer;
      
      public function MainView(param1:com.sulake.habbo.messenger.HabboMessenger)
      {
         var_1941 = new Dictionary();
         super();
         _messenger = param1;
         _frame = _messenger.getXmlWindow("messenger") as class_3151;
         _frame.visible = false;
         _frame.procedure = messengerWindowProcedure;
         IStaticBitmapWrapperWindow(_frame.findChildByName("header_button_image")).assetUri = "messenger_minimize_button";
         var_1857 = _frame.findChildByName("avatar_list") as class_3151;
         var_2587 = var_1857.getChildAt(0) as class_3151;
         var_1857.removeChild(var_2587);
         _avatarListPosition = 0;
         var_1503 = _frame.findChildByName("conversation") as IItemListWindow;
         var_2581 = var_1503.getListItemByName("msg_normal") as class_3217;
         var_2718 = var_1503.getListItemByName("msg_notification") as class_3151;
         var_2883 = var_1503.getListItemByName("msg_invitation") as class_3151;
         var_2830 = var_1503.getListItemByName("msg_info") as class_3151;
         var_1503.removeListItems();
         IIlluminaInputWidget(class_3217(_frame.findChildByName("input_widget")).widget).submitHandler = this;
         var_2760 = [];
      }
      
      private static function avatarVisible(param1:class_3127) : Boolean
      {
         return param1 != null && param1.tags.indexOf("HIDDEN") < 0;
      }
      
      private static function setAvatarVisibilityTag(param1:class_3127, param2:Boolean) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:Boolean = avatarVisible(param1);
         if(_loc3_ && !param2)
         {
            param1.tags.push("HIDDEN");
         }
         else if(!_loc3_ && param2)
         {
            param1.tags.splice(param1.tags.indexOf("HIDDEN"),1);
         }
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            var_1503 = null;
            var_1857 = null;
            if(_frame != null)
            {
               _frame.dispose();
               _frame = null;
            }
            if(var_2581 != null)
            {
               var_2581.dispose();
               var_2581 = null;
            }
            if(var_2718 != null)
            {
               var_2718.dispose();
               var_2718 = null;
            }
            if(var_2883 != null)
            {
               var_2883.dispose();
               var_2883 = null;
            }
            if(var_2830 != null)
            {
               var_2830.dispose();
               var_2830 = null;
            }
            if(var_2587 != null)
            {
               var_2587.dispose();
               var_2587 = null;
            }
            if(var_1879)
            {
               if(false)
               {
                  var_1879.stop();
               }
               var_1879 = null;
            }
            var_1941 = null;
            _messenger = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _messenger == null;
      }
      
      public function get isOpen() : Boolean
      {
         return _frame != null && false;
      }
      
      public function toggle() : void
      {
         if(isOpen)
         {
            hide();
         }
         else
         {
            show();
         }
      }
      
      public function show(param1:Boolean = false) : void
      {
         if(param1 || visibleAvatarCount > 0)
         {
            _frame.visible = true;
            _frame.activate();
         }
      }
      
      public function hide() : void
      {
         _frame.visible = false;
      }
      
      public function startConversation(param1:int, param2:Boolean = true) : void
      {
         var _loc5_:class_3191 = null;
         var _loc8_:class_3151 = null;
         var _loc4_:class_3217 = null;
         var _loc7_:class_3217 = null;
         var _loc6_:class_3308 = null;
         var _loc3_:class_3366 = null;
         if(!(param1 in var_1941))
         {
            var_1941[param1] = [];
            if(!var_4165)
            {
               recordNotificationMessage(param1,"${messenger.moderationinfo}");
               var_4165 = true;
            }
            if(!(_loc5_ = _messenger.getFriend(param1)))
            {
               ErrorReportStorage.addDebugData("Messenger Mainview","User got start conversation request from nonexistent friend, id: " + param1);
               return;
            }
            if(!_loc5_.online)
            {
               recordNotificationMessage(param1,"${messenger.notification.persisted_messages}");
            }
            _loc8_ = var_2587.clone() as class_3151;
            setAvatarVisibilityTag(_loc8_,true);
            _loc8_.blend = 0;
            _loc8_.id = param1;
            if(param1 < 0)
            {
               _loc8_.name = String(param1);
            }
            _loc4_ = _loc8_.findChildByName("avatar_image") as class_3217;
            _loc7_ = _loc8_.findChildByName("group_badge_image") as class_3217;
            if(_loc5_.id > 0)
            {
               _loc6_ = _loc4_.widget as class_3308;
               if(_loc5_ != null)
               {
                  _loc6_.figure = _loc5_.figure;
               }
               _loc7_.visible = false;
               _loc4_.visible = true;
            }
            else
            {
               _loc3_ = _loc7_.widget as class_3366;
               _loc3_.badgeId = _loc5_.figure;
               _loc3_.groupId = _loc5_.id;
               _loc7_.visible = true;
               _loc4_.visible = false;
            }
            IRegionWindow(_loc8_.findChildByName("avatar_click_region")).toolTipCaption = _loc5_.name;
            var_1857.addChild(_loc8_);
            refreshAvatarList();
         }
         if(param2 || !isOpen)
         {
            selectConversation(param1);
         }
         refreshChatCount();
      }
      
      public function addConsoleMessage(param1:int, param2:String, param3:int, param4:String) : void
      {
         recordChatMessage(param1,param2,true,param3,param4);
      }
      
      public function addRoomInvite(param1:int, param2:String) : void
      {
         recordInvitationMessage(param1,_messenger.getText("messenger.invitation") + " " + param2,true);
      }
      
      public function setFollowingAllowed(param1:int, param2:Boolean) : void
      {
         if(param1 == var_1517)
         {
            refreshButtons();
         }
      }
      
      public function onInstantMessageError(param1:int, param2:int, param3:String) : void
      {
         var _loc5_:String = null;
         var _loc4_:RegExp = null;
         if(param2 in ERROR_MESSAGES)
         {
            if(param3.length > 0)
            {
               _loc5_ = "null";
               _loc4_ = /[${}]/g;
               _loc5_ = _loc5_.replace(_loc4_,"");
               recordNotificationMessage(param1,_messenger.getText(_loc5_) + ": " + param3);
            }
            else
            {
               recordNotificationMessage(param1,ERROR_MESSAGES[param2]);
            }
         }
      }
      
      public function setOnlineStatus(param1:int, param2:Boolean) : void
      {
         if(param1 in var_1941)
         {
            recordInfoMessage(param1,param2 ? "${messenger.notification.online}" : "${messenger.notification.offline}");
         }
      }
      
      private function selectConversation(param1:int) : void
      {
         var_1517 = param1;
         setAvatarVisibilityTag(getAvatarWrapper(param1),true);
         setChatIndicatorVisibility(param1,false);
         refreshConversationList();
         refreshAvatarList();
         var _loc3_:class_3191 = _messenger.getFriend(var_1517);
         var _loc2_:String = _loc3_ != null ? _loc3_.name : "";
         _frame.findChildByName("separator_label").visible = var_1517 < 0 || _loc3_ != null;
         _messenger.localization.registerParameter("messenger.window.separator","friend_name",_loc2_);
         _messenger.localization.registerParameter("messenger.window.input.default","friend_name",_loc2_);
         _frame.invalidate();
      }
      
      public function hideConversation(param1:int) : void
      {
         var _loc2_:class_3127 = getAvatarWrapper(param1);
         if(_loc2_ != null)
         {
            setAvatarVisibilityTag(_loc2_,false);
         }
         if(visibleAvatarCount == 0)
         {
            selectConversation(-1);
            hide();
         }
         else
         {
            for each(_loc2_ in var_1857.iterator)
            {
               if(avatarVisible(_loc2_))
               {
                  _avatarListPosition = 0;
                  selectConversation(_loc2_.id);
                  break;
               }
            }
         }
         refreshChatCount();
      }
      
      private function refreshChatCount() : void
      {
         _messenger.localization.registerParameter("messenger.window.title","open_chat_count",visibleAvatarCount.toString());
         _messenger.conversationCountUpdated(visibleAvatarCount);
      }
      
      private function recordChatMessage(param1:int, param2:String, param3:Boolean, param4:int, param5:String = null) : void
      {
         if(param3)
         {
            recordChatEntry(param1,new ChatEntry(2,param1,param2,param4,param5),true);
         }
         else
         {
            recordChatEntry(param1,new ChatEntry(1,0,param2,param4));
         }
      }
      
      private function recordNotificationMessage(param1:int, param2:String) : void
      {
         recordChatEntry(param1,new ChatEntry(3,0,param2,0));
      }
      
      private function recordInfoMessage(param1:int, param2:String, param3:Boolean = false) : void
      {
         recordChatEntry(param1,new ChatEntry(4,0,param2,0),param3);
      }
      
      private function recordInvitationMessage(param1:int, param2:String, param3:Boolean = false) : void
      {
         recordChatEntry(param1,new ChatEntry(5,0,param2,0),param3);
      }
      
      private function recordChatEntry(param1:int, param2:ChatEntry, param3:Boolean = false) : void
      {
         var _loc8_:ChatEntry = null;
         var _loc4_:* = false;
         var _loc9_:String = null;
         var _loc6_:String = null;
         if(_messenger == null)
         {
            return;
         }
         if(true)
         {
            var_2760.push(new ChatQueueEntry(param1,param2,param3));
            if(!var_1879 || var_1879)
            {
               var_1879 = new Timer(12000);
               var_1879.addEventListener("timer",batchMessageUpdate);
               var_1879.start();
            }
            return;
         }
         if(!(param1 in var_1941))
         {
            if(param1 <= 0)
            {
               return;
            }
            startConversation(param1,false);
         }
         var _loc7_:Array;
         if((_loc7_ = var_1941[param1]).length > 0)
         {
            _loc8_ = _loc7_[_loc7_.length - 1];
            if(param1 > 0)
            {
               if(param2.type == _loc8_.type && (param2.type == 1 || param2.type == 2))
               {
                  _loc7_.pop();
                  param2.prefixMessageWith(_loc8_.message);
                  if(param1 == var_1517)
                  {
                     var_1503.removeListItemAt(-1);
                  }
               }
            }
            else
            {
               _loc4_ = false;
               if(param2.type == 2)
               {
                  if(_loc8_.extraData == null || param2.extraData == null)
                  {
                     _loc4_ = false;
                  }
                  else
                  {
                     _loc9_ = String(_loc8_.extraData.split("/")[0]);
                     _loc6_ = String(param2.extraData.split("/")[0]);
                     _loc4_ = _loc9_ == _loc6_;
                  }
               }
               if(param2.type == _loc8_.type && (param2.type == 1 || _loc4_))
               {
                  _loc7_.pop();
                  param2.prefixMessageWith(_loc8_.message);
                  if(param1 == var_1517)
                  {
                     var_1503.removeListItemAt(-1);
                  }
               }
            }
         }
         _loc7_.push(param2);
         var _loc5_:class_3151;
         if((_loc5_ = getAvatarWrapper(param1)) != null)
         {
            setAvatarVisibilityTag(_loc5_,true);
            refreshAvatarList();
         }
         if(param1 == var_1517)
         {
            appendChatEntry(param2);
         }
         else
         {
            if(param3)
            {
               setChatIndicatorVisibility(param1,true);
            }
            if(visibleAvatarCount == 1)
            {
               selectConversation(param1);
            }
         }
         refreshChatCount();
      }
      
      private function batchMessageUpdate(param1:TimerEvent) : void
      {
         var _loc3_:int = 0;
         if(_messenger == null)
         {
            return;
         }
         if(false)
         {
            if(false)
            {
               _loc3_ = -1;
               for each(var _loc2_ in var_2760)
               {
                  _loc3_ = _loc2_.conversationId;
                  recordChatEntry(_loc2_.conversationId,_loc2_.chatEntry,_loc2_.updateIndicator);
               }
               refreshConversationList();
               refreshAvatarList();
               _messenger.events.dispatchEvent(new NewMessageEvent(true,_loc3_));
            }
            var_2760 = [];
            var_1879.stop();
         }
      }
      
      private function getAvatarWrapper(param1:int) : class_3151
      {
         return var_1857.getChildByID(param1) as class_3151;
      }
      
      private function setChatIndicatorVisibility(param1:int, param2:Boolean) : void
      {
         var _loc3_:class_3151 = getAvatarWrapper(param1);
         if(_loc3_ != null)
         {
            _loc3_.findChildByName("chat_indicator").visible = param2;
         }
      }
      
      private function createChatItem(param1:ChatEntry) : class_3127
      {
         var _loc8_:class_3217 = null;
         var _loc4_:IIlluminaChatBubbleWidget = null;
         var _loc10_:class_3151 = null;
         var _loc9_:class_3127 = null;
         var _loc3_:class_3151 = null;
         var _loc5_:class_3151 = null;
         var _loc2_:* = false;
         var _loc6_:class_3191 = null;
         switch(param1.type - 1)
         {
            case 0:
               (_loc8_ = var_2581.clone() as class_3217).width = conversationItemWidth;
               (_loc4_ = _loc8_.widget as IIlluminaChatBubbleWidget).message = param1.message;
               _loc4_.timeStamp = param1.sentTimeStamp();
               _loc4_.flipped = false;
               _loc4_.figure = _messenger.sessionDataManager.figure;
               _loc4_.userName = _messenger.sessionDataManager.userName;
               if((_loc6_ = _messenger.getFriend(var_1517)) != null && !_loc6_.online && (_loc6_.persistedMessageUser || _loc6_.pocketHabboUser))
               {
                  _loc4_.friendOnlineStatus = false;
               }
               return _loc8_;
            case 1:
               (_loc8_ = var_2581.clone() as class_3217).width = conversationItemWidth;
               (_loc4_ = _loc8_.widget as IIlluminaChatBubbleWidget).message = param1.message;
               _loc4_.timeStamp = param1.sentTimeStamp();
               _loc4_.flipped = true;
               for each(var _loc7_ in var_1857.iterator)
               {
                  _loc2_ = _loc7_ != null && _loc7_.id == var_1517;
                  if(!_loc2_ && _loc7_ != null && var_1517 < 0)
                  {
                     _loc2_ = Number(_loc7_.name) == var_1517;
                  }
                  if(_loc2_)
                  {
                     if(var_1517 > 0)
                     {
                        _loc4_.figure = class_3308(class_3217(_loc7_.getChildByName("avatar_image")).widget).figure;
                        _loc4_.userName = IRegionWindow(_loc7_.findChildByName("avatar_click_region")).toolTipCaption;
                        _loc4_.userId = _loc7_.id;
                        break;
                     }
                     _loc4_.userId = param1.extraData.split("/")[2];
                     _loc4_.figure = param1.extraData.split("/")[1];
                     _loc4_.userName = param1.extraData.split("/")[0];
                     break;
                  }
               }
               return _loc8_;
            case 2:
               _loc3_ = var_2718.clone() as class_3151;
               _loc3_.findChildByName("content").width = conversationItemWidth - 55;
               _loc3_.findChildByName("content").caption = param1.message;
               return _loc3_;
            case 3:
               (_loc9_ = (_loc10_ = var_2830.clone() as class_3151).findChildByName("content")).limits.minWidth = conversationItemWidth;
               _loc9_.limits.maxWidth = conversationItemWidth;
               _loc9_.caption = param1.message;
               return _loc10_;
            case 4:
               (_loc5_ = var_2883.clone() as class_3151).findChildByName("content").width = conversationItemWidth - 55;
               _loc5_.findChildByName("content").caption = param1.message;
               return _loc5_;
            default:
               return null;
         }
      }
      
      private function appendChatEntry(param1:ChatEntry, param2:Boolean = true) : void
      {
         var_1503.addListItem(createChatItem(param1));
         if(param2)
         {
            var_1503.scrollV = 1;
            var_1503.arrangeListItems();
         }
      }
      
      private function adjustListItemWidths() : void
      {
         var _loc1_:int = 0;
         var _loc2_:class_3127 = null;
         var _loc3_:class_3127 = null;
         _loc1_ = 0;
         while(_loc1_ < var_1503.numListItems)
         {
            _loc2_ = var_1503.getListItemAt(_loc1_);
            switch(_loc2_.name)
            {
               case "msg_normal":
                  break;
               case "msg_notification":
                  class_3151(_loc2_).findChildByName("content").width = conversationItemWidth - 55;
                  break;
               case "msg_info":
                  _loc3_ = class_3151(_loc2_).findChildByName("content");
                  _loc3_.limits.minWidth = conversationItemWidth;
                  _loc3_.limits.maxWidth = conversationItemWidth;
            }
            _loc2_.width = conversationItemWidth;
            _loc1_++;
         }
         var_1503.arrangeListItems();
         _frame.invalidate();
      }
      
      private function get conversationItemWidth() : int
      {
         return -27;
      }
      
      private function refreshButtons() : void
      {
         IItemListWindow(_frame.findChildByName("button_strip")).arrangeListItems();
      }
      
      private function refreshConversationList() : void
      {
         var _loc2_:int = 0;
         var_2299 = true;
         var_1503.destroyListItems();
         var _loc1_:Array = var_1941[var_1517];
         if(_loc1_ == null)
         {
            return;
         }
         var _loc3_:int = int(_loc1_.length);
         _loc2_ = Math.max(0,_loc3_ - 5);
         while(_loc2_ < _loc3_)
         {
            appendChatEntry(_loc1_[_loc2_]);
            _loc2_++;
         }
         var_1503.scrollV = 1;
         var_1503.arrangeListItems();
         var_2299 = false;
      }
      
      private function addMissingChatEntries() : void
      {
         var _loc5_:int = 0;
         if(-var_1503.scrollableRegion.y > 150)
         {
            return;
         }
         var_2299 = true;
         var _loc2_:Number = 0;
         var _loc3_:int = int(var_1503.scrollableRegion.height);
         var _loc1_:Array = var_1941[var_1517];
         if(_loc1_ == null)
         {
            return;
         }
         var _loc6_:int = _loc1_.length - 0;
         var _loc4_:int = 0;
         _loc5_ = Math.max(0,_loc6_ - 5);
         while(_loc5_ < _loc6_)
         {
            var_1503.addListItemAt(createChatItem(_loc1_[_loc5_]),_loc4_);
            _loc4_++;
            _loc5_++;
         }
         var_1503.arrangeListItems();
         var_1503.scrollV = 1 - _loc3_ * (1 - _loc2_) / var_1503.scrollableRegion.height;
         var_2299 = false;
      }
      
      private function refreshAvatarList() : void
      {
         var _loc1_:* = false;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var_2697 = false;
         for each(var _loc4_ in var_1857.iterator)
         {
            _loc1_ = _loc4_.id == var_1517;
            if(!_loc1_ && _loc4_.name.length > 0)
            {
               _loc1_ = Number(_loc4_.name) == var_1517;
            }
            if(_loc1_)
            {
               setAvatarVisibilityTag(_loc4_,true);
            }
            _loc2_ = avatarVisible(_loc4_);
            if(_loc5_ < _avatarListPosition || !_loc2_ || var_2697)
            {
               _loc4_.visible = false;
            }
            else if(_loc3_ + _loc4_.width > var_1857.width)
            {
               _loc4_.visible = false;
               var_2697 = true;
            }
            else
            {
               _loc4_.visible = true;
               _loc4_.blend = _loc1_ ? 1 : 0;
               _loc4_.x = _loc3_;
               _loc3_ += _loc4_.width;
            }
            if(_loc2_)
            {
               _loc5_++;
            }
         }
         _frame.findChildByName("avatars_scroll_left").visible = _avatarListPosition > 0;
         _frame.findChildByName("avatars_scroll_right").visible = var_2697;
      }
      
      private function get visibleAvatarCount() : int
      {
         var _loc1_:int = 0;
         for each(var _loc2_ in var_1857.iterator)
         {
            if(avatarVisible(_loc2_))
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      private function messengerWindowProcedure(param1:class_3134, param2:class_3127) : void
      {
         loop0:
         switch(param1.type)
         {
            case "WE_RESIZE":
               if(param2 == _frame)
               {
                  adjustListItemWidths();
                  refreshAvatarList();
                  break;
               }
               break;
            case "WE_RELOCATED":
               if(param2.name == "_CONTAINER" && !var_2299)
               {
                  addMissingChatEntries();
                  break;
               }
               break;
            case "WME_CLICK":
               switch(param2.name)
               {
                  case "avatar_click_region":
                     selectConversation(param2.parent.id);
                     break loop0;
                  case "avatars_scroll_left":
                     if(_avatarListPosition > 0)
                     {
                        _avatarListPosition--;
                        refreshAvatarList();
                        break loop0;
                     }
                     break loop0;
                  case "avatars_scroll_right":
                     if(var_2697)
                     {
                        _avatarListPosition++;
                        refreshAvatarList();
                        break loop0;
                     }
                     break loop0;
                  case "close_conversation_button":
                     hideConversation(var_1517);
                     break loop0;
                  case "follow_button":
                     if(var_1517 > 0)
                     {
                        _messenger.send(new class_430(var_1517));
                        _messenger.send(new class_898("Navigation","IM","go.im"));
                        break loop0;
                     }
                     _messenger.followingToGroupRoom = true;
                     _messenger.send(new class_197(Math.abs(var_1517),false));
                     break loop0;
                  case "profile_button":
                     if(var_1517 > 0)
                     {
                        _messenger.send(new class_313(var_1517));
                        _messenger.trackGoogle("extendedProfile","messenger_conversation");
                        break loop0;
                     }
                     _messenger.send(new class_197(Math.abs(var_1517),true));
                     _messenger.trackGoogle("extendedProfile","messenger_conversation");
                     break loop0;
                  case "report_button":
                     _messenger.reportUser(var_1517);
                     break loop0;
                  case "header_button_close":
                     hide();
               }
         }
      }
      
      public function onInput(param1:class_3217, param2:String) : void
      {
         _messenger.send(new class_309(var_1517,param2));
         IIlluminaInputWidget(param1.widget).message = "";
         var _loc3_:Array = var_1941[var_1517];
         if(_loc3_.length == 0 || _loc3_.length == 1 && ChatEntry(_loc3_[0]).type == 3)
         {
            _messenger.playSendSound();
         }
         recordChatMessage(var_1517,escapeExternalKeys(param2),false,0);
      }
      
      private function escapeExternalKeys(param1:String) : String
      {
         if(param1.search("\\${") == 0)
         {
            return " " + param1;
         }
         return param1;
      }
   }
}
