package com.sulake.habbo.help.cfh.registry.user
{
   public class UserRegistryItem
   {
       
      
      private var var_339:int;
      
      private var _userName:String = "";
      
      private var _roomName:String = "";
      
      private var var_427:String = "";
      
      private var var_354:int;
      
      public function UserRegistryItem(param1:int, param2:String, param3:String, param4:int, param5:String = "")
      {
         super();
         var_339 = param1;
         _userName = param2;
         var_354 = param4;
         _roomName = param5;
         var_427 = param3;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get roomName() : String
      {
         return _roomName;
      }
      
      public function set roomName(param1:String) : void
      {
         _roomName = param1;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
   }
}
