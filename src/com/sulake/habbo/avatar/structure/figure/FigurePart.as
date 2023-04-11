package com.sulake.habbo.avatar.structure.figure
{
   public class FigurePart implements IFigurePart
   {
       
      
      private var var_247:int;
      
      private var var_271:String;
      
      private var var_3745:int = -1;
      
      private var var_3940:int;
      
      private var _index:int;
      
      private var var_3746:int = -1;
      
      public function FigurePart(param1:XML)
      {
         super();
         var_247 = parseInt(param1.@id);
         var_271 = String(param1.@type);
         _index = parseInt(param1.@index);
         var_3940 = parseInt(param1.@colorindex);
         var _loc2_:String = param1.@palettemapid;
         if(_loc2_ != "")
         {
            var_3746 = int(_loc2_);
         }
         var _loc3_:String = param1.@breed;
         if(_loc3_ != "")
         {
            var_3745 = int(_loc3_);
         }
      }
      
      public function dispose() : void
      {
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get breed() : int
      {
         return var_3745;
      }
      
      public function get colorLayerIndex() : int
      {
         return var_3940;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get paletteMap() : int
      {
         return var_3746;
      }
   }
}
