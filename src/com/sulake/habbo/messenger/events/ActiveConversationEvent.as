package com.sulake.habbo.messenger.events
{
   import flash.events.Event;
   
   public class ActiveConversationEvent extends Event
   {
      
      public static const ACTIVE_CONVERSATION_COUNT_CHANGED:String = "ACCE_changed";
       
      
      private var var_3869:int;
      
      public function ActiveConversationEvent(param1:String, param2:int = -1)
      {
         super(param1);
         var_3869 = param2;
      }
      
      public function get activeConversationsCount() : int
      {
         return var_3869;
      }
   }
}
