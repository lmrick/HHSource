package com.sulake.core.window.components
{
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.utils.tablet.ITouchAwareWindow;
   import flash.geom.Rectangle;
   
   public class DropListItemController extends ContainerButtonController implements class_3248, ITouchAwareWindow
   {
       
      
      public function DropListItemController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:class_3127, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function get menu() : class_3287
      {
         var _loc1_:class_3127 = parent;
         while(_loc1_)
         {
            if(_loc1_ is class_3287)
            {
               break;
            }
            _loc1_ = _loc1_.parent;
         }
         return _loc1_ as class_3287;
      }
      
      public function get value() : class_3127
      {
         return getChildAt(0);
      }
      
      public function set value(param1:class_3127) : void
      {
         var _loc2_:class_3127 = getChildAt(0);
         if(_loc2_ != param1)
         {
            removeChildAt(0);
            if(param1)
            {
               addChild(param1);
            }
         }
      }
   }
}
