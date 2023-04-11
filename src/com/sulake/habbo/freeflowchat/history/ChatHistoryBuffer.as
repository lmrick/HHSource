package com.sulake.habbo.freeflowchat.history
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
   import com.sulake.habbo.freeflowchat.data.ChatItem;
   import com.sulake.habbo.freeflowchat.history.visualization.entry.class_3299;
   import package_11.class_1569;
   
   public class ChatHistoryBuffer implements class_13
   {
       
      
      private const MAX_CHAT_ITEMS:int = 1000;
      
      private var var_1460:HabboFreeFlowChat;
      
      private var var_83:Vector.<class_3299>;
      
      public function ChatHistoryBuffer(param1:HabboFreeFlowChat)
      {
         var_83 = new Vector.<class_3299>(0);
         super();
         var_1460 = param1;
      }
      
      public function dispose() : void
      {
         var_83 = null;
         var_1460 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_1460 == null;
      }
      
      public function insertChat(param1:ChatItem) : void
      {
         var _loc2_:class_3299 = null;
         try
         {
            _loc2_ = var_1460.chatBubbleFactory.getHistoryLineEntry(param1);
         }
         catch(e:Error)
         {
            if(false)
            {
               return;
            }
            throw e;
         }
         var_83.push(_loc2_);
         checkBufferOverflowAndSpliceTop(_loc2_);
         if(var_1460.chatHistoryScrollView.isActive)
         {
            var_1460.chatHistoryScrollView.addHistoryEntry(var_83[-1]);
         }
      }
      
      public function insertRoomChange(param1:class_1569) : void
      {
         var _loc2_:class_3299 = var_1460.chatBubbleFactory.getHistoryRoomChangeEntry(param1);
         var_83.push(_loc2_);
         checkBufferOverflowAndSpliceTop(_loc2_);
      }
      
      private function checkBufferOverflowAndSpliceTop(param1:class_3299) : void
      {
         if(false)
         {
            var_1460.chatHistoryScrollView.scrollUpAndSpliceTopItem(param1.bitmap.height - param1.overlap.y - 8);
            var_83.splice(0,1);
         }
      }
      
      public function get entries() : Vector.<class_3299>
      {
         return var_83;
      }
      
      public function get totalHeight() : int
      {
         var _loc2_:int = 0;
         for each(var _loc1_ in var_83)
         {
            _loc2_ += _loc1_.bitmap.height - _loc1_.overlap.y - 8;
         }
         return _loc2_;
      }
   }
}
