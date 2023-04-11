package com.sulake.core.window.components
{
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.class_1681;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3197;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.geom.Rectangle;
   
   public class WidgetController extends WindowController implements class_3217
   {
       
      
      private var var_3278:class_1681;
      
      private var var_3559:String = "";
      
      private var var_1429:class_3197;
      
      public function WidgetController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:class_3127, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         var_3278 = param5.getWidgetFactory();
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_1429 != null)
            {
               var_1429.dispose();
               var_1429 = null;
            }
            var_3278 = null;
            super.dispose();
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = var_1429 != null ? var_1429.properties : [];
         _loc1_.unshift(createProperty("widget_type",var_3559));
         return super.properties.concat(_loc1_);
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc3_:String = null;
         for each(var _loc2_ in param1)
         {
            if(_loc2_.key == "widget_type")
            {
               _loc3_ = String(_loc2_.value);
               if(var_3559 != _loc3_)
               {
                  if(var_1429 != null)
                  {
                     removeChildAt(0);
                     var_1429.dispose();
                  }
                  var_1429 = var_3278.createWidget(String(_loc2_.value),this);
                  var_3559 = _loc3_;
                  break;
               }
               break;
            }
         }
         if(var_1429 != null)
         {
            var_1429.properties = param1;
         }
         super.properties = param1;
      }
      
      override public function set color(param1:uint) : void
      {
         super.color = param1;
         var _loc2_:* = [];
         groupChildrenWithTag("_COLORIZE",_loc2_,-1);
         for each(var _loc3_ in _loc2_)
         {
            _loc3_.color = param1;
         }
      }
      
      public function get iterator() : IIterator
      {
         return var_1429 != null ? var_1429.iterator : EmptyIterator.INSTANCE;
      }
      
      public function get widget() : class_3197
      {
         return var_1429;
      }
      
      public function get rootWindow() : class_3127
      {
         return getChildAt(0);
      }
      
      public function set rootWindow(param1:class_3127) : void
      {
         removeChildAt(0);
         if(param1 == null)
         {
            return;
         }
         addChild(param1);
         if(param1.tags.indexOf("_EXCLUDE") < 0)
         {
            param1.tags.push("_EXCLUDE");
         }
      }
   }
}
