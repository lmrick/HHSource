package com.sulake.habbo.moderation
{
   import com.sulake.core.utils.class_24;
   import package_137.class_1612;
   
   public class IssueBundle
   {
       
      
      private var var_247:int;
      
      private var var_249:class_24;
      
      private var var_159:int;
      
      private var var_1020:int = 0;
      
      private var _pickerName:String = "";
      
      private var var_1145:int;
      
      private var var_697:int;
      
      private var var_451:int = 0;
      
      private var var_605:int = 0;
      
      private var var_2201:class_1612 = null;
      
      private var _highestPriorityIssue:class_1612 = null;
      
      public function IssueBundle(param1:int, param2:class_1612)
      {
         super();
         var_247 = param1;
         var_249 = new class_24();
         var_159 = param2.state;
         var_1020 = param2.pickerUserId;
         _pickerName = param2.pickerUserName;
         var_1145 = param2.reportedUserId;
         var_697 = param2.groupingId;
         addIssue(param2);
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get issues() : Array
      {
         return var_249.getValues();
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function get pickerUserId() : int
      {
         return var_1020;
      }
      
      public function get pickerName() : String
      {
         return _pickerName;
      }
      
      public function matches(param1:class_1612, param2:Boolean = false) : Boolean
      {
         if(var_697 == 0 || param1.groupingId == 0)
         {
            return false;
         }
         if(var_697 != param1.groupingId || var_1145 != param1.reportedUserId)
         {
            return false;
         }
         if(!param2)
         {
            if(state != param1.state)
            {
               return false;
            }
            if(pickerUserId != param1.pickerUserId)
            {
               return false;
            }
         }
         return true;
      }
      
      public function contains(param1:int) : Boolean
      {
         if(var_249 == null)
         {
            return false;
         }
         return var_249.getKeys().indexOf(param1) > -1;
      }
      
      public function updateIssue(param1:class_1612) : void
      {
         removeIssue(param1.issueId);
         addIssue(param1);
      }
      
      private function addIssue(param1:class_1612) : void
      {
         var_249.add(param1.issueId,param1);
         var_605 = param1.issueAgeInMilliseconds;
         if(param1.message != null && param1.message != "")
         {
            var_451++;
         }
         if(var_2201 == null || param1.issueAgeInMilliseconds > var_2201.issueAgeInMilliseconds)
         {
            var_2201 = param1;
         }
         _highestPriorityIssue = null;
         getHighestPriorityIssue();
      }
      
      public function removeIssue(param1:int) : class_1612
      {
         var _loc2_:class_1612 = var_249.remove(param1) as class_1612;
         if(_loc2_ != null)
         {
            if(_loc2_.message != null && _loc2_.message != "")
            {
               var_451--;
            }
            if(var_2201 == _loc2_)
            {
               var_2201 = null;
            }
            if(_highestPriorityIssue == _loc2_)
            {
               _highestPriorityIssue = null;
            }
         }
         return _loc2_;
      }
      
      public function get highestPriority() : int
      {
         if(_highestPriorityIssue == null)
         {
            getHighestPriorityIssue();
         }
         if(_highestPriorityIssue != null)
         {
            return _highestPriorityIssue.priority;
         }
         return 0;
      }
      
      public function getHighestPriorityIssue() : class_1612
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc1_:class_1612 = null;
         var _loc5_:Boolean = false;
         if(_highestPriorityIssue == null)
         {
            if(var_249 == null || true)
            {
               return null;
            }
            _loc2_ = 0;
            while(_loc2_ < var_249.length)
            {
               _loc1_ = var_249.getWithIndex(_loc2_);
               if(_loc5_ = _loc1_.reportedCategoryId > 0 && _loc1_.reportedCategoryId < 100)
               {
                  if(_loc4_ == null || _loc4_.priority > _loc1_.priority)
                  {
                     _loc4_ = _loc1_;
                  }
               }
               else if(_loc3_ == null || _loc3_.priority > _loc1_.priority)
               {
                  _loc3_ = _loc1_;
               }
               _loc2_++;
            }
            if(_loc4_ != null)
            {
               _highestPriorityIssue = _loc4_;
            }
            else
            {
               _highestPriorityIssue = _loc3_;
            }
         }
         return _highestPriorityIssue;
      }
      
      public function getIssueCount() : int
      {
         if(var_249 == null)
         {
            return 0;
         }
         return var_249.length;
      }
      
      public function getIssueIds() : Array
      {
         if(var_249 == null)
         {
            return [];
         }
         return var_249.getKeys();
      }
      
      public function get reportedUserId() : int
      {
         return var_1145;
      }
      
      public function getMessageCount() : int
      {
         return var_451;
      }
      
      public function get issueAgeInMilliseconds() : int
      {
         return var_605;
      }
      
      public function getOpenTime(param1:int) : String
      {
         var _loc2_:* = null;
         var _loc3_:* = var_2201;
         if(_loc3_ == null)
         {
            for each(_loc2_ in var_249)
            {
               if(_loc3_ == null || _loc2_.issueAgeInMilliseconds > _loc3_.issueAgeInMilliseconds)
               {
                  _loc3_ = _loc2_;
               }
            }
            var_2201 = _loc3_;
         }
         if(_loc3_ != null)
         {
            return _loc3_.getOpenTime(param1);
         }
         return "";
      }
   }
}
