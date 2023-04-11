package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetAchievementResolutionTrophyDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const UPDATE_TROPHY_DATA:String = "RWARTDUE_TROPHY_DATA";
       
      
      private var _color:Number;
      
      private var _name:String;
      
      private var var_156:String;
      
      private var var_357:String;
      
      private var var_3592:int;
      
      public function RoomWidgetAchievementResolutionTrophyDataUpdateEvent(param1:String, param2:Number, param3:String, param4:String, param5:String, param6:int, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         _color = param2;
         _name = param3;
         var_156 = param4;
         var_357 = param5;
         var_3592 = param6;
      }
      
      public function get color() : Number
      {
         return _color;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get date() : String
      {
         return var_156;
      }
      
      public function get message() : String
      {
         return var_357;
      }
      
      public function get viewType() : int
      {
         return var_3592;
      }
   }
}
