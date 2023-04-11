package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetUpdateRoomPreviewEvent extends Event
   {
       
      
      private var var_371:String = "default";
      
      private var var_351:String = "default";
      
      private var var_558:String = "1.1";
      
      private var var_3747:int = 64;
      
      public function CatalogWidgetUpdateRoomPreviewEvent(param1:String, param2:String, param3:String, param4:int, param5:Boolean = false, param6:Boolean = false)
      {
         super("UPDATE_ROOM_PREVIEW",param5,param6);
         var_351 = param1;
         var_371 = param2;
         var_558 = param3;
         var_3747 = param4;
      }
      
      public function get wallType() : String
      {
         return var_371;
      }
      
      public function get floorType() : String
      {
         return var_351;
      }
      
      public function get landscapeType() : String
      {
         return var_558;
      }
      
      public function get tileSize() : int
      {
         return var_3747;
      }
   }
}
