package com.sulake.habbo.navigator.mainview
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.domain.RoomSessionTags;
   import package_11.class_1670;
   
   public class PromotedRoomsGuestRoomListCtrl extends GuestRoomListCtrl
   {
       
      
      private var var_774:class_1670;
      
      public function PromotedRoomsGuestRoomListCtrl(param1:HabboNavigator)
      {
         super(param1,-6,false);
      }
      
      public function set category(param1:class_1670) : void
      {
         var_774 = param1;
      }
      
      override public function getRooms() : Array
      {
         return var_774.rooms;
      }
      
      override public function beforeEnterRoom(param1:int) : void
      {
         navigator.data.roomSessionTags = new RoomSessionTags(var_774.code,"" + (param1 + 2));
      }
   }
}
