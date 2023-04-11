package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectGroupBadgeUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const BADGE_LOADED:String = "ROGBUM_BADGE_LOADED";
       
      
      private var var_484:String;
      
      private var _assetName:String;
      
      public function RoomObjectGroupBadgeUpdateMessage(param1:String, param2:String)
      {
         super(null,null);
         var_484 = param1;
         _assetName = param2;
      }
      
      public function get badgeId() : String
      {
         return var_484;
      }
      
      public function get assetName() : String
      {
         return _assetName;
      }
   }
}
