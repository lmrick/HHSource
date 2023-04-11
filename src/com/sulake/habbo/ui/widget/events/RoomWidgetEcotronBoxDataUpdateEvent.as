package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetEcotronBoxDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const UPDATE_PACKAGEINFO:String = "RWEBDUE_PACKAGEINFO";
      
      public static const const_473:String = "RWEBDUE_CONTENTS";
       
      
      private var var_347:int = -1;
      
      private var _text:String;
      
      private var _furniTypeName:String;
      
      private var var_282:Boolean;
      
      private var var_3891:BitmapData;
      
      public function RoomWidgetEcotronBoxDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:Boolean = false, param6:BitmapData = null, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_347 = param2;
         _text = param3;
         _furniTypeName = param4;
         var_282 = param5;
         var_3891 = param6;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      public function get controller() : Boolean
      {
         return var_282;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_3891;
      }
      
      public function get furniTypeName() : String
      {
         return _furniTypeName;
      }
   }
}
