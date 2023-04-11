package com.sulake.core.window.events
{
   import com.sulake.core.window.class_3127;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   
   public class WindowKeyboardEvent extends class_3134
   {
      
      public static const const_805:String = "WKE_KEY_UP";
      
      public static const const_704:String = "WKE_KEY_DOWN";
      
      private static const const_421:Array = [];
       
      
      private var var_2591:KeyboardEvent;
      
      public function WindowKeyboardEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:Event, param3:class_3127, param4:class_3127, param5:Boolean = false) : WindowKeyboardEvent
      {
         var _loc6_:WindowKeyboardEvent;
         (_loc6_ = const_421.length > 0 ? const_421.pop() : new WindowKeyboardEvent()).var_271 = param1;
         _loc6_.var_2591 = param2 as KeyboardEvent;
         _loc6_._window = param3;
         _loc6_.var_2304 = param4;
         _loc6_.var_1501 = false;
         _loc6_.var_2152 = param5;
         _loc6_.var_2472 = const_421;
         return _loc6_;
      }
      
      public function get charCode() : uint
      {
         return var_2591.charCode;
      }
      
      public function get keyCode() : uint
      {
         return var_2591.keyCode;
      }
      
      public function get keyLocation() : uint
      {
         return var_2591.keyLocation;
      }
      
      public function get altKey() : Boolean
      {
         return var_2591.altKey;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2591.shiftKey;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2591.ctrlKey;
      }
      
      override public function clone() : class_3134
      {
         return allocate(var_271,var_2591,window,related,cancelable);
      }
      
      override public function toString() : String
      {
         return "WindowKeyboardEvent { type: " + var_271 + " cancelable: " + var_2152 + " window: " + _window + " charCode: " + charCode + " }";
      }
   }
}
