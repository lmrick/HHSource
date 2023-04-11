package com.sulake.habbo.groups
{
   public class GuildKickData
   {
       
      
      private var var_3962:int;
      
      private var var_4000:int;
      
      private var var_4182:Boolean;
      
      public function GuildKickData(param1:int, param2:int, param3:Boolean = false)
      {
         super();
         var_3962 = param1;
         var_4000 = param2;
         var_4182 = param3;
      }
      
      public function get kickTargetId() : int
      {
         return var_3962;
      }
      
      public function get kickGuildId() : int
      {
         return var_4000;
      }
      
      public function get targetBlocked() : Boolean
      {
         return var_4182;
      }
   }
}
