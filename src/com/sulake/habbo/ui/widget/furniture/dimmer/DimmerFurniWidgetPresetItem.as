package com.sulake.habbo.ui.widget.furniture.dimmer
{
   public class DimmerFurniWidgetPresetItem
   {
       
      
      private var var_247:int = 0;
      
      private var var_271:int = 0;
      
      private var _color:uint = 0;
      
      private var var_1063:uint = 0;
      
      public function DimmerFurniWidgetPresetItem(param1:int, param2:int, param3:uint, param4:uint)
      {
         super();
         var_247 = param1;
         var_271 = param2;
         _color = param3;
         var_1063 = param4;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get light() : uint
      {
         return var_1063;
      }
      
      public function set type(param1:int) : void
      {
         var_271 = param1;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
      }
      
      public function set light(param1:uint) : void
      {
         var_1063 = param1;
      }
   }
}
