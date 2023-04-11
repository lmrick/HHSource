package com.sulake.core.window.events
{
   import com.sulake.core.window.class_3127;
   
   public class WindowLinkEvent extends class_3134
   {
      
      public static const const_1007:String = "WE_LINK";
      
      private static const const_421:Array = [];
       
      
      private var var_365:String;
      
      public function WindowLinkEvent()
      {
         super();
         var_271 = "WE_LINK";
      }
      
      public static function allocate(param1:String, param2:class_3127, param3:class_3127) : class_3134
      {
         var _loc4_:WindowLinkEvent;
         (_loc4_ = const_421.length > 0 ? const_421.pop() : new WindowLinkEvent()).var_365 = param1;
         _loc4_._window = param2;
         _loc4_.var_2304 = param3;
         _loc4_.var_1501 = false;
         _loc4_.var_2472 = const_421;
         return _loc4_;
      }
      
      public function get link() : String
      {
         return var_365;
      }
      
      override public function clone() : class_3134
      {
         return allocate(var_365,window,related);
      }
      
      override public function toString() : String
      {
         return "WindowLinkEvent { type: " + var_271 + " link: " + link + " cancelable: " + var_2152 + " window: " + _window + " }";
      }
   }
}
