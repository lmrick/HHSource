package com.sulake.core.window.graphics
{
   import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.IBitmapDrawable;
   import flash.display.MorphShape;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class GraphicContext extends Sprite implements IGraphicContext
   {
      
      public static const const_1021:uint = 0;
      
      public static const GC_TYPE_BITMAP:uint = 1;
      
      public static const const_840:uint = 2;
      
      public static const GC_TYPE_CONTAINER:uint = 4;
      
      public static const GC_TYPE_SHAPE:uint = 8;
      
      public static const GC_TYPE_MORPH_SHAPE:uint = 16;
      
      public static const const_1042:uint = 64;
      
      public static const const_817:uint = 128;
      
      public static const const_717:uint = 256;
      
      protected static var var_1186:uint = 0;
      
      protected static var var_2206:uint = 0;
       
      
      protected var var_1657:DisplayObjectContainer;
      
      protected var _useAlpha:Boolean;
      
      protected var var_2252:Boolean;
      
      protected var _disposed:Boolean = false;
      
      protected var _rectangle:Rectangle;
      
      protected var var_1650:Shape;
      
      public function GraphicContext(param1:String, param2:uint, param3:Rectangle)
      {
         var _loc4_:TextField = null;
         super();
         var_1186++;
         if(param3 == null)
         {
            param3 = new Rectangle(0,0,0,0);
         }
         this.name = param1;
         this.mouseEnabled = false;
         this.doubleClickEnabled = false;
         this.x = param3.x;
         this.y = param3.y;
         _rectangle = param3;
         _useAlpha = true;
         var_2252 = false;
         switch(param2)
         {
            case 1:
               var_2252 = true;
               setDisplayObject(new Bitmap());
               allocateDrawBuffer(param3.width,param3.height);
               break;
            case 2:
               (_loc4_ = new TextField()).width = param3.width;
               _loc4_.height = param3.height;
               _loc4_.type = "input";
               setDisplayObject(_loc4_);
               break;
            case 8:
               setDisplayObject(new Shape());
               break;
            case 16:
               setDisplayObject(new MorphShape());
               break;
            case 4:
               setDisplayObject(new Sprite());
               break;
            case 256:
            case 0:
               break;
            default:
               throw new Error("Unsupported graphic context type: " + param2 + "!");
         }
      }
      
      public static function get numGraphicContexts() : uint
      {
         return var_1186;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_2206;
      }
      
      public function set parent(param1:DisplayObjectContainer) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         if(param1 != null)
         {
            param1.addChild(this);
         }
      }
      
      public function offSet(param1:Point) : void
      {
         this.x = param1.x;
         this.y = param1.y;
      }
      
      override public function get filters() : Array
      {
         return getDisplayObject().filters;
      }
      
      override public function set filters(param1:Array) : void
      {
         getDisplayObject().filters = param1;
      }
      
      public function get blend() : Number
      {
         return this.alpha;
      }
      
      public function set blend(param1:Number) : void
      {
         this.alpha = param1;
      }
      
      public function get mouse() : Boolean
      {
         return super.mouseEnabled;
      }
      
      public function set mouse(param1:Boolean) : void
      {
         super.mouseEnabled = param1;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(parent != null)
            {
               parent.removeChild(this);
               parent = null;
            }
            while(numChildContexts > 0)
            {
               removeChildContextAt(0);
            }
            if(var_2252)
            {
               releaseDrawBuffer();
            }
            if(var_1657 != null)
            {
               while(false)
               {
                  var_1657.removeChildAt(0);
               }
            }
            var_1657 = null;
            while(numChildren > 0)
            {
               removeChildAt(0);
            }
            var_1650 = null;
            _disposed = true;
            var_1186--;
         }
      }
      
      override public function toString() : String
      {
         return "[object GraphicContext name=\"" + name + "\"]";
      }
      
      public function getDrawRegion() : Rectangle
      {
         return _rectangle.clone();
      }
      
      public function setDrawRegion(param1:Rectangle, param2:Boolean, param3:Rectangle) : BitmapData
      {
         var _loc4_:BitmapData = null;
         if(var_2252 && param2)
         {
            _loc4_ = allocateDrawBuffer(param1.width,param1.height);
         }
         x = param1.x;
         y = param1.y;
         _rectangle.x = param1.x;
         _rectangle.y = param1.y;
         _rectangle.width = param1.width;
         _rectangle.height = param1.height;
         if(param3)
         {
            if(!var_1650)
            {
               var_1650 = new Shape();
               var_1650.visible = false;
               super.addChild(var_1650);
            }
            var_1650.graphics.clear();
            var_1650.graphics.beginFill(255);
            var_1650.graphics.drawRect(param3.x,param3.y,param3.width,param3.height);
            var_1650.graphics.endFill();
            getDisplayObject().mask = var_1650;
         }
         else if(var_1650)
         {
            super.removeChild(var_1650);
            var_1650.graphics.clear();
            var_1650 = null;
            getDisplayObject().mask = null;
         }
         return _loc4_;
      }
      
      public function getDisplayObject() : DisplayObject
      {
         return getChildAt(0);
      }
      
      public function setDisplayObject(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:DisplayObject = null;
         if(numChildren > 0)
         {
            _loc2_ = removeChildAt(0);
         }
         addChildAt(param1,0);
         param1.mask = var_1650;
         return _loc2_;
      }
      
      public function getAbsoluteMousePosition(param1:Point) : void
      {
         param1.x = stage.mouseX;
         param1.y = stage.mouseY;
      }
      
      public function getRelativeMousePosition(param1:Point) : void
      {
         var _loc2_:DisplayObject = getDisplayObject();
         param1.x = _loc2_.mouseX;
         param1.y = _loc2_.mouseY;
      }
      
      public function fetchDrawBuffer() : IBitmapDrawable
      {
         var _loc1_:Bitmap = null;
         if(var_2252)
         {
            _loc1_ = getDisplayObject() as Bitmap;
            if(_loc1_)
            {
               return _loc1_.bitmapData;
            }
         }
         return null;
      }
      
      protected function allocateDrawBuffer(param1:int, param2:int) : BitmapData
      {
         var _loc3_:Bitmap = null;
         var _loc4_:* = null;
         if(var_2252)
         {
            _loc3_ = getDisplayObject() as Bitmap;
            if(_loc3_)
            {
               if((_loc4_ = _loc3_.bitmapData) != null)
               {
                  if(_loc4_.width != param1 || _loc4_.height != param2)
                  {
                     _loc3_.bitmapData = null;
                     var_2206 -= _loc4_.width * _loc4_.height * 4;
                     _loc4_.dispose();
                     _loc4_ = null;
                  }
               }
               if(_loc4_ == null && param1 > 0 && param2 > 0)
               {
                  _loc4_ = new TrackedBitmapData(this,param1,param2,_useAlpha,16777215);
                  var_2206 += _loc4_.width * _loc4_.height * 4;
                  _loc3_.bitmapData = _loc4_;
               }
               return _loc4_;
            }
         }
         return null;
      }
      
      protected function releaseDrawBuffer() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:BitmapData = null;
         if(var_2252)
         {
            _loc1_ = getDisplayObject() as Bitmap;
            if(_loc1_)
            {
               _loc2_ = _loc1_.bitmapData;
               if(_loc2_ != null)
               {
                  _loc1_.bitmapData = null;
                  var_2206 -= _loc2_.width * _loc2_.height * 4;
                  _loc2_.dispose();
               }
            }
         }
      }
      
      public function showRedrawRegion(param1:Rectangle) : void
      {
         graphics.clear();
         graphics.lineStyle(1,4278255360);
         graphics.drawRect(0,0,width,height);
         if(param1 != null)
         {
            graphics.lineStyle(1,4278190335);
            graphics.drawRect(param1.x,param1.y,param1.width,param1.height);
         }
      }
      
      protected function setupChildContainer() : DisplayObjectContainer
      {
         if(var_1657 == null)
         {
            var_1657 = new Sprite();
            var_1657.name = this.name + " - Child Container";
            var_1657.mouseEnabled = false;
            addChild(var_1657);
         }
         return var_1657;
      }
      
      protected function removeChildContainer() : void
      {
         if(var_1657 != null)
         {
            removeChild(var_1657);
            var_1657 = null;
         }
      }
      
      public function get numChildContexts() : int
      {
         return var_1657 != null ? var_1657.numChildren : 0;
      }
      
      public function addChildContext(param1:IGraphicContext) : IGraphicContext
      {
         return setupChildContainer().addChild(param1 as DisplayObject) as IGraphicContext;
      }
      
      public function addChildContextAt(param1:IGraphicContext, param2:int) : IGraphicContext
      {
         return setupChildContainer().addChildAt(param1 as DisplayObject,param2) as IGraphicContext;
      }
      
      public function getChildContextAt(param1:int) : IGraphicContext
      {
         return setupChildContainer().getChildAt(param1) as IGraphicContext;
      }
      
      public function getChildContextByName(param1:String) : IGraphicContext
      {
         return setupChildContainer().getChildByName(param1) as IGraphicContext;
      }
      
      public function getChildContextIndex(param1:IGraphicContext) : int
      {
         return setupChildContainer().getChildIndex(DisplayObject(param1));
      }
      
      public function removeChildContext(param1:IGraphicContext) : IGraphicContext
      {
         return setupChildContainer().removeChild(DisplayObject(param1)) as IGraphicContext;
      }
      
      public function removeChildContextAt(param1:int) : IGraphicContext
      {
         var _loc2_:IGraphicContext = setupChildContainer().getChildAt(param1) as IGraphicContext;
         return _loc2_ == null ? null : removeChildContext(_loc2_);
      }
      
      public function setChildContextIndex(param1:IGraphicContext, param2:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         var _loc3_:DisplayObject = param1 as DisplayObject;
         if(_loc3_ != null)
         {
            try
            {
               _loc4_ = setupChildContainer().getChildIndex(_loc3_);
            }
            catch(error:ArgumentError)
            {
               _loc5_ = [];
               _loc6_ = 0;
               while(_loc6_ < numChildContexts)
               {
                  _loc5_.push(getChildContextAt(_loc6_));
                  _loc6_++;
               }
               throw new Error("Provided display object is not a child of this!");
            }
            if(param2 != _loc4_)
            {
               setupChildContainer().setChildIndex(_loc3_,param2);
            }
            return;
         }
         throw new Error("Provided child must implement IGraphicContext!");
      }
      
      public function swapChildContexts(param1:IGraphicContext, param2:IGraphicContext) : void
      {
         setupChildContainer().swapChildren(param1 as DisplayObject,param2 as DisplayObject);
      }
      
      public function swapChildContextsAt(param1:int, param2:int) : void
      {
         setupChildContainer().swapChildrenAt(param1,param2);
      }
   }
}
