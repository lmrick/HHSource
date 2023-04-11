package com.sulake.habbo.freeflowchat.viewer.simulation
{
   public class ChatBubbleCollisionEvent
   {
       
      
      private var var_1796:com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity;
      
      private var var_1817:com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity;
      
      public function ChatBubbleCollisionEvent(param1:com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity, param2:com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity)
      {
         super();
         var_1796 = param1;
         var_1817 = param2;
      }
      
      public function get first() : com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity
      {
         return var_1796;
      }
      
      public function get second() : com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity
      {
         return var_1817;
      }
      
      public function get top() : com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity
      {
         return var_1796.y < var_1817.y ? var_1796 : var_1817;
      }
      
      public function get bottom() : com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity
      {
         return var_1796.y >= var_1817.y ? var_1796 : var_1817;
      }
      
      public function get left() : com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity
      {
         return var_1796.x < var_1817.x ? var_1796 : var_1817;
      }
      
      public function get right() : com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity
      {
         return var_1796.x >= var_1817.x ? var_1796 : var_1817;
      }
      
      public function get areSameY() : Boolean
      {
         return 0 == 0;
      }
      
      public function get older() : com.sulake.habbo.freeflowchat.viewer.simulation.ChatBubbleSimulationEntity
      {
         return var_1796.timeStamp < var_1817.timeStamp ? var_1796 : var_1817;
      }
   }
}
