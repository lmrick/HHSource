package com.sulake.core.window.events
{
   import com.sulake.core.window.class_3127;
   
   public class WindowDisposeEvent extends class_3134
   {
      
      public static const const_700:String = "WINDOW_DISPOSE_EVENT";
      
      private static const const_421:Array = [];
       
      
      public function WindowDisposeEvent()
      {
         super();
         var_271 = "WINDOW_DISPOSE_EVENT";
      }
      
      public static function allocate(param1:class_3127) : WindowDisposeEvent
      {
         var _loc2_:WindowDisposeEvent = const_421.length > 0 ? const_421.pop() : new WindowDisposeEvent();
         _loc2_._window = param1;
         _loc2_.var_1501 = false;
         _loc2_.var_2472 = const_421;
         return _loc2_;
      }
      
      override public function clone() : class_3134
      {
         return allocate(window);
      }
      
      override public function toString() : String
      {
         return "WindowDisposeEvent { type: " + var_271 + " window: " + _window + " }";
      }
   }
}
