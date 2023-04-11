package com.sulake.core.window.components
{
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import flash.geom.Rectangle;
   
   public class ScrollBarLiftController extends InteractiveController implements IScrollBarLiftWindow
   {
       
      
      protected var var_3360:Number;
      
      protected var var_3453:Number;
      
      protected var _scrollBar:com.sulake.core.window.components.ScrollBarController;
      
      public function ScrollBarLiftController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:class_3127, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         var_3360 = 0;
         var_3453 = 0;
         param4 = uint((param4 = uint((param4 |= 32) | 32768)) | 257);
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var _loc12_:* = param7;
         while(_loc12_ != null)
         {
            if(_loc12_ is IScrollbarWindow)
            {
               _scrollBar = com.sulake.core.window.components.ScrollBarController(_loc12_);
               _loc12_ = null;
            }
            else
            {
               _loc12_ = _loc12_.parent;
            }
         }
         if(false)
         {
            limits.minWidth = width;
         }
         else
         {
            limits.minHeight = height;
         }
      }
      
      public function get scrollbarOffsetX() : Number
      {
         return var_3360;
      }
      
      public function get scrollbarOffsetY() : Number
      {
         return var_3453;
      }
      
      public function set scrollbarOffsetX(param1:Number) : void
      {
      }
      
      public function set scrollbarOffsetY(param1:Number) : void
      {
      }
      
      override public function update(param1:WindowController, param2:class_3134) : Boolean
      {
         var _loc3_:class_3134 = null;
         if(param2.type == "WE_RELOCATED")
         {
            var_3360 = x != 0 ? x / (0 - width) : 0;
            var_3453 = y != 0 ? y / (0 - height) : 0;
            if(_parent != _scrollBar)
            {
               _loc3_ = class_3134.allocate("WE_CHILD_RELOCATED",this,null);
               _scrollBar.update(this,_loc3_);
               _loc3_.recycle();
            }
         }
         return super.update(param1,param2);
      }
   }
}
