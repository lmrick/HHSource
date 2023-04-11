package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPetFigureUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const PET_FIGURE_UPDATE:String = "RWPIUE_PET_FIGURE_UPDATE";
       
      
      private var var_421:int;
      
      private var var_973:BitmapData;
      
      public function RoomWidgetPetFigureUpdateEvent(param1:int, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super("RWPIUE_PET_FIGURE_UPDATE",param3,param4);
         var_421 = param1;
         var_973 = param2;
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get image() : BitmapData
      {
         return var_973;
      }
   }
}
