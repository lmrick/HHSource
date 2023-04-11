package com.sulake.habbo.catalog.targetedoffers.data
{
   public class HabboMallOffer
   {
       
      
      private var var_4105:int;
      
      private var var_328:String;
      
      private var var_462:String;
      
      private var _highlight:String;
      
      private var _description:String;
      
      private var var_350:String;
      
      private var _smallImageUrl:String;
      
      private var var_389:int;
      
      public function HabboMallOffer(param1:Object)
      {
         super();
         var_4105 = parseInt(param1.targetedOfferId);
         var_328 = param1.identifier;
         var_462 = param1.header;
         _highlight = param1.highlight;
         _description = param1.description;
         var_350 = param1.imageUrl;
         _smallImageUrl = param1.smallImageUrl;
         var_389 = parseInt(param1.trackingStateCode);
      }
      
      public function get targetedOfferId() : int
      {
         return var_4105;
      }
      
      public function get identifier() : String
      {
         return var_328;
      }
      
      public function get title() : String
      {
         return var_462;
      }
      
      public function get highlight() : String
      {
         return _highlight;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function get imageUrl() : String
      {
         return var_350;
      }
      
      public function get smallImageUrl() : String
      {
         return _smallImageUrl;
      }
      
      public function get trackingState() : int
      {
         return var_389;
      }
   }
}
