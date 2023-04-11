package com.sulake.habbo.navigator.roomsettings
{
   import package_78.class_1623;
   
   public class FriendEntryData implements class_1623
   {
       
      
      private var var_339:int;
      
      private var _userName:String;
      
      public function FriendEntryData(param1:int, param2:String)
      {
         super();
         var_339 = param1;
         _userName = param2;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
