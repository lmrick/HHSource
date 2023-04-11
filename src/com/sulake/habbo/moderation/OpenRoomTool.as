package com.sulake.habbo.moderation
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.utils.class_3132;
   
   public class OpenRoomTool
   {
       
      
      private var _frame:class_3281;
      
      private var _main:com.sulake.habbo.moderation.ModerationManager;
      
      private var var_354:int;
      
      public function OpenRoomTool(param1:class_3281, param2:com.sulake.habbo.moderation.ModerationManager, param3:class_3127, param4:int)
      {
         super();
         _frame = param1;
         _main = param2;
         var_354 = param4;
         param3.procedure = onClick;
      }
      
      private function onClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _main.windowTracker.show(new RoomToolCtrl(_main,var_354),_frame,false,false,true);
      }
      
      private function onAlertClose(param1:class_3132, param2:class_3134) : void
      {
         param1.dispose();
      }
   }
}
