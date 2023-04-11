package com.sulake.core.window.components
{
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.enum.PivotPoint;
   import com.sulake.core.window.theme.class_3302;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.class_3268;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class BitmapDataController extends WindowController implements class_3268
   {
       
      
      protected var _bitmapData:BitmapData;
      
      protected var var_2489:uint;
      
      protected var var_2561:Boolean;
      
      protected var var_2623:Boolean;
      
      protected var var_2377:Number;
      
      protected var var_2336:Number;
      
      protected var var_2914:Boolean;
      
      protected var _etchingColor:uint;
      
      protected var _etchingPoint:Point;
      
      protected var var_3259:Boolean;
      
      private var var_2482:Boolean;
      
      private var var_2586:Boolean;
      
      public function BitmapDataController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:class_3127, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         _etchingPoint = new Point(0,-1);
         var _loc12_:class_3302 = param5.getWindowFactory().getThemeManager().getPropertyDefaults(param3);
         var_2489 = PivotPoint.pivotFromName(String(_loc12_.method_20("pivot_point").value));
         var_2561 = Boolean(_loc12_.method_20("stretched_x").value);
         var_2623 = Boolean(_loc12_.method_20("stretched_y").value);
         var_2377 = Number(_loc12_.method_20("zoom_x").value);
         var_2336 = Number(_loc12_.method_20("zoom_y").value);
         var_2482 = Boolean(_loc12_.method_20("wrap_x").value);
         var_2586 = Boolean(_loc12_.method_20("wrap_y").value);
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      override public function dispose() : void
      {
         _bitmapData = null;
         super.dispose();
      }
      
      public function get bitmapData() : BitmapData
      {
         return _bitmapData;
      }
      
      public function get pivotPoint() : uint
      {
         return var_2489;
      }
      
      public function set pivotPoint(param1:uint) : void
      {
         var_2489 = param1;
      }
      
      public function get stretchedX() : Boolean
      {
         return var_2561;
      }
      
      public function set stretchedX(param1:Boolean) : void
      {
         var_2561 = param1;
      }
      
      public function get stretchedY() : Boolean
      {
         return var_2623;
      }
      
      public function set stretchedY(param1:Boolean) : void
      {
         var_2623 = param1;
      }
      
      public function get zoomX() : Number
      {
         return var_2377;
      }
      
      public function set zoomX(param1:Number) : void
      {
         var_2377 = param1;
         fitSize();
      }
      
      public function get zoomY() : Number
      {
         return var_2336;
      }
      
      public function set zoomY(param1:Number) : void
      {
         var_2336 = param1;
         fitSize();
      }
      
      public function get greyscale() : Boolean
      {
         return var_2914;
      }
      
      public function set greyscale(param1:Boolean) : void
      {
         var_2914 = param1;
      }
      
      public function get etchingColor() : uint
      {
         return _etchingColor;
      }
      
      public function set etchingColor(param1:uint) : void
      {
         _etchingColor = param1;
      }
      
      public function get fitSizeToContents() : Boolean
      {
         return var_3259;
      }
      
      public function set fitSizeToContents(param1:Boolean) : void
      {
         var_3259 = param1;
         fitSize();
      }
      
      override public function get etchingPoint() : Point
      {
         return _etchingPoint;
      }
      
      override public function set etching(param1:Array) : void
      {
         etchingColor = param1[0];
         _etchingPoint = new Point(param1[1],param1[2]);
      }
      
      public function get wrapX() : Boolean
      {
         return var_2482;
      }
      
      public function set wrapX(param1:Boolean) : void
      {
         var_2482 = param1;
      }
      
      public function get wrapY() : Boolean
      {
         return var_2586;
      }
      
      public function set wrapY(param1:Boolean) : void
      {
         var_2586 = param1;
      }
      
      protected function fitSize() : void
      {
         if(var_3259 && _bitmapData != null)
         {
            width = Math.abs(0 * var_2377);
            height = Math.abs(0 * var_2336);
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         _loc1_.push(createProperty("pivot_point",PivotPoint.PIVOT_NAMES[var_2489]));
         _loc1_.push(createProperty("stretched_x",var_2561));
         _loc1_.push(createProperty("stretched_y",var_2623));
         _loc1_.push(createProperty("wrap_x",var_2482));
         _loc1_.push(createProperty("wrap_y",var_2586));
         _loc1_.push(createProperty("zoom_x",var_2377));
         _loc1_.push(createProperty("zoom_y",var_2336));
         _loc1_.push(createProperty("greyscale",var_2914));
         _loc1_.push(createProperty("etching_color",_etchingColor));
         _loc1_.push(createProperty("fit_size_to_contents",var_3259));
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         for each(var _loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "pivot_point":
                  var_2489 = PivotPoint.pivotFromName(String(_loc2_.value));
                  break;
               case "stretched_x":
                  var_2561 = Boolean(_loc2_.value);
                  break;
               case "stretched_y":
                  var_2623 = Boolean(_loc2_.value);
                  break;
               case "zoom_x":
                  var_2377 = Number(_loc2_.value);
                  break;
               case "zoom_y":
                  var_2336 = Number(_loc2_.value);
                  break;
               case "wrap_x":
                  var_2482 = Boolean(_loc2_.value);
                  break;
               case "wrap_y":
                  var_2586 = Boolean(_loc2_.value);
                  break;
               case "greyscale":
                  var_2914 = Boolean(_loc2_.value);
                  break;
               case "etching_color":
                  _etchingColor = uint(_loc2_.value);
                  break;
               case "fit_size_to_contents":
                  fitSizeToContents = _loc2_.value as Boolean;
                  break;
            }
         }
         super.properties = param1;
      }
   }
}
