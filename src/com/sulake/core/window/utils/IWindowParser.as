package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   
   public interface IWindowParser extends class_13
   {
       
      
      function parseAndConstruct(param1:XML, param2:class_3127, param3:class_24) : class_3127;
      
      function windowToXMLString(param1:class_3127) : String;
   }
}
