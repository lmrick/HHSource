package com.sulake.habbo.catalog.navigation
{
   public class RequestedPage
   {
      
      public static const REQUEST_TYPE_NONE:int = 0;
      
      public static const REQUEST_TYPE_ID:int = 1;
      
      public static const REQUEST_TYPE_NAME:int = 2;
       
      
      private var var_2366:int;
      
      private var var_438:int;
      
      private var var_891:int;
      
      private var _requestName:String;
      
      public function RequestedPage()
      {
         super();
         var_2366 = 0;
      }
      
      public function set requestById(param1:int) : void
      {
         var_2366 = 1;
         var_438 = param1;
      }
      
      public function set requestByName(param1:String) : void
      {
         var_2366 = 2;
         _requestName = param1;
      }
      
      public function resetRequest() : void
      {
         var_2366 = 0;
         var_891 = -1;
      }
      
      public function get requestType() : int
      {
         return var_2366;
      }
      
      public function get requestId() : int
      {
         return var_438;
      }
      
      public function get requestedOfferId() : int
      {
         return var_891;
      }
      
      public function set requestedOfferId(param1:int) : void
      {
         var_891 = param1;
      }
      
      public function get requestName() : String
      {
         return _requestName;
      }
   }
}
