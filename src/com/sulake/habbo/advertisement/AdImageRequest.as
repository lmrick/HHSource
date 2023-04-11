package com.sulake.habbo.advertisement
{
   public class AdImageRequest
   {
      private var var_354:int;
      
      private var var_347:int;
      
      private var var_907:int;
      
      private var var_4129:String;
      
      private var var_4076:String;
      
      public function AdImageRequest(param1:int, param2:String = null, param3:String = null, param4:int = -1, param5:int = -1)
      {
         super();
         var_354 = param1;
         var_347 = param4;
         var_907 = param5;
         var_4129 = param2;
         var_4076 = param3;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get objectCategory() : int
      {
         return var_907;
      }
      
      public function get imageURL() : String
      {
         return var_4129;
      }
      
      public function get clickURL() : String
      {
         return var_4076;
      }
   }
}
