package com.sulake.habbo.moderation
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   
   public class OpenDiscussionThread
   {
       
      
      private var _main:com.sulake.habbo.moderation.ModerationManager;
      
      private var _groupId:int;
      
      private var var_284:int;
      
      public function OpenDiscussionThread(param1:com.sulake.habbo.moderation.ModerationManager, param2:class_3127, param3:int, param4:int)
      {
         super();
         _main = param1;
         _groupId = param3;
         var_284 = param4;
         param2.procedure = onClick;
      }
      
      private function onClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _main.openThread(_groupId,var_284);
      }
   }
}
