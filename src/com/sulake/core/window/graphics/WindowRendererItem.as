package com.sulake.core.window.graphics
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.graphics.renderer.ISkinRenderer;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowRendererItem implements class_13
   {
      
      protected static const RENDER_TYPE_NULL:uint = 0;
      
      protected static const RENDER_TYPE_SKIN:uint = 1;
      
      protected static const RENDER_TYPE_FILL:uint = 2;
      
      protected static const MATRIX:Matrix = new Matrix();
      
      protected static const COLOR_TRANSFORM:ColorTransform = new ColorTransform();
       
      
      protected var var_1577:TrackedBitmapData;
      
      protected var var_2002:com.sulake.core.window.graphics.ISkinContainer;
      
      protected var _disposed:Boolean;
      
      protected var _refresh:Boolean;
      
      protected var var_3060:uint;
      
      protected var var_2557:uint;
      
      public function WindowRendererItem(param1:com.sulake.core.window.graphics.ISkinContainer)
      {
         super();
         _disposed = false;
         var_2002 = param1;
         var_3060 = 4294967295;
         var_2557 = 0;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get buffer() : BitmapData
      {
         return var_1577;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_2002 = null;
            if(var_1577 != null)
            {
               var_1577.dispose();
               var_1577 = null;
            }
         }
      }
      
      public function purge() : void
      {
      }
      
      public function render(param1:class_3127, param2:Point, param3:Rectangle, param4:Rectangle, param5:BitmapData) : BitmapData
      {
         var _loc12_:Boolean = false;
         var _loc6_:BitmapData = null;
         var _loc13_:* = uint(param1.background ? 2 : 0);
         var _loc7_:ISkinRenderer;
         if((_loc7_ = var_2002.getSkinRendererByTypeAndStyle(param1.type,param1.style)) != null)
         {
            if(_loc7_.isStateDrawable(var_2557))
            {
               _loc13_ = 1;
            }
         }
         var _loc11_:int = Math.max(param1.renderingWidth,1);
         var _loc8_:int = Math.max(param1.renderingHeight,1);
         var _loc9_:Boolean = true;
         if(_loc13_ != 0)
         {
            if(!var_1577 || var_1577.width != _loc11_ || var_1577.height != _loc8_)
            {
               if(var_1577)
               {
                  var_1577.dispose();
               }
               var_1577 = new TrackedBitmapData(this,_loc11_,_loc8_,true,param1.color);
               _refresh = true;
               _loc9_ = false;
            }
         }
         var _loc14_:IGraphicContext;
         if(_loc14_ = IGraphicContextHost(param1).getGraphicContext(false))
         {
            if(!_loc14_.visible)
            {
               _loc14_.visible = true;
            }
            _loc12_ = param1.testParamFlag(1073741824);
            if(_loc6_ = _loc14_.setDrawRegion(param1.renderingRectangle,!param1.testParamFlag(16),_loc12_ ? param4 : null))
            {
               param5 = _loc6_;
               _refresh = true;
            }
         }
         var _loc10_:* = !param1.testParamFlag(16);
         if(_loc13_ != 0)
         {
            if(param5 != null)
            {
               param5.lock();
               if(_loc13_ == 1)
               {
                  if(_refresh)
                  {
                     if(_loc10_)
                     {
                        param5.fillRect(param3,0);
                     }
                     _refresh = false;
                     if(_loc9_)
                     {
                        var_1577.fillRect(var_1577.rect,param1.color);
                     }
                     _loc7_.draw(param1,var_1577,var_1577.rect,var_2557,false);
                  }
                  if(param1.blend < 1 && !_loc10_)
                  {
                     MATRIX.tx = param2.x - param3.x;
                     MATRIX.ty = param2.y - param3.y;
                     COLOR_TRANSFORM.alphaMultiplier = param1.blend;
                     param3.offset(MATRIX.tx,MATRIX.ty);
                     param5.draw(var_1577,MATRIX,COLOR_TRANSFORM,null,param3,false);
                     param3.offset(0,0);
                  }
                  else
                  {
                     param5.copyPixels(var_1577,param3,param2,null,null,true);
                  }
               }
               else if(_loc13_ == 2)
               {
                  if(!_loc10_)
                  {
                     var_1577.fillRect(var_1577.rect,param1.color);
                     param5.copyPixels(var_1577,param3,param2,null,null,true);
                  }
                  else
                  {
                     param5.fillRect(new Rectangle(param2.x,param2.y,param3.width,param3.height),param1.color);
                     _loc14_.blend = param1.blend;
                  }
               }
               param5.unlock();
            }
         }
         else if(_refresh && _loc10_)
         {
            _refresh = false;
            if(param5 != null)
            {
               param5.fillRect(param3,0);
            }
         }
         var_3060 = var_2557;
         return param5;
      }
      
      public function testForStateChange(param1:class_3127) : Boolean
      {
         return var_2002.getTheActualState(param1.type,param1.style,param1.state) != var_3060;
      }
      
      public function invalidate(param1:class_3127, param2:uint) : Boolean
      {
         var _loc4_:IGraphicContext = null;
         var _loc3_:Boolean = false;
         switch(param2)
         {
            case 1:
               _refresh = true;
               _loc3_ = true;
               break;
            case 2:
               _refresh = true;
               _loc3_ = true;
               break;
            case 4:
               if(param1.testParamFlag(16))
               {
                  _loc3_ = true;
                  break;
               }
               (_loc4_ = IGraphicContextHost(param1).getGraphicContext(true)).setDrawRegion(param1.renderingRectangle,false,null);
               if(!_loc4_.visible)
               {
                  _loc3_ = true;
                  break;
               }
               break;
            case 8:
               var_2557 = var_2002.getTheActualState(param1.type,param1.style,param1.state);
               if(var_2557 != var_3060)
               {
                  _refresh = true;
                  _loc3_ = true;
                  break;
               }
               break;
            case 16:
               if(param1.testParamFlag(16))
               {
                  _refresh = true;
                  _loc3_ = true;
                  break;
               }
               IGraphicContextHost(param1).getGraphicContext(true).blend = param1.blend;
               break;
            case 32:
               _loc3_ = true;
         }
         return _loc3_;
      }
      
      private function drawRect(param1:BitmapData, param2:Rectangle, param3:uint) : void
      {
         var _loc4_:int = 0;
         _loc4_ = param2.left;
         while(_loc4_ < param2.right)
         {
            param1.setPixel32(_loc4_,param2.top,param3);
            param1.setPixel32(_loc4_,param2.bottom - 1,param3);
            _loc4_++;
         }
         _loc4_ = param2.top;
         while(_loc4_ < param2.bottom)
         {
            param1.setPixel32(param2.left,_loc4_,param3);
            param1.setPixel32(param2.right - 1,_loc4_,param3);
            _loc4_++;
         }
      }
   }
}
