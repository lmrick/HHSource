package com.sulake.habbo.friendlist.domain
{
   import flash.utils.Dictionary;
   import package_24.class_1602;
   
   public class AvatarSearchResults
   {
       
      
      private var var_2547:com.sulake.habbo.friendlist.domain.class_3149;
      
      private var var_1124:Array;
      
      private var _others:Array;
      
      private var var_3633:Dictionary;
      
      public function AvatarSearchResults(param1:com.sulake.habbo.friendlist.domain.class_3149)
      {
         var_3633 = new Dictionary();
         super();
         var_2547 = param1;
      }
      
      public function getResult(param1:int) : class_1602
      {
         for each(var _loc3_ in var_1124)
         {
            if(_loc3_.avatarId == param1)
            {
               return _loc3_;
            }
         }
         for each(var _loc2_ in _others)
         {
            if(_loc2_.avatarId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function searchReceived(param1:Array, param2:Array) : void
      {
         var_1124 = param1;
         _others = param2;
         var_2547.view.refreshList();
      }
      
      public function get friends() : Array
      {
         return var_1124;
      }
      
      public function get others() : Array
      {
         return _others;
      }
      
      public function setFriendRequestSent(param1:int) : void
      {
         var_3633[param1] = "yes";
      }
      
      public function isFriendRequestSent(param1:int) : Boolean
      {
         return false;
      }
   }
}
