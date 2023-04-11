package com.sulake.habbo.friendbar.groupforums
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IScrollableListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import package_155.class_1629;
   import package_155.class_1642;
   
   public class ThreadListView
   {
       
      
      private var var_282:com.sulake.habbo.friendbar.groupforums.GroupForumController;
      
      private var var_1534:com.sulake.habbo.friendbar.groupforums.GroupForumView;
      
      private var var_19:IScrollableListWindow;
      
      private var var_3484:class_3151;
      
      private var var_506:class_1642;
      
      private var var_1943:com.sulake.habbo.friendbar.groupforums.ThreadsListData;
      
      public function ThreadListView(param1:com.sulake.habbo.friendbar.groupforums.GroupForumView, param2:IScrollableListWindow, param3:class_1642, param4:com.sulake.habbo.friendbar.groupforums.ThreadsListData)
      {
         super();
         var_1534 = param1;
         var_282 = var_1534.controller;
         var_19 = param2;
         var_3484 = var_282.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_thread_list_item_xml())) as class_3151;
         var_506 = param3;
         var_1943 = param4;
      }
      
      private static function getThreadColor(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case 10:
               return 4289374890;
            case 20:
               return 4294946981;
            case 0:
            case 1:
         }
         return !!((param2 + 1) % 2) ? 4293852927 : 4289914618;
      }
      
      public function update() : void
      {
         var _loc2_:int = 0;
         var _loc1_:class_3151 = null;
         var _loc3_:class_1629 = null;
         var_19.invalidate();
         _loc2_ = 0;
         while(_loc2_ < var_1943.size)
         {
            _loc3_ = var_1943.threads[_loc2_];
            _loc1_ = var_3484.clone() as class_3151;
            _loc1_.name = "thread_" + _loc3_.threadId;
            updateListItem(_loc1_,_loc3_,_loc2_);
            var_19.addListItem(_loc1_);
            _loc2_++;
         }
         updateItemWidths();
      }
      
      private function updateListItem(param1:class_3151, param2:class_1629, param3:int) : void
      {
         var _loc13_:class_3127 = null;
         var _loc10_:String = null;
         var _loc7_:class_3151 = param1 as class_3151;
         var _loc11_:int = param2.state;
         var _loc8_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc6_:Boolean = param2.isSticky;
         var _loc9_:Boolean = param2.isLocked;
         var _loc5_:int = param2.nMessages - var_282.getThreadLastReadMessageIndex(param2.threadId) - 1;
         if((_loc13_ = _loc7_.findChildByName("texts_container")) != null)
         {
            _loc13_.id = param2.threadId;
            _loc13_.color = getThreadColor(_loc11_,param3);
         }
         var _loc12_:ITextWindow;
         if((_loc12_ = _loc7_.findChildByName("header") as ITextWindow) != null)
         {
            _loc12_.bold = _loc5_ > 0;
            _loc10_ = param2.header;
            if(param2.header == "")
            {
               _loc10_ = "(No Subject)";
            }
            if(_loc11_ > 1 && !_loc8_ && !_loc4_)
            {
               _loc10_ = getModerationMessage(param2);
            }
            _loc12_.text = _loc10_;
         }
         if((_loc13_ = _loc7_.findChildByName("header_region")) != null)
         {
            _loc13_.id = param2.threadId;
            _loc13_.removeEventListener("WME_CLICK",onGoToFirstUnread);
            _loc13_.addEventListener("WME_CLICK",onGoToFirstUnread);
         }
         if((_loc13_ = _loc7_.findChildByName("details")) != null)
         {
            _loc13_.caption = var_282.localizationManager.getLocalizationWithParams("groupforum.view.thread_details","","thread_author_id",param2.threadAuthorId,"thread_author_name",param2.threadAuthorName,"last_author_id",param2.lastMessageAuthorId,"last_author_name",param2.lastMessageAuthorName,"creation_time",var_1534.getAsDaysHoursMinutes(param2.creationTimeAsSecondsAgo),"update_time",var_1534.getAsDaysHoursMinutes(param2.lastMessageTimeAsSecondsAgo));
         }
         if((_loc13_ = _loc7_.findChildByName("unread_texts_container")) != null)
         {
            _loc13_.id = param2.threadId;
            _loc13_.color = getThreadColor(_loc11_,param3);
         }
         if((_loc13_ = _loc7_.findChildByName("unread_region")) != null)
         {
            _loc13_.id = param2.threadId;
            _loc13_.removeEventListener("WME_CLICK",onGoToFirstUnread);
            _loc13_.addEventListener("WME_CLICK",onGoToFirstUnread);
         }
         if((_loc12_ = _loc7_.findChildByName("messages1") as ITextWindow) != null)
         {
            _loc12_.bold = _loc5_ > 0;
            _loc12_.text = var_282.localizationManager.getLocalizationWithParams("groupforum.view.thread_details1","","total_messages",param2.nMessages,"new_messages",_loc5_);
         }
         if((_loc12_ = _loc7_.findChildByName("messages2") as ITextWindow) != null)
         {
            _loc12_.bold = _loc5_ > 0;
            _loc12_.text = var_282.localizationManager.getLocalizationWithParams("groupforum.view.thread_details2","","total_messages",param2.nMessages,"new_messages",_loc5_);
         }
         if((_loc13_ = _loc7_.findChildByName("button_container")) != null)
         {
            _loc13_.id = param2.threadId;
            _loc13_.color = getThreadColor(_loc11_,param3);
            handleButtonVisibility(_loc13_ as class_3151,param2,_loc11_);
            _loc13_.color = getThreadColor(_loc11_,param3);
         }
         if((_loc13_ = _loc7_.findChildByName("left_button_container")) != null)
         {
            _loc13_.id = param2.threadId;
            _loc13_.color = getThreadColor(_loc11_,param3);
            handleLeftButtonsVisibility(_loc13_ as class_3151,param2,_loc9_,_loc6_);
            _loc13_.color = getThreadColor(_loc11_,param3);
         }
      }
      
      public function updateItemWidths() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < var_19.numListItems)
         {
            var_19.getListItemAt(_loc1_).width = var_19.scrollableWindow.width - 2;
            _loc1_++;
         }
      }
      
      private function handleButtonVisibility(param1:class_3151, param2:class_1629, param3:int) : void
      {
         var _loc9_:IRegionWindow = null;
         var _loc7_:IStaticBitmapWrapperWindow = null;
         var _loc6_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc8_:IItemListWindow;
         if((_loc9_ = (_loc8_ = param1.findChildByName("mod_buttons") as IItemListWindow).getListItemAt(0) as IRegionWindow) != null)
         {
            _loc9_.removeEventListener("WME_CLICK",onDelete);
            _loc9_.removeEventListener("WME_CLICK",onUndelete);
            if(_loc6_ || _loc5_)
            {
               _loc9_.id = param2.threadId;
               _loc7_ = _loc9_.getChildByName("icon") as IStaticBitmapWrapperWindow;
               switch(param3)
               {
                  case 0:
                  case 1:
                     _loc9_.addEventListener("WME_CLICK",onDelete);
                     _loc7_.assetUri = "forum_forum_hide";
                     break;
                  case 10:
                     _loc9_.addEventListener("WME_CLICK",onUndelete);
                     _loc7_.assetUri = "forum_forum_unhide";
                     break;
                  case 20:
                     if(_loc5_)
                     {
                        _loc9_.addEventListener("WME_CLICK",onUndelete);
                        _loc7_.assetUri = "forum_forum_unhide";
                        break;
                     }
                     _loc9_.visible = false;
                     break;
               }
            }
            else
            {
               _loc9_.visible = false;
            }
         }
         if((_loc9_ = _loc8_.getListItemAt(1) as IRegionWindow) != null)
         {
            _loc9_.removeEventListener("WME_CLICK",onReport);
            if(_loc6_ || _loc5_ || _loc4_)
            {
               _loc9_.id = param2.threadId;
               _loc9_.addEventListener("WME_CLICK",onReport);
            }
            else
            {
               _loc9_.visible = false;
            }
         }
      }
      
      private function handleLeftButtonsVisibility(param1:class_3151, param2:class_1629, param3:Boolean, param4:Boolean) : void
      {
         var _loc8_:IStaticBitmapWrapperWindow = null;
         var _loc6_:IStaticBitmapWrapperWindow = null;
         var _loc10_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc7_:IRegionWindow;
         var _loc11_:IItemListWindow;
         if((_loc7_ = (_loc11_ = param1.findChildByName("info_buttons") as IItemListWindow).getListItemByName("thread_lock") as IRegionWindow) != null)
         {
            _loc7_.removeEventListener("WME_CLICK",onToggleLock);
            _loc8_ = _loc7_.getChildByName("icon") as IStaticBitmapWrapperWindow;
            if(_loc10_ || _loc9_)
            {
               _loc7_.id = param2.threadId;
               _loc7_.addEventListener("WME_CLICK",onToggleLock);
               if(param3)
               {
                  _loc8_.assetUri = "forum_forum_locked";
               }
               else
               {
                  _loc8_.assetUri = "forum_forum_unlocked";
               }
               _loc7_.visible = true;
            }
            else
            {
               if(param3)
               {
                  _loc8_.assetUri = "forum_forum_locked";
               }
               _loc7_.visible = param3;
               _loc7_.disable();
            }
         }
         var _loc5_:IRegionWindow;
         if((_loc5_ = _loc11_.getListItemByName("thread_pin") as IRegionWindow) != null)
         {
            _loc5_.removeEventListener("WME_CLICK",onToggleSticky);
            _loc6_ = _loc5_.getChildByName("icon") as IStaticBitmapWrapperWindow;
            if(_loc10_ || _loc9_)
            {
               _loc5_.id = param2.threadId;
               _loc5_.addEventListener("WME_CLICK",onToggleSticky);
               if(param4)
               {
                  _loc6_.assetUri = "forum_forum_pinned";
               }
               else
               {
                  _loc6_.assetUri = "forum_forum_unpinned";
               }
               _loc5_.visible = true;
            }
            else
            {
               if(param4)
               {
                  _loc6_.assetUri = "forum_forum_pinned";
               }
               _loc5_.visible = param4;
               _loc5_.disable();
            }
         }
      }
      
      private function getModerationMessage(param1:class_1629) : String
      {
         var _loc2_:String = null;
         switch(param1.state)
         {
            case 0:
            case 1:
               break;
            case 10:
               _loc2_ = String(var_282.localizationManager.getLocalizationWithParams("groupforum.view.thread_hidden_by_admin","","admin_name",param1.adminName));
               break;
            case 20:
               _loc2_ = String(var_282.localizationManager.getLocalizationWithParams("groupforum.view.thread_hidden_by_staff","","admin_name",param1.adminName));
         }
         return _loc2_;
      }
      
      public function updateElement(param1:class_1629) : void
      {
         var _loc3_:int = param1.threadId;
         var _loc2_:class_3151 = var_19.getListItemByName("thread_" + _loc3_) as class_3151;
         var _loc4_:int = int(var_19.getListItemIndex(_loc2_));
         if(_loc2_ != null)
         {
            updateListItem(_loc2_,param1,_loc4_);
         }
      }
      
      private function onToggleLock(param1:WindowMouseEvent) : void
      {
         var _loc2_:int = param1.target.id;
         var _loc3_:class_1629 = var_1943.threadsById[_loc2_];
         if(_loc3_ == null)
         {
            return;
         }
         var_282.lockThread(var_506,_loc2_,!_loc3_.isLocked,_loc3_.isSticky);
      }
      
      private function onToggleSticky(param1:WindowMouseEvent) : void
      {
         var _loc2_:int = param1.target.id;
         var _loc3_:class_1629 = var_1943.threadsById[_loc2_];
         if(_loc3_ == null)
         {
            return;
         }
         var_282.stickThread(var_506,_loc2_,_loc3_.isLocked,!_loc3_.isSticky);
      }
      
      private function onReport(param1:WindowMouseEvent) : void
      {
         var_282.reportThread(var_506,param1.target.id);
      }
      
      private function onDelete(param1:WindowMouseEvent) : void
      {
         var_282.deleteThread(var_506,param1.target.id);
      }
      
      private function onUndelete(param1:WindowMouseEvent) : void
      {
         var_282.unDeleteThread(var_506,param1.target.id);
      }
      
      private function onGoToFirstUnread(param1:WindowMouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.target.id;
         var _loc4_:class_1629;
         if(_loc4_ = var_1943.threadsById[_loc2_])
         {
            _loc3_ = Math.min(var_282.getThreadLastReadMessageIndex(_loc2_) + 1,_loc4_.nMessages - 1);
            var_282.goToMessageIndex(var_506.groupId,_loc2_,_loc3_);
         }
      }
   }
}
