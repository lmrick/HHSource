package com.sulake.habbo.friendbar.groupforums
{
   import flash.utils.Dictionary;
   import package_155.class_1560;
   
   public class MessagesListData
   {
       
      
      private var var_284:int;
      
      private var var_405:int;
      
      private var var_113:int;
      
      private var var_628:Array;
      
      private var var_3644:Dictionary;
      
      public function MessagesListData(param1:int, param2:int, param3:int, param4:Array)
      {
         var _loc5_:int = 0;
         var _loc6_:class_1560 = null;
         super();
         var_284 = param1;
         var_405 = param3;
         var_113 = param2;
         var_628 = param4;
         var_3644 = new Dictionary();
         _loc5_ = 0;
         while(_loc5_ < param4.length)
         {
            _loc6_ = param4[_loc5_];
            var_3644[_loc6_.messageId] = _loc6_;
            _loc5_++;
         }
      }
      
      public function get threadId() : int
      {
         return var_284;
      }
      
      public function get startIndex() : int
      {
         return var_405;
      }
      
      public function get totalMessages() : int
      {
         return var_113;
      }
      
      public function get messages() : Array
      {
         return var_628;
      }
      
      public function get messagesById() : Dictionary
      {
         return var_3644;
      }
      
      public function get size() : int
      {
         return var_628.length;
      }
   }
}
