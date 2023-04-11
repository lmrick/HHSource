package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetSpamWallPostItEditEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_629:String = "RWSWPUE_OPEN_EDITOR";
       
      
      private var var_347:int;
      
      private var _location:String;
      
      private var var_3053:String;
      
      public function RoomWidgetSpamWallPostItEditEvent(param1:String, param2:int, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_347 = param2;
         _location = param3;
         var_3053 = param4;
      }
      
      public function get location() : String
      {
         return _location;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get objectType() : String
      {
         return var_3053;
      }
   }
}
