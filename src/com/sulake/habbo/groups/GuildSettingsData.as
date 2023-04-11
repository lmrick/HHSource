package com.sulake.habbo.groups
{
   import package_5.class_1110;
   
   public class GuildSettingsData
   {
       
      
      private var var_1154:int = 0;
      
      private var var_2990:int = 0;
      
      private var var_2858:Boolean = false;
      
      public function GuildSettingsData(param1:class_1110 = null)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var_1154 = param1.guildType;
         var_2990 = param1.guildRightsLevel;
      }
      
      public function get guildType() : int
      {
         return var_1154;
      }
      
      public function set guildType(param1:int) : void
      {
         if(param1 != var_1154)
         {
            var_2858 = true;
         }
         var_1154 = param1;
      }
      
      public function get rightsLevel() : int
      {
         return var_2990;
      }
      
      public function set rightsLevel(param1:int) : void
      {
         if(param1 != var_2990)
         {
            var_2858 = true;
         }
         var_2990 = param1;
      }
      
      public function get isModified() : Boolean
      {
         return var_2858;
      }
      
      public function resetModified() : void
      {
         var_2858 = false;
      }
   }
}
