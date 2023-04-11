package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniActionMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetGetBadgeDetailsMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
   import com.sulake.habbo.utils.FriendlyTime;
   import com.sulake.habbo.utils.class_3288;
   import com.sulake.habbo.window.widgets.ILimitedItemPreviewOverlayWidget;
   import com.sulake.habbo.window.widgets.IRarityItemPreviewOverlayWidget;
   import com.sulake.habbo.window.widgets.class_3366;
   import com.sulake.room.object.IRoomObject;
   import flash.display.BitmapData;
   
   public class InfoStandFurniView
   {
      
      private static const const_741:int = -12345678;
       
      
      protected var _window:IItemListWindow;
      
      protected var var_1702:class_3151;
      
      protected var var_3806:class_3127;
      
      protected var var_1438:class_3213;
      
      protected var _buttons:IItemListWindow;
      
      protected var _catalog:IHabboCatalog;
      
      protected var _habboTracking:class_1693;
      
      protected var _catalogButton:class_3127;
      
      protected var _rentButton:class_3127;
      
      protected var _extendButton:class_3127;
      
      protected var _buyoutButton:class_3127;
      
      private var var_1832:int;
      
      private var var_684:int = 0;
      
      protected var var_1429:com.sulake.habbo.ui.widget.infostand.InfoStandWidget;
      
      protected var var_1496:IItemListWindow;
      
      private const const_470:int = 0;
      
      private const const_1141:int = 1;
      
      private const const_822:int = 2;
      
      public function InfoStandFurniView(param1:com.sulake.habbo.ui.widget.infostand.InfoStandWidget, param2:String, param3:IHabboCatalog)
      {
         var_1832 = const_470;
         super();
         var_1429 = param1;
         _catalog = param3;
         _habboTracking = HabboTracking.getInstance();
         createWindow(param2);
      }
      
      public function dispose() : void
      {
         _catalog = null;
         var_1429 = null;
         _window.dispose();
         _window = null;
      }
      
      public function get window() : IItemListWindow
      {
         return _window;
      }
      
      protected function createWindow(param1:String) : void
      {
         var _loc2_:class_3127 = null;
         var _loc5_:int = 0;
         var _loc4_:XmlAsset = var_1429.assets.getAssetByName("furni_view") as XmlAsset;
         _window = var_1429.windowManager.buildFromXML(_loc4_.content as XML) as IItemListWindow;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var_1438 = _window.getListItemByName("info_border") as class_3213;
         _buttons = _window.getListItemByName("button_list") as IItemListWindow;
         var_1702 = _window.getListItemByName("custom_variables") as class_3151;
         if(!var_1429.handler.container.sessionDataManager.hasSecurity(5))
         {
            var_1702.dispose();
            var_1702 = null;
         }
         if(var_1702 != null)
         {
            var_1702.procedure = customVarsWindowProcedure;
            var_3806 = IItemListWindow(var_1702.findChildByName("variable_list")).removeListItemAt(0);
         }
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
         var _loc7_:class_3127;
         if(_loc7_ = var_1438.findChildByName("group_details_container"))
         {
            _loc7_.addEventListener("WME_CLICK",onGroupInfoClicked);
         }
      }
      
      private function customVarsWindowProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc5_:class_24 = null;
         var _loc3_:IItemListWindow = null;
         var _loc4_:int = 0;
         var _loc6_:class_3151 = null;
         if(param1.type != "WME_CLICK" || var_1702 == null)
         {
            return;
         }
         var _loc7_:* = param2.name;
         if("set_values" === _loc7_)
         {
            _loc5_ = new class_24();
            _loc3_ = var_1702.findChildByName("variable_list") as IItemListWindow;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.numListItems)
            {
               _loc6_ = _loc3_.getListItemAt(_loc4_) as class_3151;
               _loc5_[_loc6_.name] = _loc6_.findChildByName("value").caption;
               _loc4_++;
            }
            var_1429.handler.setObjectData(_loc5_);
         }
      }
      
      protected function onBuyoutButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:class_3148 = null;
         if(_catalog != null && var_1429 && false)
         {
            _loc2_ = getFurnitureData(var_1429.furniData);
            if(_loc2_)
            {
               _catalog.openRentConfirmationWindow(_loc2_,true,var_1429.furniData.id);
            }
         }
      }
      
      protected function onExtendButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:class_3148 = null;
         if(_catalog != null && var_1429 && false)
         {
            _loc2_ = getFurnitureData(var_1429.furniData);
            if(_loc2_)
            {
               _catalog.openRentConfirmationWindow(_loc2_,false,var_1429.furniData.id);
            }
         }
      }
      
      private function getRoomObject(param1:int) : IRoomObject
      {
         var _loc3_:int = var_1429.handler.container.roomSession.roomId;
         var _loc2_:IRoomObject = var_1429.handler.container.roomEngine.getRoomObject(_loc3_,param1,10);
         if(_loc2_ == null)
         {
            _loc2_ = var_1429.handler.container.roomEngine.getRoomObject(_loc3_,param1,20);
         }
         return _loc2_;
      }
      
      private function getFurnitureData(param1:InfoStandFurniData) : class_3148
      {
         var _loc4_:class_3148 = null;
         var _loc2_:IRoomObject = getRoomObject(param1.id);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:* = var_1429.furniData.category == 20;
         var _loc5_:int = int(_loc2_.getModel().getNumber("furniture_type_id"));
         if(_loc3_)
         {
            _loc4_ = var_1429.handler.container.sessionDataManager.getWallItemData(_loc5_);
         }
         else
         {
            _loc4_ = var_1429.handler.container.sessionDataManager.getFloorItemData(_loc5_);
         }
         return _loc4_;
      }
      
      protected function onRentButtonClicked(param1:WindowMouseEvent) : void
      {
         if(_catalog != null)
         {
            _catalog.openCatalogPageByOfferId(var_1429.furniData.rentOfferId,"NORMAL");
         }
      }
      
      protected function onClose(param1:WindowMouseEvent) : void
      {
         var_1429.close();
      }
      
      public function set name(param1:String) : void
      {
         var _loc2_:ITextWindow = var_1496.getListItemByName("name_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         _loc2_.visible = true;
         _loc2_.height = _loc2_.textHeight + 5;
         updateWindow();
      }
      
      public function set furniImage(param1:BitmapData) : void
      {
         setImage(param1,"image");
      }
      
      private function setImage(param1:BitmapData, param2:String) : void
      {
         var _loc3_:class_3282 = var_1438.findChildByName(param2) as class_3282;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = new BitmapData(_loc3_.width,40,true);
         }
         _loc3_.height = Math.min(param1.height,200);
         _loc3_.bitmap = param1.clone();
         _loc3_.visible = true;
         updateWindow();
      }
      
      public function set description(param1:String) : void
      {
         var _loc2_:ITextWindow = var_1496.getListItemByName("description_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         _loc2_.height = _loc2_.textHeight + 5;
         updateWindow();
      }
      
      public function setOwnerInfo(param1:int, param2:String) : void
      {
         var _loc4_:IRegionWindow = null;
         var _loc5_:ITextWindow = null;
         var _loc3_:class_3127 = null;
         var _loc6_:class_3127 = null;
         var_684 = param1;
         if(var_684 == 0)
         {
            showWindow("owner_region",false);
            showWindow("owner_spacer",false);
         }
         else
         {
            _loc5_ = (_loc4_ = var_1496.getListItemByName("owner_region") as IRegionWindow).findChildByName("owner_name") as ITextWindow;
            _loc3_ = _loc4_.findChildByName("owner_link");
            _loc6_ = _loc4_.findChildByName("bcw_icon");
            if(var_684 != -12345678)
            {
               _loc5_.text = param2;
               _loc4_.toolTipCaption = var_1429.localizations.getLocalization("infostand.profile.link.tooltip","");
               _loc4_.toolTipDelay = 100;
               _loc3_.visible = true;
               if(_loc6_ != null)
               {
                  _loc6_.visible = false;
               }
            }
            else
            {
               _loc5_.text = "${builder.catalog.title}";
               _loc4_.toolTipCaption = "";
               _loc3_.visible = false;
               if(_loc6_ != null)
               {
                  _loc6_.visible = true;
               }
            }
            showWindow("owner_region",true);
            showWindow("owner_spacer",true);
         }
         updateWindow();
      }
      
      private function set expiration(param1:int) : void
      {
         var _loc2_:class_3127 = var_1496.getListItemByName("expiration_text");
         if(_loc2_ == null)
         {
            return;
         }
         var_1429.localizations.registerParameter("infostand.rent.expiration","time",FriendlyTime.getFriendlyTime(var_1429.handler.container.localization,param1));
         _loc2_.visible = param1 >= 0 && var_684 == var_1429.handler.container.sessionDataManager.userId;
         updateWindow();
      }
      
      protected function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc4_:RoomWidgetMessage = null;
         var _loc5_:String = null;
         var _loc3_:String = null;
         var _loc2_:class_3127 = param1.target as class_3127;
         switch(_loc2_.name)
         {
            case "rotate":
               _loc5_ = "RWFUAM_ROTATE";
               break;
            case "move":
               _loc5_ = "RWFAM_MOVE";
               break;
            case "pickup":
               if(var_1832 == 2)
               {
                  _loc5_ = "RWFAM_PICKUP";
               }
               else
               {
                  _loc5_ = "RWFAM_EJECT";
               }
               var_1429.close();
               break;
            case "save_branding_configuration":
               if(var_1429.handler.container.sessionDataManager.hasSecurity(4))
               {
                  _loc5_ = "RWFAM_SAVE_STUFF_DATA";
                  _loc3_ = getVisibleAdFurnitureExtraParams();
                  break;
               }
            case "use":
               _loc5_ = "RWFAM_USE";
         }
         if(_loc5_ != null)
         {
            _loc4_ = new RoomWidgetFurniActionMessage(_loc5_,var_1429.furniData.id,var_1429.furniData.category,var_1429.furniData.purchaseOfferId,_loc3_);
            var_1429.messageListener.processWidgetMessage(_loc4_);
         }
      }
      
      private function onGroupInfoClicked(param1:WindowMouseEvent) : void
      {
         var_1429.messageListener.processWidgetMessage(new RoomWidgetGetBadgeDetailsMessage(false,var_1429.furniData.groupId));
      }
      
      protected function onCatalogButtonClicked(param1:WindowMouseEvent) : void
      {
         if(_catalog != null)
         {
            _catalog.openCatalogPageByOfferId(var_1429.furniData.purchaseOfferId,"NORMAL");
            if(_habboTracking)
            {
               _habboTracking.trackGoogle("infostandCatalogButton","offer",var_1429.furniData.purchaseOfferId);
            }
         }
      }
      
      protected function onOwnerRegion(param1:WindowMouseEvent) : void
      {
         if(param1.type == "WME_CLICK")
         {
            if(var_684 == -12345678)
            {
               var_1429.handler.container.catalog.toggleBuilderCatalog();
            }
            else
            {
               var_1429.messageListener.processWidgetMessage(new RoomWidgetOpenProfileMessage("RWOPEM_OPEN_USER_PROFILE",var_684,"infoStand_furniView"));
            }
         }
         if(param1.type == "WME_OUT")
         {
            IIconWindow(IRegionWindow(param1.target).findChildByName("owner_link")).style = 21;
         }
         if(param1.type == "WME_OVER")
         {
            IIconWindow(IRegionWindow(param1.target).findChildByName("owner_link")).style = 22;
         }
      }
      
      protected function updateWindow() : void
      {
         if(var_1496 == null || var_1438 == null || _buttons == null)
         {
            return;
         }
         var_1496.arrangeListItems();
         _buttons.width = _buttons.scrollableRegion.width;
         var_1496.height = var_1496.scrollableRegion.height;
         var_1438.height = NaN;
         _window.width = Math.max(var_1438.width,_buttons.width);
         _window.height = _window.scrollableRegion.height;
         if(false)
         {
            var_1438.x = 0 - 0;
            _buttons.x = 0;
         }
         else
         {
            _buttons.x = 0 - 0;
            var_1438.x = 0;
         }
         if(var_1702 != null)
         {
            var_1702.x = var_1438.x;
         }
         var_1429.refreshContainer();
      }
      
      public function update(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         if(var_1438 != null)
         {
            var_1438.color = class_3288.isBuilderClubId(param1.id) ? 14121216 : 16777215;
         }
         name = param1.name;
         description = param1.description;
         furniImage = param1.image;
         expiration = param1.expiration;
         setOwnerInfo(class_3288.isBuilderClubId(param1.id) ? -12345678 : param1.ownerId,param1.ownerName);
         var _loc3_:Boolean = false;
         var _loc4_:* = false;
         var _loc5_:Boolean = false;
         var _loc2_:Boolean = false;
         if(param1.roomControllerLevel >= 1 || param1.isOwner || param1.isRoomOwner || param1.isAnyRoomController)
         {
            _loc3_ = true;
            _loc4_ = !param1.isWallItem;
         }
         if(param1.isAnyRoomController)
         {
            _loc5_ = true;
         }
         var _loc6_:* = param1.roomControllerLevel >= 1;
         if(param1.usagePolicy == 2 || param1.usagePolicy == 1 && _loc6_ || param1.extraParam == "RWEIEP_JUKEBOX" && _loc6_ || param1.extraParam == "RWEIEP_USABLE_PRODUCT" && _loc6_)
         {
            _loc2_ = Boolean(var_1429.config.getBoolean("infostand.use.button.enabled"));
         }
         updatePickupMode(param1);
         showButton("move",_loc3_);
         showButton("rotate",_loc4_);
         showButton("use",_loc2_);
         showAdFurnitureDetails(_loc5_);
         showGroupInfo(param1.groupId > 0);
         updatePurchaseButtonVisibility(param1.isOwner,param1.expiration >= 0,param1.purchaseOfferId >= 0,param1.rentOfferId >= 0,param1.purchaseCouldBeUsedForBuyout,param1.rentCouldBeUsedForBuyout);
         showLimitedItem(param1.stuffData.uniqueSerialNumber > 0,param1.stuffData);
         showRarityItem(param1.stuffData.rarityLevel >= 0,param1.stuffData);
         _buttons.visible = _loc3_ || _loc4_ || var_1832 != 0 || _loc2_;
         updateCustomVarsWindow();
         updateWindow();
      }
      
      private function updateCustomVarsWindow() : void
      {
         var _loc1_:class_3151 = null;
         if(var_1702 == null || true)
         {
            return;
         }
         var _loc6_:IRoomObject;
         if((_loc6_ = getRoomObject(var_1429.furniData.id)) == null)
         {
            return;
         }
         var _loc3_:Array = _loc6_.getModel().getStringArray("furniture_custom_variables");
         var_1702.visible = _loc3_ != null && _loc3_.length > 0;
         if(true)
         {
            return;
         }
         var _loc5_:IItemListWindow;
         (_loc5_ = var_1702.findChildByName("variable_list") as IItemListWindow).destroyListItems();
         var _loc4_:class_24 = _loc6_.getModel().getStringToStringMap("furniture_data");
         for each(var _loc2_ in _loc3_)
         {
            _loc1_ = var_3806.clone() as class_3151;
            _loc1_.name = _loc2_;
            _loc1_.findChildByName("name").caption = _loc2_;
            _loc1_.findChildByName("value").caption = _loc4_[_loc2_];
            _loc5_.addListItem(_loc1_);
         }
      }
      
      private function updatePickupMode(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         var_1832 = 0;
         if(param1.isOwner || param1.isAnyRoomController)
         {
            var_1832 = 2;
         }
         else if(param1.isRoomOwner || param1.roomControllerLevel >= 3)
         {
            var_1832 = 1;
         }
         if(param1.isStickie)
         {
            var_1832 = 0;
         }
         showButton("pickup",var_1832 != 0);
         localizePickupButton(var_1832);
      }
      
      private function localizePickupButton(param1:int) : void
      {
         if(_buttons == null)
         {
            return;
         }
         var _loc2_:class_3127 = _buttons.getListItemByName("pickup");
         if(_loc2_ != null)
         {
            if(param1 == 1)
            {
               _loc2_.caption = "${infostand.button.eject}";
            }
            else
            {
               _loc2_.caption = "${infostand.button.pickup}";
            }
         }
      }
      
      private function createAdElement(param1:String, param2:String) : void
      {
         var _loc4_:XmlAsset = null;
         var _loc5_:class_3151 = null;
         var _loc6_:class_3127 = null;
         var _loc3_:class_3127 = null;
         if(var_1496 != null)
         {
            if((_loc4_ = var_1429.assets.getAssetByName("furni_view_branding_element") as XmlAsset) != null)
            {
               if((_loc5_ = var_1429.windowManager.buildFromXML(_loc4_.content as XML) as class_3151) != null)
               {
                  if((_loc6_ = _loc5_.findChildByName("element_name")) != null)
                  {
                     _loc6_.caption = param1;
                  }
                  _loc3_ = _loc5_.findChildByName("element_value");
                  if(_loc3_ != null)
                  {
                     _loc3_.caption = param2;
                     _loc3_.addEventListener("WKE_KEY_DOWN",adElementKeyEventProc);
                  }
                  if(_loc6_ != null && _loc3_ != null)
                  {
                     var_1496.addListItem(_loc5_);
                  }
               }
            }
         }
      }
      
      private function getAdFurnitureExtraParams() : class_24
      {
         var _loc5_:String = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc7_:String = null;
         var _loc6_:String = null;
         var _loc1_:class_24 = new class_24();
         if(var_1429 != null)
         {
            _loc3_ = (_loc5_ = var_1429.furniData.extraParam.substr(23)).split("\t");
            if(_loc3_ != null)
            {
               for each(var _loc2_ in _loc3_)
               {
                  if((_loc4_ = _loc2_.split("=",2)) != null && _loc4_.length == 2)
                  {
                     _loc7_ = String(_loc4_[0]);
                     _loc6_ = String(_loc4_[1]);
                     _loc1_.add(_loc7_,_loc6_);
                  }
               }
            }
         }
         return _loc1_;
      }
      
      private function getVisibleAdFurnitureExtraParams() : String
      {
         var _loc2_:* = null;
         var _loc7_:class_3127 = null;
         var _loc3_:class_3127 = null;
         var _loc5_:String = null;
         var _loc4_:String = null;
         var _loc1_:String = "";
         if(var_1438 != null)
         {
            _loc2_ = [];
            var_1438.groupChildrenWithTag("branding_element",_loc2_,-1);
            if(_loc2_.length > 0)
            {
               for each(var _loc6_ in _loc2_)
               {
                  _loc7_ = _loc6_.findChildByName("element_name");
                  _loc3_ = _loc6_.findChildByName("element_value");
                  if(_loc7_ != null && _loc3_ != null)
                  {
                     _loc5_ = trimAdFurnitureExtramParam(_loc7_.caption);
                     _loc4_ = trimAdFurnitureExtramParam(_loc3_.caption);
                     _loc1_ += _loc5_ + "=" + _loc4_ + "\t";
                  }
               }
            }
         }
         return _loc1_;
      }
      
      private function trimAdFurnitureExtramParam(param1:String) : String
      {
         if(param1 != null)
         {
            if(param1.indexOf("\t") != -1)
            {
               return param1.replace("\t","");
            }
         }
         return param1;
      }
      
      private function showAdFurnitureDetails(param1:Boolean) : void
      {
         var _loc5_:String = null;
         var _loc8_:class_24 = null;
         var _loc9_:String = null;
         if(var_1429 == null || var_1438 == null)
         {
            return;
         }
         var _loc4_:class_3127;
         if((_loc4_ = var_1438.findChildByName("furni_details_spacer")) != null)
         {
            _loc4_.visible = param1;
         }
         var _loc2_:* = [];
         var_1438.groupChildrenWithTag("branding_element",_loc2_,-1);
         if(_loc2_.length > 0)
         {
            for each(var _loc6_ in _loc2_)
            {
               var_1438.removeChild(_loc6_);
               _loc6_.dispose();
            }
         }
         var _loc3_:Boolean = false;
         var _loc7_:class_3127;
         if((_loc7_ = var_1438.findChildByName("furni_details_text") as ITextWindow) != null)
         {
            _loc7_.visible = param1;
            _loc5_ = "id: " + var_1429.furniData.id;
            if((_loc8_ = getAdFurnitureExtraParams()).length > 0)
            {
               _loc3_ = true;
               for each(var _loc10_ in _loc8_.getKeys())
               {
                  _loc9_ = _loc8_.getValue(_loc10_);
                  createAdElement(_loc10_,_loc9_);
               }
            }
            _loc7_.caption = _loc5_;
         }
         showButton("save_branding_configuration",_loc3_);
      }
      
      private function showGroupInfo(param1:Boolean) : void
      {
         showWindow("group_details_spacer",param1);
         showWindow("group_details_container",param1);
         showWindow("group_badge_image",false);
         showWindow("group_name",false);
      }
      
      private function showWindow(param1:String, param2:Boolean) : void
      {
         var _loc3_:class_3127 = var_1438.findChildByName(param1);
         if(_loc3_)
         {
            _loc3_.visible = param2;
         }
      }
      
      private function adElementKeyEventProc(param1:class_3134 = null, param2:class_3127 = null) : void
      {
      }
      
      protected function showButton(param1:String, param2:Boolean) : void
      {
         if(_buttons == null)
         {
            return;
         }
         var _loc3_:class_3127 = _buttons.getListItemByName(param1);
         if(_loc3_ != null)
         {
            _loc3_.visible = param2;
            _buttons.arrangeListItems();
         }
      }
      
      private function updatePurchaseButtonVisibility(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean) : void
      {
         var _loc11_:* = false;
         var _loc9_:Boolean;
         var _loc8_:Boolean = (_loc9_ = param1 && param2) && param6;
         var _loc10_:Boolean = _loc9_ && param5;
         var _loc12_:Boolean = !_loc9_ && param3;
         var _loc13_:Boolean = !_loc9_ && param4;
         if(_catalogButton != null)
         {
            _catalogButton.visible = _loc12_;
            if(!_loc11_)
            {
               _loc11_ = _loc12_;
            }
         }
         if(_rentButton != null)
         {
            _rentButton.visible = _loc13_;
            if(!_loc11_)
            {
               _loc11_ = _loc13_;
            }
         }
         if(_extendButton != null)
         {
            _extendButton.visible = _loc8_;
            if(!_loc11_)
            {
               _loc11_ = _loc8_;
            }
         }
         if(_buyoutButton != null)
         {
            _buyoutButton.visible = _loc10_;
            if(!_loc11_)
            {
               _loc11_ = _loc10_;
            }
         }
         var _loc7_:IItemListWindow;
         if((_loc7_ = var_1496.getListItemByName("purchase_buttons") as IItemListWindow) != null)
         {
            _loc7_.arrangeListItems();
            _loc7_.visible = _loc11_;
         }
         var_1496.arrangeListItems();
      }
      
      public function set groupName(param1:String) : void
      {
         var _loc2_:class_3127 = var_1438.findChildByName("group_name");
         if(_loc2_)
         {
            _loc2_.caption = param1;
            _loc2_.visible = true;
         }
      }
      
      private function showLimitedItem(param1:Boolean, param2:IStuffData) : void
      {
         var _loc3_:class_3217 = null;
         var _loc4_:ILimitedItemPreviewOverlayWidget = null;
         var _loc6_:class_3151 = var_1438.findChildByName("unique_item_background_container") as class_3151;
         var _loc5_:class_3151 = var_1438.findChildByName("unique_item_overlay_container") as class_3151;
         if(!_loc6_ || !_loc5_)
         {
            return;
         }
         if(!param1)
         {
            _loc6_.visible = false;
            _loc5_.visible = false;
         }
         else
         {
            _loc6_.visible = true;
            _loc5_.visible = true;
            _loc3_ = class_3217(_loc5_.findChildByName("unique_item_plaque_widget"));
            (_loc4_ = ILimitedItemPreviewOverlayWidget(_loc3_.widget)).serialNumber = param2.uniqueSerialNumber;
            _loc4_.seriesSize = param2.uniqueSeriesSize;
         }
      }
      
      private function showRarityItem(param1:Boolean, param2:IStuffData) : void
      {
         var _loc3_:class_3217 = null;
         var _loc4_:IRarityItemPreviewOverlayWidget = null;
         var _loc5_:class_3151;
         if(!(_loc5_ = var_1438.findChildByName("rarity_item_overlay_container") as class_3151))
         {
            return;
         }
         if(!param1)
         {
            _loc5_.visible = false;
         }
         else
         {
            _loc5_.visible = true;
            _loc3_ = class_3217(_loc5_.findChildByName("rarity_item_overlay_widget"));
            (_loc4_ = IRarityItemPreviewOverlayWidget(_loc3_.widget)).rarityLevel = param2.rarityLevel;
         }
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var _loc3_:class_3217 = var_1438.findChildByName("group_badge_image") as class_3217;
         var _loc2_:class_3366 = _loc3_.widget as class_3366;
         _loc2_.badgeId = param1;
         _loc2_.groupId = var_1429.furniData.groupId;
         _loc3_.visible = true;
      }
   }
}
