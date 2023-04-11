package com.sulake.core.utils
{
   public class BrowserInfo
   {
      
      public static const const_176:String = "win";
      
      public static const MAC_PLATFORM:String = "mac";
      
      public static const SAFARI_AGENT:String = "safari";
      
      public static const const_219:String = "opera";
      
      public static const IE_AGENT:String = "msie";
      
      public static const MOZILLA_AGENT:String = "mozilla";
      
      public static const CHROME_AGENT:String = "chrome";
       
      
      private var var_1106:String = "undefined";
      
      private var var_1073:String = "undefined";
      
      private var _version:String = "undefined";
      
      public function BrowserInfo(param1:Object, param2:Object, param3:String)
      {
         super();
         if(!param1 || !param2 || !param3)
         {
            return;
         }
         _version = param1.version;
         for(var _loc5_ in param1)
         {
            if(_loc5_ != "version")
            {
               if(param1[_loc5_] == true)
               {
                  var_1073 = _loc5_;
                  break;
               }
            }
         }
         for(var _loc4_ in param2)
         {
            if(param2[_loc4_] == true)
            {
               var_1106 = _loc4_;
            }
         }
      }
      
      public function get platform() : String
      {
         return var_1106;
      }
      
      public function get browser() : String
      {
         return var_1073;
      }
      
      public function get version() : String
      {
         return _version;
      }
   }
}
