package com.sulake.habbo.room.utils
{
   import com.sulake.room.object.IRoomObjectController;
   
   public class RoomObjectBadgeImageAssetListener
   {
       
      
      private var var_1795:IRoomObjectController;
      
      private var var_3759:Boolean;
      
      public function RoomObjectBadgeImageAssetListener(param1:IRoomObjectController, param2:Boolean)
      {
         super();
         var_1795 = param1;
         var_3759 = param2;
      }
      
      public function get object() : IRoomObjectController
      {
         return var_1795;
      }
      
      public function get groupBadge() : Boolean
      {
         return var_3759;
      }
   }
}
