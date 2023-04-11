package com.sulake.habbo.quest.events
{
   import flash.events.Event;
   import package_83.class_1605;
   
   public class QuestCompletedEvent extends Event
   {
      
      public static const QUEST_SEASONAL:String = "qce_seasonal";
       
      
      private var var_526:class_1605;
      
      public function QuestCompletedEvent(param1:String, param2:class_1605, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         var_526 = param2;
      }
      
      public function get questData() : class_1605
      {
         return var_526;
      }
   }
}
