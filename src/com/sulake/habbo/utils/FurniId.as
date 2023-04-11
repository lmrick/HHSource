package com.sulake.habbo.utils
{
   public class FurniId
   {
      
      private static const const_737:int = 2147418112;
       
      
      public function FurniId()
      {
         super();
      }
      
      public static function isBuilderClubId(param1:int) : Boolean
      {
         return param1 >= 2147418112;
      }
   }
}
