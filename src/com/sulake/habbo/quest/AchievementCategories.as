package com.sulake.habbo.quest
{
   import flash.utils.Dictionary;
   import package_101.class_1614;
   
   public class AchievementCategories
   {
      
      private static const ACHIEVEMENT_DISABLED:int = 0;
      
      private static const ACHIEVEMENT_ENABLED:int = 1;
      
      private static const ACHIEVEMENT_ARCHIVED:int = 2;
      
      private static const ACHIEVEMENT_OFF_SEASON:int = 3;
      
      private static const ACHIEVEMENT_CATEGORY_ARCHIVED:String = "archive";
       
      
      private var var_2835:Dictionary;
      
      private var var_2325:Vector.<com.sulake.habbo.quest.AchievementCategory>;
      
      public function AchievementCategories(param1:Array)
      {
         var _loc4_:* = null;
         var _loc5_:com.sulake.habbo.quest.AchievementCategory = null;
         var_2835 = new Dictionary();
         var_2325 = new Vector.<com.sulake.habbo.quest.AchievementCategory>(0);
         super();
         var _loc2_:com.sulake.habbo.quest.AchievementCategory = new com.sulake.habbo.quest.AchievementCategory("archive");
         var_2835["archive"] = _loc2_;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.category != "")
            {
               if(_loc3_.state == 2)
               {
                  _loc5_ = var_2835["archive"];
               }
               else
               {
                  _loc5_ = var_2835[_loc3_.category];
               }
               if(_loc5_ == null)
               {
                  _loc5_ = new com.sulake.habbo.quest.AchievementCategory(_loc3_.category);
                  var_2835[_loc3_.category] = _loc5_;
                  if(_loc3_.category != "misc")
                  {
                     var_2325.push(_loc5_);
                  }
                  else
                  {
                     _loc4_ = _loc5_;
                  }
               }
               _loc5_.add(_loc3_);
            }
         }
         if(_loc4_ != null)
         {
            var_2325.push(_loc4_);
         }
         var_2325.push(_loc2_);
      }
      
      public function update(param1:class_1614) : void
      {
         if(param1.category == "")
         {
            return;
         }
         var _loc2_:com.sulake.habbo.quest.AchievementCategory = var_2835[param1.category];
         _loc2_.update(param1);
      }
      
      public function get categoryList() : Vector.<com.sulake.habbo.quest.AchievementCategory>
      {
         return var_2325;
      }
      
      public function getMaxProgress() : int
      {
         var _loc1_:int = 0;
         for each(var _loc2_ in var_2325)
         {
            _loc1_ += _loc2_.getMaxProgress();
         }
         return _loc1_;
      }
      
      public function getProgress() : int
      {
         var _loc1_:int = 0;
         for each(var _loc2_ in var_2325)
         {
            _loc1_ += _loc2_.getProgress();
         }
         return _loc1_;
      }
      
      public function getCategoryByCode(param1:String) : com.sulake.habbo.quest.AchievementCategory
      {
         for each(var _loc2_ in var_2325)
         {
            if(_loc2_.code == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
