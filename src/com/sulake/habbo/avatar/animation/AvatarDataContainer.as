package com.sulake.habbo.avatar.animation
{
   import com.sulake.core.utils.class_24;
   import flash.geom.ColorTransform;
   
   public class AvatarDataContainer implements IAvatarDataContainer
   {
       
      
      private var var_3717:int;
      
      private var var_3757:uint;
      
      private var var_4149:uint;
      
      private var var_1913:ColorTransform;
      
      private var var_3133:uint;
      
      private var _r:uint;
      
      private var _g:uint;
      
      private var _b:uint;
      
      private var var_3658:Number = 1;
      
      private var var_3687:Number = 1;
      
      private var var_3652:Number = 1;
      
      private var var_2486:Number = 1;
      
      private var var_2997:class_24;
      
      private var var_4081:Boolean = true;
      
      public function AvatarDataContainer(param1:XML)
      {
         super();
         var_3717 = parseInt(param1.@ink);
         var _loc2_:String = String(param1.@foreground);
         _loc2_ = _loc2_.replace("#","");
         var _loc3_:String = String(param1.@background);
         _loc3_ = _loc3_.replace("#","");
         var_3757 = parseInt(_loc2_,16);
         var_4149 = parseInt(_loc3_,16);
         var_3133 = parseInt(_loc2_,16);
         _r = var_3133 >> 16 & 255;
         _g = var_3133 >> 8 & 255;
         _b = var_3133 >> 0 & 255;
         var_3658 = _r / 255 * 1;
         var_3687 = _g / 255 * 1;
         var_3652 = _b / 255 * 1;
         if(var_3717 == 37)
         {
            var_2486 = 0.5;
            var_4081 = false;
         }
         var_1913 = new ColorTransform(var_3658,var_3687,var_3652,var_2486);
         var_2997 = generatePaletteMapForGrayscale(var_4149,var_3757);
      }
      
      public function get ink() : int
      {
         return var_3717;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return var_1913;
      }
      
      public function get reds() : Array
      {
         return var_2997.getValue("reds") as Array;
      }
      
      public function get greens() : Array
      {
         return var_2997.getValue("greens") as Array;
      }
      
      public function get blues() : Array
      {
         return var_2997.getValue("blues") as Array;
      }
      
      public function get alphas() : Array
      {
         return var_2997.getValue("alphas") as Array;
      }
      
      public function get paletteIsGrayscale() : Boolean
      {
         return var_4081;
      }
      
      private function generatePaletteMapForGrayscale(param1:uint, param2:uint) : class_24
      {
         var _loc9_:int = 0;
         var _loc15_:* = param1 >> 24 & 255;
         var _loc24_:* = param1 >> 16 & 255;
         var _loc10_:* = param1 >> 8 & 255;
         var _loc14_:* = param1 >> 0 & 255;
         var _loc17_:* = param2 >> 24 & 255;
         var _loc3_:* = param2 >> 16 & 255;
         var _loc11_:* = param2 >> 8 & 255;
         var _loc16_:* = param2 >> 0 & 255;
         var _loc21_:Number = (_loc17_ - _loc15_) / 255;
         var _loc12_:Number = (_loc3_ - _loc24_) / 255;
         var _loc6_:Number = (_loc11_ - _loc10_) / 255;
         var _loc23_:Number = (_loc16_ - _loc14_) / 255;
         var _loc22_:class_24 = new class_24();
         var _loc19_:* = [];
         var _loc8_:* = [];
         var _loc13_:* = [];
         var _loc20_:* = [];
         var _loc4_:Number = _loc15_;
         var _loc18_:Number = _loc24_;
         var _loc7_:Number = _loc10_;
         var _loc5_:Number = _loc14_;
         _loc9_ = 0;
         while(_loc9_ < 256)
         {
            if(_loc18_ == _loc24_ && _loc7_ == _loc10_ && _loc5_ == _loc14_)
            {
               _loc4_ = 0;
            }
            _loc4_ += _loc21_;
            _loc18_ += _loc12_;
            _loc7_ += _loc6_;
            _loc5_ += _loc23_;
            _loc20_.push(_loc4_ << 24);
            _loc19_.push(_loc4_ << 24 | _loc18_ << 16 | _loc7_ << 8 | _loc5_);
            _loc8_.push(_loc4_ << 24 | _loc18_ << 16 | _loc7_ << 8 | _loc5_);
            _loc13_.push(_loc4_ << 24 | _loc18_ << 16 | _loc7_ << 8 | _loc5_);
            _loc9_++;
         }
         _loc22_.add("alphas",_loc19_);
         _loc22_.add("reds",_loc19_);
         _loc22_.add("greens",_loc8_);
         _loc22_.add("blues",_loc13_);
         return _loc22_;
      }
   }
}
