package com.sulake.core.utils
{
   import flash.system.Capabilities;
   
   public class PlayerVersionCheck
   {
      
      private static var _majorVersion:int;
      
      private static var _minorVersion:int;
      
      private static var var_3975:Boolean;
       
      
      public function PlayerVersionCheck()
      {
         super();
      }
      
      public static function isVersionAtLeast(param1:int, param2:int) : Boolean
      {
         if(param1 < PlayerVersionCheck.majorVersion)
         {
            return true;
         }
         if(param1 == PlayerVersionCheck.majorVersion && param2 <= PlayerVersionCheck.minorVersion)
         {
            return true;
         }
         return false;
      }
      
      public static function get majorVersion() : int
      {
         parseVersion();
         return _majorVersion;
      }
      
      public static function get minorVersion() : int
      {
         parseVersion();
         return _minorVersion;
      }
      
      private static function parseVersion() : void
      {
         if(var_3975)
         {
            return;
         }
         var _loc2_:Array = Capabilities.version.split(" ");
         var _loc3_:Array = _loc2_[1].split(",");
         var _loc1_:int = int(_loc3_.length);
         _majorVersion = _loc1_ >= 1 ? parseInt(_loc3_[0]) : 0;
         _minorVersion = _loc1_ >= 2 ? parseInt(_loc3_[1]) : 0;
         var_3975 = true;
      }
   }
}
