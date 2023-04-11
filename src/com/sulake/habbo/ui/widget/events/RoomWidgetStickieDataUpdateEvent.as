package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const UPDATE_STICKIE_DATA:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_347:int = -1;
      
      private var var_3053:String;
      
      private var _text:String;
      
      private var var_962:String;
      
      private var var_282:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_347 = param2;
         var_3053 = param3;
         _text = param4;
         var_962 = param5;
         var_282 = param6;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get objectType() : String
      {
         return var_3053;
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      public function get colorHex() : String
      {
         return var_962;
      }
      
      public function get controller() : Boolean
      {
         return var_282;
      }
   }
}
