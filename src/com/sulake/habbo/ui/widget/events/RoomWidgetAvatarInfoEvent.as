package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetAvatarInfoEvent extends RoomWidgetUpdateEvent
   {
      
      public static const AVATAR_INFO:String = "RWAIE_AVATAR_INFO";
       
      
      private var var_339:int;
      
      private var _userName:String;
      
      private var var_876:int;
      
      private var var_3470:Boolean;
      
      private var var_783:int;
      
      public function RoomWidgetAvatarInfoEvent(param1:int, param2:String, param3:int, param4:int, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super("RWAIE_AVATAR_INFO",param6,param7);
         var_339 = param1;
         _userName = param2;
         var_876 = param3;
         var_783 = param4;
         var_3470 = param5;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get userType() : int
      {
         return var_876;
      }
      
      public function get roomIndex() : int
      {
         return var_783;
      }
      
      public function get allowNameChange() : Boolean
      {
         return var_3470;
      }
   }
}
