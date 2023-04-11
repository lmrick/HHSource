package com.sulake.habbo.catalog.enum
{
   public class VideoOfferTypeEnum
   {
      
      public static const CREDIT:com.sulake.habbo.catalog.enum.VideoOfferTypeEnum = new com.sulake.habbo.catalog.enum.VideoOfferTypeEnum(0);
      
      public static const SNOWWAR:com.sulake.habbo.catalog.enum.VideoOfferTypeEnum = new com.sulake.habbo.catalog.enum.VideoOfferTypeEnum(1);
       
      
      private var var_195:int = 0;
      
      public function VideoOfferTypeEnum(param1:int)
      {
         super();
         var_195 = param1;
      }
      
      public function get value() : int
      {
         return var_195;
      }
      
      public function equals(param1:com.sulake.habbo.catalog.enum.VideoOfferTypeEnum) : Boolean
      {
         return param1 && param1.var_195 == var_195;
      }
   }
}
