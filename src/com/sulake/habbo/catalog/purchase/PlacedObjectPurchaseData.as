package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.session.product.class_3200;
   
   public class PlacedObjectPurchaseData implements class_13
   {
       
      
      private var var_311:Boolean = false;
      
      private var var_347:int;
      
      private var var_774:int;
      
      private var var_354:int;
      
      private var _wallLocation:String = "";
      
      private var var_29:int = 0;
      
      private var var_28:int = 0;
      
      private var _direction:int = 0;
      
      private var _offerId:int;
      
      private var var_531:int;
      
      private var var_1008:class_3200;
      
      private var var_1489:class_3148;
      
      private var var_2725:String;
      
      public function PlacedObjectPurchaseData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:class_3159)
      {
         super();
         var_354 = param1;
         var_347 = param2;
         var_774 = param3;
         _wallLocation = param4;
         var_29 = param5;
         var_28 = param6;
         _direction = param7;
         setOfferData(param8);
      }
      
      public function dispose() : void
      {
         var_311 = true;
         var_1008 = null;
         var_1489 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      private function setOfferData(param1:class_3159) : void
      {
         _offerId = param1.offerId;
         var_531 = param1.product.productClassId;
         var_1008 = param1.product.productData;
         var_1489 = param1.product.furnitureData;
         var_2725 = param1.product.extraParam;
      }
      
      public function toString() : String
      {
         return [var_354,var_347,var_774,_wallLocation,var_29,var_28,_direction,_offerId,var_531].toString();
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get category() : int
      {
         return var_774;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get wallLocation() : String
      {
         return _wallLocation;
      }
      
      public function get x() : int
      {
         return var_29;
      }
      
      public function get y() : int
      {
         return var_28;
      }
      
      public function get direction() : int
      {
         return _direction;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get productClassId() : int
      {
         return var_531;
      }
      
      public function get extraParameter() : String
      {
         return var_2725;
      }
      
      public function get furniData() : class_3148
      {
         return var_1489;
      }
   }
}
