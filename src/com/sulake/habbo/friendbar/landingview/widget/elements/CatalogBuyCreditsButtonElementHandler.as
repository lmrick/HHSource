package com.sulake.habbo.friendbar.landingview.widget.elements
{
   public class CatalogBuyCreditsButtonElementHandler extends class_3529
   {
       
      
      public function CatalogBuyCreditsButtonElementHandler()
      {
         super();
      }
      
      override protected function onClick() : void
      {
         landingView.catalog.openCreditsHabblet();
         landingView.tracking.trackGoogle("landingView","click_credithabblet");
      }
   }
}
