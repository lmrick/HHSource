package com.sulake.habbo.catalog.marketplace
{
   import com.sulake.habbo.room.IStuffData;
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
      
      public static const const_453:int = 1;
      
      public static const const_474:int = 2;
       
      
      private var _offerId:int;
      
      private var var_490:int;
      
      private var var_1023:int;
      
      private var var_1271:String;
      
      private var var_921:IStuffData;
      
      private var var_958:int;
      
      private var var_1010:int;
      
      private var _imageCallback:int;
      
      private var _status:int;
      
      private var var_1212:int = -1;
      
      private var _offerCount:int;
      
      private var var_973:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:IStuffData, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         _offerId = param1;
         var_490 = param2;
         var_1023 = param3;
         var_1271 = param4;
         var_921 = param5;
         var_958 = param6;
         _status = param7;
         var_1010 = param8;
         _offerCount = param9;
      }
      
      public function dispose() : void
      {
         if(var_973)
         {
            var_973.dispose();
            var_973 = null;
         }
         if(var_921)
         {
            var_921 = null;
         }
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniId() : int
      {
         return var_490;
      }
      
      public function get furniType() : int
      {
         return var_1023;
      }
      
      public function get extraData() : String
      {
         return var_1271;
      }
      
      public function get stuffData() : IStuffData
      {
         return var_921;
      }
      
      public function get price() : int
      {
         return var_958;
      }
      
      public function get averagePrice() : int
      {
         return var_1010;
      }
      
      public function get image() : BitmapData
      {
         return var_973;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(var_973 != null)
         {
            var_973.dispose();
         }
         var_973 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         _imageCallback = param1;
      }
      
      public function get imageCallback() : int
      {
         return _imageCallback;
      }
      
      public function get status() : int
      {
         return _status;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1212;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         var_1212 = param1;
      }
      
      public function set price(param1:int) : void
      {
         var_958 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         _offerId = param1;
      }
      
      public function get offerCount() : int
      {
         return _offerCount;
      }
      
      public function set offerCount(param1:int) : void
      {
         _offerCount = param1;
      }
      
      public function get isUniqueLimitedItem() : Boolean
      {
         return stuffData != null && false;
      }
   }
}
