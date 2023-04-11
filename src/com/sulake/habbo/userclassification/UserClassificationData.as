package com.sulake.habbo.userclassification
{
   public class UserClassificationData
   {
      
      public static var var_4351:uint = 1;
      
      public static var var_4348:uint = 2;
      
      public static var var_4343:uint = 3;
      
      public static var PAYING_USER_CLASSIFICATION:uint = 4;
       
      
      private var var_339:int;
      
      private var _username:String;
      
      private var var_3516:String;
      
      public function UserClassificationData(param1:int, param2:String, param3:String)
      {
         super();
         var_339 = param1;
         _username = param2;
         var_3516 = param3;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get username() : String
      {
         return _username;
      }
      
      public function get classType() : String
      {
         return var_3516;
      }
      
      public function toString() : String
      {
         return "[" + var_339 + ", " + _username + "] [" + var_3516 + "]";
      }
   }
}
