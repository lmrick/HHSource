package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1010:int;
      
      private var var_701:int;
      
      private var _historyLength:int;
      
      private var var_626:Array;
      
      private var var_582:Array;
      
      private var var_598:Array;
      
      private var var_1240:int;
      
      private var var_871:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return var_1010;
      }
      
      public function get offerCount() : int
      {
         return var_701;
      }
      
      public function get historyLength() : int
      {
         return _historyLength;
      }
      
      public function get dayOffsets() : Array
      {
         return var_626;
      }
      
      public function get averagePrices() : Array
      {
         return var_582;
      }
      
      public function get soldAmounts() : Array
      {
         return var_598;
      }
      
      public function get furniTypeId() : int
      {
         return var_1240;
      }
      
      public function get furniCategoryId() : int
      {
         return var_871;
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1010 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_701 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         _historyLength = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         var_626 = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_582 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_598 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1240 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_871 = param1;
      }
   }
}
