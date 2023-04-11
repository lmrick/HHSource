package com.sulake.habbo.friendbar.landingview.widget.elements
{
   public class CatalogBuyVIPButtonElementHandler extends class_3529
   {
       
      
      public function CatalogBuyVIPButtonElementHandler()
      {
         super();
      }
      
      override protected function onClick() : void
      {
         landingView.catalog.openClubCenter();
         landingView.tracking.trackGoogle("landingView","click_buyVip");
      }
   }
}
