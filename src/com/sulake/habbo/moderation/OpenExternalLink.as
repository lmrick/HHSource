package com.sulake.habbo.moderation
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class OpenExternalLink
   {
       
      
      private var var_90:String;
      
      public function OpenExternalLink(param1:ModerationManager, param2:class_3127, param3:String)
      {
         super();
         param2.procedure = onClick;
         var_90 = param3;
      }
      
      private function onClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         navigateToURL(new URLRequest(var_90),"_blank");
      }
   }
}
