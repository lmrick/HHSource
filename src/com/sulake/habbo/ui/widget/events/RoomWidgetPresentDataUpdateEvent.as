package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const UPDATE_PACKAGEINFO:String = "RWPDUE_PACKAGEINFO";
      
      public static const const_473:String = "RWPDUE_CONTENTS";
      
      public static const const_595:String = "RWPDUE_CONTENTS_CLUB";
      
      public static const const_1136:String = "RWPDUE_CONTENTS_FLOOR";
      
      public static const UPDATE_CONTENTS_LANDSCAPE:String = "RWPDUE_CONTENTS_LANDSCAPE";
      
      public static const UPDATE_CONTENTS_WALLPAPER:String = "RWPDUE_CONTENTS_WALLPAPER";
      
      public static const UPDATE_CONTENTS_IMAGE:String = "RWPDUE_CONTENTS_IMAGE";
       
      
      private var var_347:int = -1;
      
      private var var_385:int = 0;
      
      private var var_261:String = "";
      
      private var _text:String;
      
      private var var_282:Boolean;
      
      private var var_3891:BitmapData;
      
      private var _purchaserName:String;
      
      private var var_4046:String;
      
      private var var_1101:int = -1;
      
      private var var_1278:String = "";
      
      private var _placedInRoom:Boolean;
      
      public function RoomWidgetPresentDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:String = null, param7:String = null, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param8,param9);
         var_347 = param2;
         _text = param3;
         var_282 = param4;
         var_3891 = param5;
         _purchaserName = param6;
         var_4046 = param7;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get classId() : int
      {
         return var_385;
      }
      
      public function set classId(param1:int) : void
      {
         var_385 = param1;
      }
      
      public function get itemType() : String
      {
         return var_261;
      }
      
      public function set itemType(param1:String) : void
      {
         var_261 = param1;
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
      
      public function get purchaserName() : String
      {
         return _purchaserName;
      }
      
      public function get purchaserFigure() : String
      {
         return var_4046;
      }
      
      public function get placedItemId() : int
      {
         return var_1101;
      }
      
      public function set placedItemId(param1:int) : void
      {
         var_1101 = param1;
      }
      
      public function get placedInRoom() : Boolean
      {
         return _placedInRoom;
      }
      
      public function set placedInRoom(param1:Boolean) : void
      {
         _placedInRoom = param1;
      }
      
      public function get placedItemType() : String
      {
         return var_1278;
      }
      
      public function set placedItemType(param1:String) : void
      {
         var_1278 = param1;
      }
   }
}
