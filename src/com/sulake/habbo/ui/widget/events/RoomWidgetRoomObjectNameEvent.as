package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetRoomObjectNameEvent extends RoomWidgetUpdateEvent
   {
      
      public static const OBJECT_NAME:String = "RWONE_TYPE";
       
      
      private var var_339:int;
      
      private var var_774:int;
      
      private var _userName:String;
      
      private var var_876:int;
      
      private var var_783:int;
      
      public function RoomWidgetRoomObjectNameEvent(param1:int, param2:int, param3:String, param4:int, param5:int)
      {
         var_339 = param1;
         var_774 = param2;
         _userName = param3;
         var_876 = param4;
         var_783 = param5;
         super("RWONE_TYPE",false,false);
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get category() : int
      {
         return var_774;
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
   }
}
