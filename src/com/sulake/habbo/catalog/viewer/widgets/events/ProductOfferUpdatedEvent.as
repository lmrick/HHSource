package com.sulake.habbo.catalog.viewer.widgets.events
{
   import com.sulake.habbo.catalog.class_3159;
   import flash.events.Event;
   
   public class ProductOfferUpdatedEvent extends Event
   {
       
      
      private var _offer:class_3159;
      
      public function ProductOfferUpdatedEvent(param1:class_3159, param2:Boolean = false, param3:Boolean = false)
      {
         super("CWE_PRODUCT_OFFER_UPDATED",param2,param3);
         _offer = param1;
      }
      
      public function get offer() : class_3159
      {
         return _offer;
      }
   }
}
