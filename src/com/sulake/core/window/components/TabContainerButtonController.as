package com.sulake.core.window.components
{
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.iterators.ContainerIterator;
   import com.sulake.core.window.utils.IIterator;
   import flash.geom.Rectangle;
   
   public class TabContainerButtonController extends SelectableController implements ITabButtonWindow, class_3151
   {
       
      
      public function TabContainerButtonController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:class_3127, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function get iterator() : IIterator
      {
         return new ContainerIterator(this);
      }
   }
}
