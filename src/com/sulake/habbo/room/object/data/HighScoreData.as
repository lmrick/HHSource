package com.sulake.habbo.room.object.data
{
   public class HighScoreData
   {
       
      
      private var var_522:int;
      
      private var _users:Array;
      
      public function HighScoreData()
      {
         _users = [];
         super();
         var_522 = -1;
      }
      
      public function get score() : int
      {
         return var_522;
      }
      
      public function set score(param1:int) : void
      {
         var_522 = param1;
      }
      
      public function get users() : Array
      {
         return _users;
      }
      
      public function set users(param1:Array) : void
      {
         _users = param1;
      }
      
      public function addUser(param1:String) : void
      {
         _users.push(param1);
      }
   }
}
