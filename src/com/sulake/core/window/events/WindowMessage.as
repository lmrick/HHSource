package com.sulake.core.window.events
{
   import com.sulake.core.window.class_3127;
   
   public class WindowMessage extends class_3134
   {
      
      private static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      private static const const_421:Array = [];
       
      
      public var message:String;
      
      public function WindowMessage()
      {
         super();
         var_271 = "WE_MESSAGE";
      }
      
      public static function allocate(param1:String, param2:class_3127, param3:class_3127, param4:Boolean = false) : class_3134
      {
         var _loc5_:WindowMessage;
         (_loc5_ = const_421.length > 0 ? const_421.pop() : new WindowMessage()).message = param1;
         _loc5_._window = param2;
         _loc5_.var_2304 = param3;
         _loc5_.var_2152 = param4;
         _loc5_.var_1501 = false;
         _loc5_.var_2472 = const_421;
         return _loc5_;
      }
      
      override public function clone() : class_3134
      {
         return allocate(message,window,related,cancelable);
      }
      
      override public function toString() : String
      {
         return "WindowLinkEvent { type: " + var_271 + " message: " + message + " cancelable: " + var_2152 + " window: " + _window + " }";
      }
   }
}
