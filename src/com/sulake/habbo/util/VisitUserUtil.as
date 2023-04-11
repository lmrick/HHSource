package com.sulake.habbo.util
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.moderation.ModerationManager;
   import package_33.class_430;
   
   public class VisitUserUtil
   {
       
      
      private var _main:ModerationManager;
      
      private var var_339:int;
      
      public function VisitUserUtil(param1:ModerationManager, param2:class_3127, param3:int)
      {
         super();
         _main = param1;
         var_339 = param3;
         param2.procedure = onClick;
      }
      
      private function onClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _main.connection.send(new class_430(var_339));
      }
   }
}
