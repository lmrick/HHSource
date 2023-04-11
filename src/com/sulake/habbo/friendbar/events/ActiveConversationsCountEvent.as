package com.sulake.habbo.friendbar.events
{
   import flash.events.Event;
   
   public class ActiveConversationsCountEvent extends Event
   {
      
      public static const ACTIVE_MESSENGER_CONVERSATION_EVENT:String = "AMC_EVENT";
       
      
      private var var_3869:int;
      
      public function ActiveConversationsCountEvent(param1:int = -1)
      {
         var_3869 = param1;
         super("AMC_EVENT");
      }
      
      public function get activeConversationsCount() : int
      {
         return var_3869;
      }
   }
}
