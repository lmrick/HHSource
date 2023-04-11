package com.sulake.habbo.friendbar.groupforums
{
   import flash.utils.Dictionary;
   import package_155.class_1629;
   
   public class ThreadsListData
   {
      
      public static const PAGE_SIZE:int = 20;
       
      
      private var var_151:int;
      
      private var var_405:int;
      
      private var var_676:Array;
      
      private var var_3655:Dictionary;
      
      public function ThreadsListData(param1:int, param2:int, param3:Array)
      {
         var _loc4_:int = 0;
         var _loc5_:class_1629 = null;
         super();
         var_151 = param1;
         var_405 = param2;
         var_676 = param3;
         var_3655 = new Dictionary();
         _loc4_ = 0;
         while(_loc4_ < param3.length)
         {
            _loc5_ = param3[_loc4_];
            var_3655[_loc5_.threadId] = _loc5_;
            _loc4_++;
         }
      }
      
      public function get totalThreads() : int
      {
         return var_151;
      }
      
      public function get startIndex() : int
      {
         return var_405;
      }
      
      public function get threads() : Array
      {
         return var_676;
      }
      
      public function get threadsById() : Dictionary
      {
         return var_3655;
      }
      
      public function get size() : int
      {
         return var_676.length;
      }
      
      public function updateThread(param1:class_1629) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:class_1629 = null;
         threadsById[param1.threadId] = param1;
         _loc3_ = 0;
         while(_loc3_ < threads.length)
         {
            _loc2_ = threads[_loc3_];
            if(_loc2_.threadId == param1.threadId)
            {
               threads[_loc3_] = param1;
               return true;
            }
            _loc3_++;
         }
         return false;
      }
   }
}
