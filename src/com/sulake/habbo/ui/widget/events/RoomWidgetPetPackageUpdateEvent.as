package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPetPackageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_688:String = "RWOPPUE_OPEN_PET_PACKAGE_REQUESTED";
      
      public static const OPEN_PET_PACKAGE_RESULT:String = "RWOPPUE_OPEN_PET_PACKAGE_RESULT";
      
      public static const OPEN_PET_PACKAGE_UPDATE_PET_IMAGE:String = "RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE";
       
      
      private var var_347:int = -1;
      
      private var var_1266:int = -1;
      
      private var var_973:BitmapData = null;
      
      private var _nameValidationStatus:int = 0;
      
      private var _nameValidationInfo:String = null;
      
      public function RoomWidgetPetPackageUpdateEvent(param1:String, param2:int, param3:BitmapData, param4:int, param5:String, param6:int, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_347 = param2;
         var_973 = param3;
         _nameValidationStatus = param4;
         _nameValidationInfo = param5;
         var_1266 = param6;
      }
      
      public function get nameValidationStatus() : int
      {
         return _nameValidationStatus;
      }
      
      public function get nameValidationInfo() : String
      {
         return _nameValidationInfo;
      }
      
      public function get image() : BitmapData
      {
         return var_973;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get typeId() : int
      {
         return var_1266;
      }
   }
}
