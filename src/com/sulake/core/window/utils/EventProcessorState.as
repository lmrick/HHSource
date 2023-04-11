package com.sulake.core.window.utils
{
   import com.sulake.core.window.IInputEventTracker;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.graphics.class_3137;
   
   public class EventProcessorState
   {
       
      
      public var renderer:class_3137;
      
      public var desktop:class_3234;
      
      public var var_3260:class_3127;
      
      public var lastClickTarget:class_3127;
      
      public var eventTrackers:Vector.<IInputEventTracker>;
      
      public function EventProcessorState(param1:class_3137, param2:class_3234, param3:class_3127, param4:class_3127, param5:Vector.<IInputEventTracker>)
      {
         super();
         this.renderer = param1;
         this.desktop = param2;
         this.var_3260 = param3;
         this.lastClickTarget = param4;
         this.eventTrackers = param5;
      }
   }
}
