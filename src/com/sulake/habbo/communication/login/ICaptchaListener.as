package com.sulake.habbo.communication.login
{
   import flash.utils.Dictionary;
   
   public interface ICaptchaListener
   {
       
      
      function handleCaptchaError() : void;
      
      function handleCaptchaResult(param1:String) : void;
      
      function getProperty(param1:String, param2:Dictionary = null) : String;
   }
}
