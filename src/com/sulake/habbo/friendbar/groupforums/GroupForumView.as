package com.sulake.habbo.friendbar.groupforums
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ILabelWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IScrollableListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3258;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.utils.FriendlyTime;
   import com.sulake.habbo.window.widgets.class_3366;
   import package_155.class_1560;
   import package_155.class_1629;
   import package_155.class_1641;
   import package_155.class_1642;
   
   public class GroupForumView
   {
      
      private static const const_543:int = 100;
       
      
      private var var_282:com.sulake.habbo.friendbar.groupforums.GroupForumController;
      
      private var var_2034:com.sulake.habbo.friendbar.groupforums.ForumsListView;
      
      private var var_1860:com.sulake.habbo.friendbar.groupforums.ThreadListView;
      
      private var var_1788:com.sulake.habbo.friendbar.groupforums.MessageListView;
      
      private var _window:class_3281;
      
      private var var_2657:IScrollableListWindow;
      
      private var var_3491:class_3127;
      
      private var var_3714:class_3127;
      
      private var var_3584:class_3127;
      
      private var var_3661:class_3127;
      
      private var _txtElement:class_3127;
      
      private var _backButton:class_3258;
      
      private var _postButton:class_3258;
      
      private var var_3854:class_3127;
      
      private var var_3417:class_3127;
      
      private var var_3620:ITextWindow;
      
      private var var_1663:com.sulake.habbo.friendbar.groupforums.ForumsListData;
      
      private var var_506:class_1642;
      
      private var var_1943:com.sulake.habbo.friendbar.groupforums.ThreadsListData;
      
      private var var_2353:com.sulake.habbo.friendbar.groupforums.MessagesListData;
      
      private var var_1622:int = 1;
      
      private var var_1980:int = 1;
      
      private var var_671:int;
      
      public function GroupForumView(param1:com.sulake.habbo.friendbar.groupforums.GroupForumController)
      {
         super();
         var_282 = param1;
         var_671 = 20;
      }
      
      private static function enable(param1:class_3127, param2:Boolean) : void
      {
         if(param2)
         {
            param1.enable();
         }
         else
         {
            param1.disable();
         }
      }
      
      internal static function initTopAreaForForum(param1:class_3281, param2:class_1641) : IRegionWindow
      {
         var _loc4_:class_3151 = param1.findChildByName("top_part") as class_3151;
         var _loc6_:class_3217;
         (_loc6_ = class_3217(_loc4_.findChildByName("group_icon"))).visible = true;
         var _loc3_:class_3366 = _loc6_.widget as class_3366;
         _loc3_.badgeId = param2.icon;
         _loc3_.groupId = param2.groupId;
         _loc3_.type = "group";
         var _loc8_:IStaticBitmapWrapperWindow;
         if((_loc8_ = _loc4_.findChildByName("header_icon") as IStaticBitmapWrapperWindow) != null)
         {
            _loc8_.visible = false;
         }
         var _loc7_:ITextWindow;
         (_loc7_ = _loc4_.findChildByName("top_header_text") as ITextWindow).text = param2.name;
         var _loc5_:ITextWindow;
         (_loc5_ = _loc4_.findChildByName("top_text") as ITextWindow).text = param2.description;
         return _loc4_.findChildByName("top_click_area") as IRegionWindow;
      }
      
      public function dispose() : void
      {
         if(var_282)
         {
            var_282.closeMainView();
         }
         if(_window != null)
         {
            _window.removeEventListener("click",onClickButton);
            _window.dispose();
            _window = null;
            var_282 = null;
         }
      }
      
      private function initCommonControls() : void
      {
         var _loc2_:class_3127 = _window.findChildByName("settings_button");
         if(var_506 != null && false)
         {
            _loc2_.removeEventListener("WME_CLICK",onSettingsButtonClick);
            _loc2_.addEventListener("WME_CLICK",onSettingsButtonClick);
            _loc2_.visible = true;
         }
         else
         {
            _loc2_.visible = false;
         }
         var _loc1_:ILabelWindow = _backButton.findChildByName("back_button_label") as ILabelWindow;
         if(var_1860 != null)
         {
            _backButton.visible = true;
            _loc1_.text = var_282.localizationManager.getLocalization("groupforum.view.mark_read");
         }
         else if(var_1788 != null)
         {
            _backButton.visible = true;
            _loc1_.text = var_282.localizationManager.getLocalization("groupforum.view.back");
         }
         else if(var_2034 != null)
         {
            _backButton.visible = true;
            _loc1_.text = var_282.localizationManager.getLocalization("groupforum.view.mark_read");
         }
         else
         {
            _backButton.visible = false;
         }
         var _loc3_:ILabelWindow = _postButton.findChildByName("post_button_label") as ILabelWindow;
         if(var_1860 != null)
         {
            _postButton.visible = true;
            _loc3_.text = var_282.localizationManager.getLocalization("groupforum.view.start_thread");
         }
         else if(var_1788 != null)
         {
            _postButton.visible = true;
            _loc3_.text = var_282.localizationManager.getLocalization("groupforum.view.reply");
         }
         else
         {
            _postButton.visible = false;
         }
         var _loc4_:int = var_1622 + 1;
         _txtElement.caption = _loc4_ + " / " + var_1980;
         _window.scaler.enable();
         _window.scaler.visible = true;
         enable(var_3584,var_1622 > 0);
         enable(var_3491,var_1622 > 0);
         enable(var_3714,var_1622 < var_1980 - 1);
         enable(var_3661,var_1622 < var_1980 - 1);
         updateUnreadForumsCount(var_282.unreadForumsCount);
      }
      
      private function resetWindow() : void
      {
         if(_window != null)
         {
            var_2657.destroyListItems();
            var_2034 = null;
            var_1860 = null;
            var_1788 = null;
         }
         else
         {
            _window = var_282.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_main_view_xml())) as class_3281;
            var_2657 = _window.findChildByName("scrollable_message_list") as IScrollableListWindow;
            var_2657.scrollableWindow.addEventListener("WE_RESIZED",onResized,100);
            _window.center();
            _window.y = 100;
            _txtElement = _window.findChildByName("page_info");
            var_3491 = _window.findChildByName("show_previous");
            var_3491.addEventListener("WME_CLICK",onClickButton);
            var_3714 = _window.findChildByName("show_next");
            var_3714.addEventListener("WME_CLICK",onClickButton);
            var_3661 = _window.findChildByName("show_last");
            var_3661.addEventListener("WME_CLICK",onClickButton);
            var_3584 = _window.findChildByName("show_first");
            var_3584.addEventListener("WME_CLICK",onClickButton);
            _backButton = class_3258(_window.findChildByName("back_button"));
            _backButton.addEventListener("WME_CLICK",onClickButton);
            _postButton = class_3258(_window.findChildByName("post_button"));
            _postButton.addEventListener("WME_CLICK",onClickButton);
            var_3854 = _window.findChildByTag("close");
            var_3854.addEventListener("WME_CLICK",onClickButton);
            var_3417 = _window.findChildByName("list_header");
            var_3620 = ITextWindow(IItemListWindow(_window.findChildByName("shortcuts")).getListItemByName("my"));
         }
      }
      
      private function setStatusTextError(param1:String, param2:String) : void
      {
         var _loc3_:ITextWindow = ITextWindow(_window.findChildByName("status"));
         if(param2 == null || param2.length == 0)
         {
            _loc3_.caption = "";
         }
         else
         {
            param1 = String(var_282.localizationManager.getLocalization("groupforum.view.error.operation_" + param1));
            _loc3_.text = var_282.localizationManager.getLocalizationWithParams("groupforum.view.error." + param2,"","operation",param1);
         }
      }
      
      private function onSettingsButtonClick(param1:WindowMouseEvent) : void
      {
         openForumSettingsView();
      }
      
      private function onTopAreaClick(param1:WindowMouseEvent) : void
      {
         if(var_506 != null)
         {
            var_282.context.createLinkEvent("group/undefined");
         }
      }
      
      public function openForumsList(param1:com.sulake.habbo.friendbar.groupforums.ForumsListData) : void
      {
         resetWindow();
         var_1663 = param1;
         var_506 = null;
         var_1943 = null;
         var_2353 = null;
         var_1980 = calculateNumOfPagesAvailable(var_1663.totalAmount);
         var_1622 = Math.ceil(0);
         var_2034 = new com.sulake.habbo.friendbar.groupforums.ForumsListView(this,var_2657,var_1663.forums);
         var_2034.update();
         var_3417.caption = var_282.localizationManager.getLocalization("groupforum.view.forums_list.undefined");
         var _loc3_:class_3151 = _window.findChildByName("top_part") as class_3151;
         var _loc6_:class_3217;
         (_loc6_ = class_3217(_loc3_.findChildByName("group_icon"))).visible = false;
         var _loc8_:IStaticBitmapWrapperWindow;
         (_loc8_ = _loc3_.findChildByName("header_icon") as IStaticBitmapWrapperWindow).visible = true;
         _loc8_.assetUri = "forum_forum_listundefined";
         var _loc7_:ITextWindow;
         (_loc7_ = _loc3_.findChildByName("top_header_text") as ITextWindow).text = var_282.localizationManager.getLocalization("groupforum.view.forums_header.undefined");
         var _loc4_:ITextWindow;
         (_loc4_ = _loc3_.findChildByName("top_text") as ITextWindow).text = var_282.localizationManager.getLocalization("groupforum.view.forums_description.undefined");
         var _loc2_:IRegionWindow = _loc3_.findChildByName("top_click_area") as IRegionWindow;
         _loc2_.removeEventListener("WME_CLICK",onTopAreaClick);
         _loc2_.disable();
         initCommonControls();
         var _loc5_:ITextWindow;
         (_loc5_ = ITextWindow(_window.findChildByName("status"))).text = var_282.localizationManager.getLocalization("groupforum.view.forums_list.status");
      }
      
      public function get isForumsListOpened() : Boolean
      {
         return var_2034 != null;
      }
      
      public function openThreadList(param1:com.sulake.habbo.friendbar.groupforums.ForumsListData, param2:class_1642, param3:com.sulake.habbo.friendbar.groupforums.ThreadsListData) : void
      {
         resetWindow();
         var_1663 = param1;
         var_506 = param2;
         var_1943 = param3;
         var_2353 = null;
         var_1980 = calculateNumOfPagesAvailable(var_1943.totalThreads);
         var_1622 = Math.ceil(0);
         var_1860 = new com.sulake.habbo.friendbar.groupforums.ThreadListView(this,var_2657,var_506,var_1943);
         var_1860.update();
         var_3417.caption = var_282.localizationManager.getLocalization("groupforum.view.all_threads");
         if(false)
         {
            _postButton.enable();
            setStatusTextError("post_thread",null);
         }
         else
         {
            _postButton.disable();
            setStatusTextError("post_thread",var_506.postThreadPermissionError);
         }
         var _loc4_:IRegionWindow;
         (_loc4_ = GroupForumView.initTopAreaForForum(_window,var_506)).removeEventListener("WME_CLICK",onTopAreaClick);
         _loc4_.addEventListener("WME_CLICK",onTopAreaClick);
         _loc4_.enable();
         initCommonControls();
      }
      
      public function updateThread(param1:class_1629) : void
      {
         if(var_1860 != null)
         {
            var_1860.updateElement(param1);
         }
      }
      
      public function updateMessage(param1:class_1560) : void
      {
         if(var_1788 != null)
         {
            var_1788.updateElement(param1);
         }
      }
      
      public function openMessagesList(param1:com.sulake.habbo.friendbar.groupforums.ForumsListData, param2:class_1642, param3:com.sulake.habbo.friendbar.groupforums.ThreadsListData, param4:com.sulake.habbo.friendbar.groupforums.MessagesListData) : void
      {
         resetWindow();
         var_1663 = param1;
         var_506 = param2;
         var_1943 = param3;
         var_2353 = param4;
         var _loc7_:int = param4.threadId;
         var _loc5_:class_1629 = var_1943.threadsById[_loc7_];
         var_1980 = calculateNumOfPagesAvailable(param4.totalMessages);
         var _loc8_:int = param4.startIndex;
         var_1622 = Math.ceil(_loc8_ / 20);
         var_3417.caption = _loc5_.header;
         var_1788 = new com.sulake.habbo.friendbar.groupforums.MessageListView(this,var_2657,var_506,_loc5_,param4);
         var_1788.update();
         if(var_282.getGoToMessageIndex() > 0 && var_282.getGoToThreadId() == _loc7_)
         {
            var_1788.scrollToSpecificElement(var_282.getGoToMessageIndex(),true);
            var_282.resetGoTo();
         }
         if(false)
         {
            if(false || !_loc5_.isLocked)
            {
               _postButton.enable();
               setStatusTextError("post_message",null);
            }
            else
            {
               _postButton.disable();
               setStatusTextError("post_in_locked",var_506.moderatePermissionError);
            }
         }
         else
         {
            _postButton.disable();
            setStatusTextError("post_message",var_506.postMessagePermissionError);
         }
         var _loc6_:IRegionWindow;
         (_loc6_ = GroupForumView.initTopAreaForForum(_window,var_506)).removeEventListener("WME_CLICK",onTopAreaClick);
         _loc6_.addEventListener("WME_CLICK",onTopAreaClick);
         _loc6_.enable();
         initCommonControls();
      }
      
      public function get controller() : com.sulake.habbo.friendbar.groupforums.GroupForumController
      {
         return var_282;
      }
      
      private function calculateNumOfPagesAvailable(param1:int) : int
      {
         return Math.ceil(param1 / var_671);
      }
      
      private function getPreviousPageData() : void
      {
         var _loc1_:int = var_1622 - 1;
         if(_loc1_ >= 0)
         {
            requestNewPageData(_loc1_);
         }
      }
      
      private function getNextPageData() : void
      {
         var _loc1_:int = var_1622 + 1;
         if(_loc1_ <= var_1980)
         {
            requestNewPageData(_loc1_);
         }
      }
      
      private function getFirstPageData() : void
      {
         if(var_1622 == 0)
         {
            return;
         }
         requestNewPageData(0);
      }
      
      private function getLastPageData() : void
      {
         if(var_1622 >= var_1980)
         {
            return;
         }
         requestNewPageData(var_1980 - 1);
      }
      
      private function requestNewPageData(param1:int) : void
      {
         var _loc2_:int = param1 * var_671;
         if(var_2034 != null)
         {
            var_282.openForumsList(var_1663.listCode,_loc2_);
         }
         else if(var_1860 != null)
         {
            var_282.requestThreadList(var_506.groupId,_loc2_);
         }
         else if(var_1788 != null)
         {
            var_282.requestThreadMessageList(var_506.groupId,var_2353.threadId,_loc2_);
         }
         var_1622 = param1;
      }
      
      public function getAsDaysHoursMinutes(param1:int) : String
      {
         return FriendlyTime.getFriendlyTime(var_282.localizationManager,param1,".ago",1);
      }
      
      private function onResized(param1:class_3134 = null) : void
      {
         if(var_2034 != null)
         {
            var_2034.updateItemWidths();
         }
         if(var_1860 != null)
         {
            var_1860.updateItemWidths();
         }
         if(var_1788 != null)
         {
            var_1788.updateItemSizes();
         }
      }
      
      private function onClickButton(param1:WindowMouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "back_button":
               if(var_1788 != null)
               {
                  var_282.requestThreadList(var_506.groupId,var_1943.startIndex);
                  break;
               }
               if(var_1860 != null)
               {
                  var_282.markForumAsRead(true);
                  if(var_1663 != null)
                  {
                     var_282.openForumsList(var_1663.listCode,var_1663.startIndex);
                     break;
                  }
                  dispose();
                  break;
               }
               if(var_2034 != null)
               {
                  var_282.markForumsAsRead();
                  dispose();
                  break;
               }
               break;
            case "show_previous":
               getPreviousPageData();
               break;
            case "show_next":
               getNextPageData();
               break;
            case "show_last":
               getLastPageData();
               break;
            case "show_first":
               getFirstPageData();
               break;
            case "header_button_close":
               _window.visible = false;
               dispose();
               break;
            case "post_button":
               openComposeMessageView(var_2353 != null ? var_1943.threadsById[var_2353.threadId] : null);
         }
      }
      
      public function openComposeMessageView(param1:class_1629, param2:class_1560 = null) : void
      {
         if(false)
         {
            var_282.composeMessageView.focus(var_506,param1,param2);
         }
         else
         {
            var_282.composeMessageView = new ComposeMessageView(this,NaN,_window.y,var_506,param1,param2);
         }
      }
      
      public function openForumSettingsView() : void
      {
         if(false)
         {
            var_282.forumSettingsView.focus(var_506);
         }
         else
         {
            var_282.forumSettingsView = new ForumSettingsView(this,NaN,_window.y,var_506);
         }
      }
      
      public function updateUnreadForumsCount(param1:int) : void
      {
         if(param1 > 0)
         {
            var_3620.htmlText = var_282.localizationManager.getLocalizationWithParams("groupforum.view.shortcuts.my.unread","","unread_count",param1);
         }
         else
         {
            var_3620.htmlText = var_282.localizationManager.getLocalization("groupforum.view.shortcuts.my","");
         }
      }
   }
}
