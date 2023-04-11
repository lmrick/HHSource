package com.sulake.habbo.help
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.localization.class_18;
   
   public interface INameChangeUI
   {
       
      
      function get localization() : class_18;
      
      function get assets() : class_21;
      
      function get myName() : String;
      
      function buildXmlWindow(param1:String, param2:uint = 1) : class_3127;
      
      function checkName(param1:String) : void;
      
      function changeName(param1:String) : void;
      
      function showView() : void;
      
      function hideView() : void;
   }
}
