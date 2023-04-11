package com.sulake.core.utils
{
   import flash.system.Capabilities;
   
   public class Player
   {
      
      private static var _majorVersion:int;
      
      private static var _majorRevision:int;
      
      private static var var_1319:String;
      
      {
         init();
      }
      
      public function Player()
      {
         super();
      }
      
      public static function get majorVersion() : int
      {
         return _majorVersion;
      }
      
      public static function get majorRevision() : int
      {
         return _majorRevision;
      }
      
      public static function get operatingSystem() : String
      {
         return var_1319;
      }
      
      private static function init() : void
      {
         var _loc1_:String = "null";
         var _loc3_:Array = _loc1_.split(" ");
         var _loc2_:Array = _loc3_[1].split(",");
         var_1319 = _loc3_[0];
         _majorVersion = parseInt(_loc2_[0]);
         _majorRevision = parseInt(_loc2_[1]);
      }
   }
}
