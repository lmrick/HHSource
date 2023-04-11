package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.utils.class_3268;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class BitmapDataRenderer extends SkinRenderer
   {
      
      protected static const _MATRIX:Matrix = new Matrix();
      
      protected static const const_410:ColorTransform = new ColorTransform();
      
      protected static const const_411:ColorTransform = new ColorTransform(0,0,0,1,1,1,1,0);
      
      protected static const _GREYSCALE_FILTER:ColorMatrixFilter = new ColorMatrixFilter();
      
      protected static const const_630:Number = 0.212671;
      
      protected static const const_986:Number = 0.71516;
      
      protected static const B:Number = 0.072169;
       
      
      public function BitmapDataRenderer(param1:String)
      {
         super(param1);
      }
      
      override public function draw(param1:class_3127, param2:BitmapData, param3:Rectangle, param4:uint, param5:Boolean) : void
      {
         var _loc11_:int = 0;
         var _loc17_:int = 0;
         var _loc16_:int = 0;
         var _loc18_:int = 0;
         var _loc15_:int = 0;
         var _loc14_:int = 0;
         var _loc9_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc13_:int = 0;
         var _loc12_:int = 0;
         var _loc6_:class_3268;
         var _loc10_:BitmapData = (_loc6_ = param1 as class_3268).bitmapData;
         if(param2 != null && _loc10_ != null)
         {
            _loc11_ = (_loc6_.stretchedX ? param1.width : _loc10_.width) * _loc6_.zoomX;
            _loc17_ = (_loc6_.stretchedY ? param1.height : _loc10_.height) * _loc6_.zoomY;
            _loc16_ = !_loc6_.wrapX ? 1 : param1.width / _loc11_ + 2;
            _loc18_ = !_loc6_.wrapY ? 1 : param1.height / _loc17_ + 2;
            _MATRIX.a = _loc11_ / _loc10_.width;
            _MATRIX.d = _loc17_ / _loc10_.height;
            switch(int(_loc6_.pivotPoint))
            {
               case 0:
               case 3:
               case 6:
                  _MATRIX.tx = _loc6_.zoomX < 0 ? -_loc11_ : 0;
                  break;
               case 1:
               case 4:
               case 7:
                  _MATRIX.tx = int((param1.width - _loc11_) / 2);
                  break;
               case 2:
               case 5:
               case 8:
                  _MATRIX.tx = _loc6_.zoomX < 0 ? param1.width : param1.width - _loc11_;
            }
            _loc15_ = 0;
            while(_loc6_.wrapX && _loc15_ > 0)
            {
               _loc15_ -= _loc11_;
            }
            switch(int(_loc6_.pivotPoint))
            {
               case 0:
               case 1:
               case 2:
                  _MATRIX.ty = _loc6_.zoomY < 0 ? -_loc17_ : 0;
                  break;
               case 3:
               case 4:
               case 5:
                  _MATRIX.ty = int((param1.height - _loc17_) / 2);
                  break;
               case 6:
               case 7:
               case 8:
                  _MATRIX.ty = _loc6_.zoomY < 0 ? param1.height : param1.height - _loc17_;
            }
            _loc14_ = 0;
            while(_loc6_.wrapY && _loc14_ > 0)
            {
               _loc14_ -= _loc17_;
            }
            _loc9_ = ((param1.color & 16711680) >> 16) / 255;
            _loc8_ = ((param1.color & 65280) >> 8) / 255;
            _loc7_ = (param1.color & 255) / 255;
            const_411.alphaMultiplier = (_loc6_.etchingColor >> 24 & 255) / 255;
            const_411.redOffset = _loc6_.etchingColor >> 16 & 255;
            const_411.greenOffset = _loc6_.etchingColor >> 8 & 255;
            const_411.blueOffset = _loc6_.etchingColor & 255;
            param2.lock();
            _MATRIX.ty = _loc14_;
            _loc13_ = 0;
            while(_loc13_ < _loc18_)
            {
               _MATRIX.tx = _loc15_;
               _loc12_ = 0;
               while(_loc12_ < _loc16_)
               {
                  if(_loc6_.greyscale)
                  {
                     _GREYSCALE_FILTER.matrix = [_loc9_ * 0.212671,_loc9_ * 0.71516,_loc9_ * 0.072169,0,0,_loc8_ * 0.212671,_loc8_ * 0.71516,_loc8_ * 0.072169,0,0,_loc7_ * 0.212671,_loc7_ * 0.71516,_loc7_ * 0.072169,0,0,0,0,0,1,0];
                     if(false)
                     {
                        _MATRIX.tx += _loc6_.etchingPoint.x;
                        _MATRIX.ty += _loc6_.etchingPoint.y;
                        param2.draw(_loc10_,_MATRIX,const_411,null,null,false);
                        _MATRIX.tx = 0 - _loc6_.etchingPoint.x;
                        _MATRIX.ty = 0 - _loc6_.etchingPoint.y;
                     }
                     param2.draw(_loc10_,_MATRIX,null,null,null,false);
                     param2.applyFilter(param2,param2.rect,new Point(),_GREYSCALE_FILTER);
                  }
                  else
                  {
                     const_410.redMultiplier = _loc9_;
                     const_410.greenMultiplier = _loc8_;
                     const_410.blueMultiplier = _loc7_;
                     const_410.alphaMultiplier = 1;
                     const_410.redOffset = 0;
                     const_410.greenOffset = 0;
                     const_410.blueOffset = 0;
                     const_410.alphaOffset = 0;
                     if(param1.dynamicStyleColor)
                     {
                        const_410.concat(param1.dynamicStyleColor);
                     }
                     if(false)
                     {
                        _MATRIX.tx += _loc6_.etchingPoint.x;
                        _MATRIX.ty += _loc6_.etchingPoint.y;
                        param2.draw(_loc10_,_MATRIX,const_411,null,null,false);
                        _MATRIX.tx = 0 - _loc6_.etchingPoint.x;
                        _MATRIX.ty = 0 - _loc6_.etchingPoint.y;
                     }
                     param2.draw(_loc10_,_MATRIX,const_410,null,null,false);
                  }
                  _MATRIX.tx += _loc11_;
                  _loc12_++;
               }
               _MATRIX.ty += _loc17_;
               _loc13_++;
            }
            param2.unlock();
         }
      }
      
      override public function isStateDrawable(param1:uint) : Boolean
      {
         return param1 == 0;
      }
   }
}
