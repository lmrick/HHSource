package com.sulake.habbo.moderation
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import package_20.class_973;
   
   public class HideDiscussionThread
   {
       
      
      private var _main:com.sulake.habbo.moderation.ModerationManager;
      
      private var _popup:com.sulake.habbo.moderation.ChatlogCtrl;
      
      private var _groupId:int;
      
      private var var_284:int;
      
      public function HideDiscussionThread(param1:com.sulake.habbo.moderation.ModerationManager, param2:com.sulake.habbo.moderation.ChatlogCtrl, param3:class_3127, param4:int, param5:int)
      {
         super();
         _main = param1;
         _popup = param2;
         _groupId = param4;
         var_284 = param5;
         param3.procedure = onClick;
      }
      
      private function onClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _popup.dispose();
         _main.connection.send(new class_973(_groupId,var_284,20));
      }
   }
}
