package com.sulake.habbo.avatar.structure.figure
{
   import flash.geom.ColorTransform;
   
   public class PartColor implements IPartColor
   {
       
      
      private var var_247:int;
      
      private var _index:int;
      
      private var var_689:int;
      
      private var var_858:Boolean = false;
      
      private var var_3133:uint;
      
      private var _r:uint;
      
      private var _g:uint;
      
      private var _b:uint;
      
      private var var_3658:Number;
      
      private var var_3687:Number;
      
      private var var_3652:Number;
      
      private var var_1913:ColorTransform;
      
      public function PartColor(param1:XML)
      {
         super();
         var_247 = parseInt(param1.@id);
         _index = parseInt(param1.@index);
         var_689 = parseInt(param1.@club);
         var_858 = Boolean(parseInt(param1.@selectable));
         var _loc2_:String = param1.text();
         var_3133 = parseInt(_loc2_,16);
         _r = var_3133 >> 16 & 255;
         _g = var_3133 >> 8 & 255;
         _b = var_3133 >> 0 & 255;
         var_3658 = _r / 255 * 1;
         var_3687 = _g / 255 * 1;
         var_3652 = _b / 255 * 1;
         var_1913 = new ColorTransform(var_3658,var_3687,var_3652);
      }
      
      public function get colorTransform() : ColorTransform
      {
         return var_1913;
      }
      
      public function get redMultiplier() : Number
      {
         return var_3658;
      }
      
      public function get greenMultiplier() : Number
      {
         return var_3687;
      }
      
      public function get blueMultiplier() : Number
      {
         return var_3652;
      }
      
      public function get rgb() : uint
      {
         return var_3133;
      }
      
      public function get r() : uint
      {
         return _r;
      }
      
      public function get g() : uint
      {
         return _g;
      }
      
      public function get b() : uint
      {
         return _b;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get clubLevel() : int
      {
         return var_689;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_858;
      }
   }
}
