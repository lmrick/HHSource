package com.sulake.habbo.quest
{
   import package_101.class_1614;
   
   public class AchievementCategory
   {
       
      
      private var var_713:String;
      
      private var var_246:Vector.<class_1614>;
      
      public function AchievementCategory(param1:String)
      {
         var_246 = new Vector.<class_1614>(0);
         super();
         var_713 = param1;
      }
      
      public function add(param1:class_1614) : void
      {
         var_246.push(param1);
      }
      
      public function update(param1:class_1614) : void
      {
         var _loc3_:int = 0;
         var _loc2_:class_1614 = null;
         _loc3_ = 0;
         while(_loc3_ < var_246.length)
         {
            _loc2_ = var_246[_loc3_];
            if(_loc2_.achievementId == param1.achievementId)
            {
               var_246[_loc3_] = param1;
            }
            _loc3_++;
         }
      }
      
      public function getProgress() : int
      {
         var _loc1_:int = 0;
         for each(var _loc2_ in var_246)
         {
            _loc1_ += _loc2_.finalLevel ? _loc2_.level : _loc2_.level - 1;
         }
         return _loc1_;
      }
      
      public function getMaxProgress() : int
      {
         var _loc1_:int = 0;
         for each(var _loc2_ in var_246)
         {
            _loc1_ += _loc2_.levelCount;
         }
         return _loc1_;
      }
      
      public function get code() : String
      {
         return var_713;
      }
      
      public function get achievements() : Vector.<class_1614>
      {
         return var_246;
      }
   }
}
