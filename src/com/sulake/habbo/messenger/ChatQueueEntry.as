package com.sulake.habbo.messenger
{
   public class ChatQueueEntry
   {
       
      
      private var var_3851:int;
      
      private var _chatEntry:com.sulake.habbo.messenger.ChatEntry;
      
      private var var_3966:Boolean;
      
      public function ChatQueueEntry(param1:int, param2:com.sulake.habbo.messenger.ChatEntry, param3:Boolean)
      {
         super();
         var_3851 = param1;
         _chatEntry = param2;
         var_3966 = param3;
      }
      
      public function get conversationId() : int
      {
         return var_3851;
      }
      
      public function get chatEntry() : com.sulake.habbo.messenger.ChatEntry
      {
         return _chatEntry;
      }
      
      public function get updateIndicator() : Boolean
      {
         return var_3966;
      }
   }
}
