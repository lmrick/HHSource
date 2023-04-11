package com.sulake.habbo.friendbar.groupforums
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IScrollableListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.widgets.class_3366;
   import package_155.class_1641;
   
   public class ForumsListView
   {
       
      
      private var var_282:com.sulake.habbo.friendbar.groupforums.GroupForumController;
      
      private var var_1534:com.sulake.habbo.friendbar.groupforums.GroupForumView;
      
      private var var_19:IScrollableListWindow;
      
      private var var_3484:class_3151;
      
      private var _forums:Array;
      
      public function ForumsListView(param1:com.sulake.habbo.friendbar.groupforums.GroupForumView, param2:IScrollableListWindow, param3:Array)
      {
         super();
         var_1534 = param1;
         var_282 = var_1534.controller;
         var_19 = param2;
         var_3484 = var_282.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_forum_list_item_xml())) as class_3151;
         _forums = param3;
      }
      
      public function update() : void
      {
         var _loc3_:int = 0;
         var _loc2_:class_3151 = null;
         var _loc1_:class_1641 = null;
         var_19.invalidate();
         _loc3_ = 0;
         while(_loc3_ < _forums.length)
         {
            _loc1_ = _forums[_loc3_];
            _loc2_ = var_3484.clone() as class_3151;
            _loc2_.name = "forum_" + _loc1_.groupId;
            updateListItem(_loc2_,_loc1_,_loc3_);
            var_19.addListItem(_loc2_);
            _loc3_++;
         }
         updateItemWidths();
      }
      
      private function updateListItem(param1:class_3151, param2:class_1641, param3:int) : void
      {
         var _loc5_:class_3151;
         (_loc5_ = param1 as class_3151).color = !!((param3 + 1) % 2) ? 4293852927 : 4289914618;
         var _loc6_:int = param2.unreadMessages;
         var _loc9_:class_3127;
         (_loc9_ = _loc5_.findChildByName("texts_container")).id = param2.groupId;
         var _loc8_:ITextWindow;
         (_loc8_ = _loc5_.findChildByName("header") as ITextWindow).bold = _loc6_ > 0;
         _loc8_.text = param2.name;
         (_loc9_ = _loc5_.findChildByName("header_region")).id = param2.groupId;
         _loc9_.removeEventListener("WME_CLICK",onOpenForum);
         _loc9_.addEventListener("WME_CLICK",onOpenForum);
         (_loc9_ = _loc5_.findChildByName("details")).caption = var_282.localizationManager.getLocalizationWithParams("groupforum.view.forum_details","","rating",param2.leaderboardScore,"last_author_id",param2.lastMessageAuthorId,"last_author_name",param2.lastMessageAuthorName,"update_time",var_1534.getAsDaysHoursMinutes(param2.lastMessageTimeAsSecondsAgo));
         (_loc9_ = _loc5_.findChildByName("unread_texts_container")).id = param2.groupId;
         (_loc9_ = _loc5_.findChildByName("unread_region")).id = param2.groupId;
         _loc9_.removeEventListener("WME_CLICK",onOpenForum);
         _loc9_.addEventListener("WME_CLICK",onOpenForum);
         (_loc8_ = _loc5_.findChildByName("messages1") as ITextWindow).bold = _loc6_ > 0;
         _loc8_.text = var_282.localizationManager.getLocalizationWithParams("groupforum.view.thread_details1","","total_messages",param2.totalMessages,"new_messages",_loc6_);
         (_loc8_ = _loc5_.findChildByName("messages2") as ITextWindow).bold = _loc6_ > 0;
         _loc8_.text = var_282.localizationManager.getLocalizationWithParams("groupforum.view.thread_details2","","total_messages",param2.totalMessages,"new_messages",_loc6_);
         var _loc4_:class_3366;
         var _loc7_:class_3217;
         (_loc4_ = (_loc7_ = class_3217(_loc5_.findChildByName("group_icon"))).widget as class_3366).badgeId = param2.icon;
         _loc4_.groupId = param2.groupId;
         _loc4_.type = "group";
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
      
      private function onOpenForum(param1:WindowMouseEvent) : void
      {
         var_282.openGroupForum(param1.target.id);
      }
   }
}
