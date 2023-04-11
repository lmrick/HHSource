package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.room.object.data.class_1666;
   import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;
   
   public class InfoStandCrackableFurniView extends InfoStandFurniView
   {
       
      
      public function InfoStandCrackableFurniView(param1:InfoStandWidget, param2:String, param3:IHabboCatalog)
      {
         super(param1,param2,param3);
      }
      
      override public function update(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         super.update(param1);
         var _loc2_:class_1666 = param1.stuffData as class_1666;
         showButton("use",true);
         _buttons.visible = true;
         setHitsAndTarget(_loc2_.hits,_loc2_.target);
      }
      
      private function setHitsAndTarget(param1:int, param2:int) : void
      {
         var _loc3_:class_3127 = var_1496.getListItemByName("hits_remaining");
         if(_loc3_ == null)
         {
            return;
         }
         var_1429.localizations.registerParameter("infostand.crackable_furni.hits_remaining","hits",String(param1));
         var_1429.localizations.registerParameter("infostand.crackable_furni.hits_remaining","target",String(param2));
         _loc3_.visible = true;
         updateWindow();
      }
      
      override protected function createWindow(param1:String) : void
      {
         var _loc2_:class_3127 = null;
         var _loc5_:int = 0;
         var _loc4_:XmlAsset = var_1429.assets.getAssetByName("crackable_furni_view") as XmlAsset;
         _window = var_1429.windowManager.buildFromXML(_loc4_.content as XML) as IItemListWindow;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var_1438 = _window.getListItemByName("info_border") as class_3213;
         _buttons = _window.getListItemByName("button_list") as IItemListWindow;
         if(var_1438 != null)
         {
            var_1496 = var_1438.findChildByName("infostand_element_list") as IItemListWindow;
         }
         _window.name = param1;
         var_1429.mainContainer.addChild(_window);
         var _loc3_:class_3127 = var_1438.findChildByTag("close");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener("WME_CLICK",onClose);
         }
         if(_buttons != null)
         {
            _loc5_ = 0;
            while(_loc5_ < _buttons.numListItems)
            {
               _loc2_ = _buttons.getListItemAt(_loc5_);
               _loc2_.addEventListener("WME_CLICK",onButtonClicked);
               _loc5_++;
            }
         }
         _catalogButton = var_1438.findChildByTag("catalog");
         if(_catalogButton != null)
         {
            _catalogButton.addEventListener("WME_CLICK",onCatalogButtonClicked);
         }
         _rentButton = var_1438.findChildByName("rent_button");
         if(_rentButton != null)
         {
            _rentButton.addEventListener("WME_CLICK",onRentButtonClicked);
         }
         _extendButton = var_1438.findChildByName("extend_button");
         if(_extendButton != null)
         {
            _extendButton.addEventListener("WME_CLICK",onExtendButtonClicked);
         }
         _buyoutButton = var_1438.findChildByName("buyout_button");
         if(_buyoutButton != null)
         {
            _buyoutButton.addEventListener("WME_CLICK",onBuyoutButtonClicked);
         }
         var _loc6_:IRegionWindow;
         if((_loc6_ = var_1496.getListItemByName("owner_region") as IRegionWindow) != null)
         {
            _loc6_.addEventListener("WME_CLICK",onOwnerRegion);
            _loc6_.addEventListener("WME_OVER",onOwnerRegion);
            _loc6_.addEventListener("WME_OUT",onOwnerRegion);
         }
      }
   }
}
