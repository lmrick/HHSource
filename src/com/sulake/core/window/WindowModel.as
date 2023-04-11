package com.sulake.core.window
{
   import com.sulake.core.runtime.class_13;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowModel implements class_13
   {
       
      
      protected var _offsetX:int;
      
      protected var _offsetY:int;
      
      protected var var_29:int;
      
      protected var var_28:int;
      
      protected var var_1436:int;
      
      protected var var_1441:int;
      
      protected var var_1734:Rectangle;
      
      protected var var_1462:Rectangle;
      
      protected var var_1626:Rectangle;
      
      protected var var_1604:Rectangle;
      
      protected var _context:com.sulake.core.window.WindowContext;
      
      protected var _background:Boolean = false;
      
      protected var _fillColor:uint = 16777215;
      
      protected var var_3582:ColorTransform;
      
      protected var _alphaColor:uint;
      
      protected var var_2186:uint = 10;
      
      protected var var_2662:Boolean = true;
      
      protected var var_805:Boolean = true;
      
      protected var var_2092:Number = 1;
      
      protected var var_894:uint;
      
      protected var var_159:uint;
      
      protected var _style:uint;
      
      protected var var_271:uint;
      
      protected var _caption:String = "";
      
      protected var _name:String;
      
      protected var var_247:uint;
      
      protected var var_239:Array;
      
      protected var _disposed:Boolean = false;
      
      protected var var_2393:String = "";
      
      public function WindowModel(param1:uint, param2:String, param3:uint, param4:uint, param5:uint, param6:com.sulake.core.window.WindowContext, param7:Rectangle, param8:Array = null, param9:String = "")
      {
         super();
         var_247 = param1;
         _name = param2;
         var_271 = param3;
         var_894 = param5;
         var_159 = 0;
         _style = param4;
         var_239 = param8;
         _context = param6;
         var_2393 = param9;
         var_29 = param7.x;
         var_28 = param7.y;
         var_1436 = param7.width;
         var_1441 = param7.height;
         var_1734 = param7.clone();
         var_1462 = param7.clone();
      }
      
      public function get x() : int
      {
         return var_29;
      }
      
      public function get y() : int
      {
         return var_28;
      }
      
      public function get width() : int
      {
         return var_1436;
      }
      
      public function get height() : int
      {
         return var_1441;
      }
      
      public function get position() : Point
      {
         return new Point(var_29,var_28);
      }
      
      public function get rectangle() : Rectangle
      {
         return new Rectangle(var_29,var_28,var_1436,var_1441);
      }
      
      public function get context() : class_3178
      {
         return _context;
      }
      
      public function get mouseThreshold() : uint
      {
         return var_2186;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get background() : Boolean
      {
         return _background;
      }
      
      public function get clipping() : Boolean
      {
         return var_2662;
      }
      
      public function get visible() : Boolean
      {
         return var_805;
      }
      
      public function get color() : uint
      {
         return _fillColor;
      }
      
      public function get alpha() : uint
      {
         return _alphaColor >>> 24;
      }
      
      public function get blend() : Number
      {
         return var_2092;
      }
      
      public function get param() : uint
      {
         return var_894;
      }
      
      public function get state() : uint
      {
         return var_159;
      }
      
      public function get style() : uint
      {
         return _style;
      }
      
      public function get type() : uint
      {
         return var_271;
      }
      
      public function get caption() : String
      {
         return _caption;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get tags() : Array
      {
         return !!var_239 ? var_239 : (var_239 = []);
      }
      
      public function get left() : int
      {
         return var_29;
      }
      
      public function get top() : int
      {
         return var_28;
      }
      
      public function get right() : int
      {
         return var_29 + var_1436;
      }
      
      public function get bottom() : int
      {
         return var_28 + var_1441;
      }
      
      public function get renderingX() : int
      {
         return _offsetX + var_29;
      }
      
      public function get renderingY() : int
      {
         return _offsetY + var_28;
      }
      
      public function get renderingWidth() : int
      {
         return var_1436 + Math.abs(etchingPoint.x);
      }
      
      public function get renderingHeight() : int
      {
         return var_1441 + Math.abs(etchingPoint.y);
      }
      
      public function get renderingRectangle() : Rectangle
      {
         return new Rectangle(renderingX,renderingY,renderingWidth,renderingHeight);
      }
      
      public function get etchingPoint() : Point
      {
         return new Point(0,0);
      }
      
      public function get dynamicStyle() : String
      {
         return var_2393;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            _context = null;
            var_159 = 1073741824;
            var_239 = null;
            var_29 = var_28 = var_1436 = var_1441 = 0;
         }
      }
      
      public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      public function getInitialWidth() : int
      {
         return var_1734.width;
      }
      
      public function getInitialHeight() : int
      {
         return var_1734.height;
      }
      
      public function getPreviousWidth() : int
      {
         return var_1462.width;
      }
      
      public function getPreviousHeight() : int
      {
         return var_1462.height;
      }
      
      public function getMinimizedWidth() : int
      {
         return !!var_1626 ? var_1626.width : 0;
      }
      
      public function getMinimizedHeight() : int
      {
         return !!var_1626 ? var_1626.height : 0;
      }
      
      public function getMaximizedWidth() : int
      {
         return !!var_1604 ? var_1604.width : 2147483647;
      }
      
      public function getMaximizedHeight() : int
      {
         return !!var_1604 ? var_1604.height : 2147483647;
      }
      
      public function testTypeFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_271 & param2 ^ param1) == 0;
         }
         return (var_271 & param1) == param1;
      }
      
      public function testStateFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_159 & param2 ^ param1) == 0;
         }
         return (var_159 & param1) == param1;
      }
      
      public function testStyleFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (_style & param2 ^ param1) == 0;
         }
         return (_style & param1) == param1;
      }
      
      public function testParamFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_894 & param2 ^ param1) == 0;
         }
         return (var_894 & param1) == param1;
      }
   }
}
