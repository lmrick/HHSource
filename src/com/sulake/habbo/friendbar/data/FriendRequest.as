package com.sulake.habbo.friendbar.data
{
   public class FriendRequest implements class_3384
   {
       
      
      private var var_247:int;
      
      private var _name:String;
      
      private var var_427:String;
      
      public function FriendRequest(param1:int, param2:String, param3:String)
      {
         super();
         var_247 = param1;
         _name = param2;
         var_427 = param3;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
   }
}
