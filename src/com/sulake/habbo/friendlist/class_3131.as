package com.sulake.habbo.friendlist
{
   public class class_3131
   {
       
      
      public function class_3131()
      {
         super();
      }
      
      public function getSelectedEntryBgColor() : uint
      {
         return 4282169599;
      }
      
      public function getFriendTextColor(param1:Boolean) : uint
      {
         return param1 ? 4294967295 : 4278190080;
      }
      
      public function getTabFooterTextColor(param1:Boolean) : uint
      {
         return param1 ? 4293848814 : 4289900703;
      }
      
      public function getRowShadingColor(param1:int, param2:Boolean) : uint
      {
         if(param1 == 1)
         {
            return param2 ? 4294967295 : 4293848814;
         }
         if(param1 == 2)
         {
            return param2 ? 4294967295 : 4293848814;
         }
         return param2 ? 4290164406 : 4288651167;
      }
      
      public function getTabTextColor(param1:Boolean, param2:int) : uint
      {
         if(param1)
         {
            return 4294967295;
         }
         if(param2 == 1)
         {
            return 4278190080;
         }
         if(param2 == 2)
         {
            return 4294375158;
         }
         return 4293914607;
      }
      
      public function getTabBgColor(param1:int) : uint
      {
         if(param1 == 1)
         {
            return 4294967295;
         }
         if(param1 == 2)
         {
            return 4294967295;
         }
         return 4290164406;
      }
   }
}
