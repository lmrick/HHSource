package com.sulake.habbo.avatar.structure.figure
{
   import flash.utils.Dictionary;
   
   public class Palette implements IPalette
   {
       
      
      private var var_247:int;
      
      private var _colors:Dictionary;
      
      public function Palette(param1:XML)
      {
         super();
         var_247 = parseInt(param1.@id);
         _colors = new Dictionary();
         append(param1);
      }
      
      public function append(param1:XML) : void
      {
         for each(var _loc2_ in param1.color)
         {
            _colors[String(_loc2_.@id)] = new PartColor(_loc2_);
         }
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function getColor(param1:int) : IPartColor
      {
         return _colors[String(param1)];
      }
      
      public function get colors() : Dictionary
      {
         return _colors;
      }
   }
}
