package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay
{
   public class ExtraInfoItemData
   {
      
      public static const TYPE_PROMO:int = 0;
      
      public static const const_705:int = 1;
      
      public static const const_542:int = 2;
      
      public static const TYPE_BONUS_BADGE:int = 3;
      
      public static const const_604:int = 4;
      
      public static const TYPE_RESET_MESSAGE:int = 5;
       
      
      private var var_271:int;
      
      private var _text:String;
      
      private var var_2187:int;
      
      private var var_349:int;
      
      private var var_4227:int;
      
      private var var_4094:int;
      
      private var var_908:int;
      
      private var var_703:int;
      
      private var var_331:String;
      
      private var var_3897:String;
      
      public function ExtraInfoItemData(param1:int, param2:String = "")
      {
         super();
         var_271 = param1;
         _text = param2;
      }
      
      public function set text(param1:String) : void
      {
         _text = param1;
      }
      
      public function set quantity(param1:int) : void
      {
         var_2187 = param1;
      }
      
      public function set activityPointType(param1:int) : void
      {
         var_349 = param1;
      }
      
      public function set discountPriceCredits(param1:int) : void
      {
         var_4227 = param1;
      }
      
      public function set discountPriceActivityPoints(param1:int) : void
      {
         var_4094 = param1;
      }
      
      public function set priceCredits(param1:int) : void
      {
         var_908 = param1;
      }
      
      public function set priceActivityPoints(param1:int) : void
      {
         var_703 = param1;
      }
      
      public function set badgeCode(param1:String) : void
      {
         var_331 = param1;
      }
      
      public function set achievementCode(param1:String) : void
      {
         var_3897 = param1;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      public function get quantity() : int
      {
         return var_2187;
      }
      
      public function get priceCredits() : int
      {
         return var_908;
      }
      
      public function get priceActivityPoints() : int
      {
         return var_703;
      }
      
      public function get activityPointType() : int
      {
         return var_349;
      }
      
      public function get badgeCode() : String
      {
         return var_331;
      }
      
      public function get achievementCode() : String
      {
         return var_3897;
      }
      
      public function get discountPriceCredits() : int
      {
         return var_4227;
      }
      
      public function get discountPriceActivityPoints() : int
      {
         return var_4094;
      }
   }
}
