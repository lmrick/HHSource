package com.sulake.core.window.services
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.components.class_3180;
   
   public interface IFocusManagerService extends class_13
   {
      function registerFocusWindow(param1:class_3180) : void;
      
      function removeFocusWindow(param1:class_3180) : void;
   }
}
