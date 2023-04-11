package com.sulake.habbo.moderation
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   
   public class OpenRoomInSpectatorMode
   {
       
      
      private var _main:com.sulake.habbo.moderation.ModerationManager;
      
      private var var_354:int;
      
      public function OpenRoomInSpectatorMode(param1:com.sulake.habbo.moderation.ModerationManager, param2:class_3127, param3:int)
      {
         super();
         _main = param1;
         var_354 = param3;
         param2.procedure = onClick;
      }
      
      private function onClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _main.goToRoom(var_354);
      }
   }
}
