package com.sulake.habbo.ui.widget.furniture.present
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.inventory.class_1697;
   import com.sulake.habbo.inventory.items.class_3172;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.FurniturePresentWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetEcotronBoxDataUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPresentDataUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetPresentOpenMessage;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.object.IRoomObject;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import package_7.class_985;
   
   public class PresentFurniWidget extends RoomWidgetBase implements class_1870
   {
      
      private static const const_453:String = "floor";
      
      private static const TYPE_WALLPAPER:String = "wallpaper";
      
      private static const TYPE_LANDSCAPE:String = "landscape";
       
      
      private var _habboConfiguration:class_19;
      
      private var _catalog:IHabboCatalog;
      
      private var _inventory:class_1697;
      
      private var _roomEngine:IRoomEngine;
      
      private var _window:class_3281;
      
      private var var_347:int = -1;
      
      private var var_385:int = 0;
      
      private var var_261:String;
      
      private var _text:String;
      
      private var var_282:Boolean;
      
      private var var_1692:Boolean = false;
      
      private var var_3229:String;
      
      private var _senderName:String;
      
      private var var_1101:int = -1;
      
      private var var_1278:String = "";
      
      private var _placedInRoom:Boolean = false;
      
      public function PresentFurniWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18, param5:class_19, param6:IHabboCatalog, param7:class_1697, param8:IRoomEngine)
      {
         super(param1,param2,param3,param4);
         _habboConfiguration = param5;
         _catalog = param6;
         _inventory = param7;
         _roomEngine = param8;
      }
      
      override public function dispose() : void
      {
         hideInterface();
         _habboConfiguration = null;
         _catalog = null;
         _inventory = null;
         _roomEngine = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWPDUE_PACKAGEINFO",onObjectUpdate);
         param1.addEventListener("RWPDUE_CONTENTS",onObjectUpdate);
         param1.addEventListener("RWPDUE_CONTENTS_IMAGE",onObjectUpdate);
         param1.addEventListener("RWPDUE_CONTENTS_CLUB",onObjectUpdate);
         param1.addEventListener("RWPDUE_CONTENTS_FLOOR",onObjectUpdate);
         param1.addEventListener("RWPDUE_CONTENTS_LANDSCAPE",onObjectUpdate);
         param1.addEventListener("RWPDUE_CONTENTS_WALLPAPER",onObjectUpdate);
         param1.addEventListener("RWROUE_FURNI_REMOVED",onRoomObjectRemoved);
         param1.addEventListener("RWEBDUE_PACKAGEINFO",onEcotronUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWPDUE_PACKAGEINFO",onObjectUpdate);
         param1.removeEventListener("RWPDUE_CONTENTS",onObjectUpdate);
         param1.removeEventListener("RWPDUE_CONTENTS_IMAGE",onObjectUpdate);
         param1.removeEventListener("RWPDUE_CONTENTS_CLUB",onObjectUpdate);
         param1.removeEventListener("RWPDUE_CONTENTS_FLOOR",onObjectUpdate);
         param1.removeEventListener("RWPDUE_CONTENTS_LANDSCAPE",onObjectUpdate);
         param1.removeEventListener("RWPDUE_CONTENTS_WALLPAPER",onObjectUpdate);
         param1.removeEventListener("RWEBDUE_PACKAGEINFO",onEcotronUpdate);
         param1.removeEventListener("RWROUE_FURNI_REMOVED",onRoomObjectRemoved);
      }
      
      private function onObjectUpdate(param1:RoomWidgetPresentDataUpdateEvent) : void
      {
         switch(param1.type)
         {
            case "RWPDUE_PACKAGEINFO":
               hideInterface();
               var_1692 = false;
               var_347 = param1.objectId;
               _text = param1.text;
               var_282 = param1.controller;
               _senderName = param1.purchaserName;
               var_3229 = param1.purchaserFigure;
               showInterface();
               showIcon(param1.iconBitmapData);
               break;
            case "RWPDUE_CONTENTS_FLOOR":
               if(!var_1692)
               {
                  return;
               }
               var_347 = param1.objectId;
               var_385 = param1.classId;
               var_261 = param1.itemType;
               _text = param1.text;
               var_282 = param1.controller;
               var_1101 = param1.placedItemId;
               var_1278 = param1.placedItemType;
               _placedInRoom = param1.placedInRoom;
               showGiftOpenedInterface();
               showCustomIcon("packagecard_icon_floor");
               break;
            case "RWPDUE_CONTENTS_LANDSCAPE":
               if(!var_1692)
               {
                  return;
               }
               var_347 = param1.objectId;
               var_385 = param1.classId;
               var_261 = param1.itemType;
               _text = param1.text;
               var_282 = param1.controller;
               var_1101 = param1.placedItemId;
               var_1278 = param1.placedItemType;
               _placedInRoom = param1.placedInRoom;
               showGiftOpenedInterface();
               showCustomIcon("packagecard_icon_landscape");
               break;
            case "RWPDUE_CONTENTS_WALLPAPER":
               if(!var_1692)
               {
                  return;
               }
               var_347 = param1.objectId;
               var_385 = param1.classId;
               var_261 = param1.itemType;
               _text = param1.text;
               var_282 = param1.controller;
               var_1101 = param1.placedItemId;
               var_1278 = param1.placedItemType;
               _placedInRoom = param1.placedInRoom;
               showGiftOpenedInterface();
               showCustomIcon("packagecard_icon_wallpaper");
               break;
            case "RWPDUE_CONTENTS_CLUB":
               if(!var_1692)
               {
                  return;
               }
               var_347 = param1.objectId;
               var_385 = param1.classId;
               var_261 = param1.itemType;
               _text = param1.text;
               var_282 = param1.controller;
               showGiftOpenedInterface();
               showCustomIcon("packagecard_icon_hc");
               break;
            case "RWPDUE_CONTENTS":
               if(!var_1692)
               {
                  return;
               }
               var_347 = param1.objectId;
               var_385 = param1.classId;
               var_261 = param1.itemType;
               _text = param1.text;
               var_282 = param1.controller;
               var_1101 = param1.placedItemId;
               var_1278 = param1.placedItemType;
               _placedInRoom = param1.placedInRoom;
               showGiftOpenedInterface();
               showIcon(param1.iconBitmapData);
               break;
            case "RWPDUE_CONTENTS_IMAGE":
               if(!var_1692)
               {
                  return;
               }
               showIcon(param1.iconBitmapData);
               break;
         }
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         if(param1.id == var_347)
         {
            hideInterface();
         }
         if(param1.id == var_1101)
         {
            if(_placedInRoom)
            {
               _placedInRoom = false;
               updateRoomAndInventoryButtons();
            }
         }
      }
      
      private function onEcotronUpdate(param1:RoomWidgetEcotronBoxDataUpdateEvent) : void
      {
         var _loc2_:* = param1.type;
         if("RWEBDUE_PACKAGEINFO" === _loc2_)
         {
            hideInterface();
         }
      }
      
      private function showCustomIcon(param1:String) : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:BitmapDataAsset = assets.getAssetByName(param1) as BitmapDataAsset;
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_.content as BitmapData;
         }
         showIcon(_loc2_);
      }
      
      private function showIcon(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            param1 = new BitmapData(1,1);
         }
         if(_window == null || false)
         {
            return;
         }
         var _loc2_:class_3282 = _window.findChildByName("gift_image") as class_3282;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.bitmap != null)
         {
            _loc2_.bitmap.dispose();
         }
         _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         var _loc3_:Point = new Point((_loc2_.width - param1.width) / 2,(_loc2_.height - param1.height) / 2);
         _loc2_.bitmap.copyPixels(param1,param1.rect,_loc3_);
      }
      
      private function showGiftOpenedInterface() : void
      {
         var _loc11_:String = null;
         var _loc3_:BitmapDataAsset = null;
         var _loc1_:BitmapData = null;
         var _loc2_:String = null;
         var _loc10_:Boolean = false;
         var _loc4_:String = null;
         if(var_347 < 0)
         {
            return;
         }
         if(_window != null)
         {
            _window.dispose();
         }
         var _loc9_:XmlAsset = assets.getAssetByName("packagecard_new_opened") as XmlAsset;
         _window = windowManager.buildFromXML(_loc9_.content as XML) as class_3281;
         _window.center();
         if(!isUnknownSender())
         {
            _loc11_ = "widget.furni.present.window.title_from";
            var_44.registerParameter(_loc11_,"name",_senderName);
            _window.caption = var_44.getLocalization(_loc11_,_senderName);
         }
         var _loc6_:class_3127;
         if((_loc6_ = _window.findChildByName("header_button_close")) != null)
         {
            _loc6_.addEventListener("WME_CLICK",onClose);
         }
         var _loc7_:class_3282;
         if((_loc7_ = _window.findChildByName("image_bg") as class_3282) != null)
         {
            _loc3_ = assets.getAssetByName("gift_icon_background") as BitmapDataAsset;
            if(_loc3_ != null)
            {
               _loc1_ = _loc3_.content as BitmapData;
               if(_loc7_.bitmap)
               {
                  _loc7_.bitmap.dispose();
               }
               _loc7_.bitmap = _loc1_.clone();
            }
         }
         var _loc5_:ITextWindow;
         if((_loc5_ = _window.findChildByName("gift_message") as ITextWindow) != null)
         {
            _loc5_.text = "";
            if(_text != null)
            {
               _loc2_ = "widget.furni.present.message_opened";
               if(_loc10_ = isSpacesItem())
               {
                  _loc2_ = "widget.furni.present.spaces.message_opened";
               }
               var_44.registerParameter(_loc2_,"product",_text);
               if(var_261 == "h")
               {
                  _loc5_.text = _text;
               }
               else
               {
                  _loc5_.text = var_44.getLocalization(_loc2_,_text);
               }
            }
            else
            {
               _loc5_.visible = false;
            }
         }
         var _loc8_:class_3127;
         if((_loc8_ = _window.findChildByName("give_gift_button")) != null)
         {
            if(!isUnknownSender())
            {
               _loc4_ = "widget.furni.present.give_gift";
               var_44.registerParameter(_loc4_,"name",_senderName);
               _loc8_.caption = var_44.getLocalization(_loc4_,_senderName);
               _loc8_.addEventListener("WME_CLICK",onGiveGiftOpened);
            }
            else
            {
               _loc8_.visible = false;
            }
         }
         prepareAvatarImageContainer();
         updateGiftDialogAvatarImage(var_3229);
         updateRoomAndInventoryButtons();
         selectGiftedObject();
      }
      
      private function isSpacesItem() : Boolean
      {
         var _loc2_:class_3148 = null;
         var _loc3_:String = null;
         var _loc1_:Boolean = false;
         if(var_261 == "i")
         {
            _loc2_ = (var_1453 as FurniturePresentWidgetHandler).container.sessionDataManager.getWallItemData(var_385);
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.className;
               _loc1_ = _loc3_ == "floor" || _loc2_.className == "landscape" || _loc2_.className == "wallpaper";
            }
         }
         return _loc1_;
      }
      
      private function isClubItem() : Boolean
      {
         return var_261 == "h";
      }
      
      private function updateRoomAndInventoryButtons() : void
      {
         if(_window == null || false)
         {
            return;
         }
         var _loc4_:Boolean = isSpacesItem();
         var _loc7_:Boolean = isClubItem();
         var _loc10_:class_3127;
         if((_loc10_ = _window.findChildByName("keep_in_room_button")) != null)
         {
            _loc10_.addEventListener("WME_CLICK",onKeepInRoom);
            _loc10_.visible = _placedInRoom;
            if(_loc4_ || _loc7_)
            {
               _loc10_.visible = false;
            }
         }
         var _loc1_:class_3127 = _window.findChildByName("place_in_room_button");
         if(_loc1_ != null)
         {
            _loc1_.addEventListener("WME_CLICK",onPlaceInRoom);
            _loc1_.visible = !_placedInRoom;
            if(_loc4_)
            {
               _loc1_.disable();
            }
            if(_loc4_ || _loc7_)
            {
               _loc1_.visible = false;
            }
         }
         var _loc2_:class_3127 = _window.findChildByName("put_in_inventory_button");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onPutInInventory);
            _loc2_.enable();
            if(_loc4_ || _loc7_)
            {
               _loc2_.visible = false;
            }
         }
         var _loc8_:class_3127;
         if((_loc8_ = _window.findChildByName("separator")) != null)
         {
            _loc8_.visible = isUnknownSender();
         }
         var _loc5_:class_3127;
         if((_loc5_ = _window.findChildByName("give_container") as class_3127) != null)
         {
            _loc5_.visible = !isUnknownSender();
         }
         var _loc6_:IItemListWindow;
         if((_loc6_ = _window.findChildByName("button_list") as IItemListWindow) != null)
         {
            _loc6_.arrangeListItems();
         }
         var _loc3_:IItemListWindow = _window.findChildByName("give_element_list") as IItemListWindow;
         if(_loc3_ != null)
         {
            _loc3_.arrangeListItems();
         }
         var _loc9_:IItemListWindow;
         if((_loc9_ = _window.findChildByName("element_list") as IItemListWindow) != null)
         {
            _loc9_.arrangeListItems();
         }
         _window.resizeToFitContent();
      }
      
      private function resetAndHideInterface() : void
      {
         var_1692 = false;
         var_1101 = -1;
         _placedInRoom = false;
         hideInterface();
      }
      
      private function onKeepInRoom(param1:class_3134) : void
      {
         resetAndHideInterface();
      }
      
      private function onPlaceInRoom(param1:class_3134) : void
      {
         var _loc3_:class_3172 = null;
         var _loc2_:class_3127 = param1.target;
         _loc2_.disable();
         if(var_1101 > 0 && !_placedInRoom)
         {
            _loc3_ = null;
            switch(var_1278)
            {
               case "s":
                  _loc3_ = _inventory.getFloorItemById(-var_1101);
                  if(requestSelectedFurniPlacement(_loc3_))
                  {
                     _inventory.removeUnseenFurniCounter(var_1101);
                     break;
                  }
                  break;
               case "i":
                  _loc3_ = _inventory.getWallItemById(var_1101);
                  if(requestSelectedFurniPlacement(_loc3_))
                  {
                     _inventory.removeUnseenFurniCounter(var_1101);
                     break;
                  }
                  break;
               case "p":
                  if(_inventory.placePetToRoom(var_1101,false))
                  {
                     _inventory.removeUnseenPetCounter(var_1101);
                     break;
                  }
            }
         }
         resetAndHideInterface();
      }
      
      public function requestSelectedFurniPlacement(param1:class_3172) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:Boolean = false;
         if(param1.category == 3 || param1.category == 2 || param1.category == 4)
         {
            _loc2_ = false;
         }
         else
         {
            _loc2_ = _inventory.requestSelectedFurniToMover(param1);
         }
         return _loc2_;
      }
      
      private function onPutInInventory(param1:class_3134) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:IRoomObject = null;
         var _loc2_:class_3127 = param1.target;
         _loc2_.disable();
         if(var_1101 > 0 && _placedInRoom)
         {
            if(var_1278 == "p")
            {
               (var_1453 as FurniturePresentWidgetHandler).container.roomSession.pickUpPet(var_1101);
            }
            else
            {
               _loc4_ = (var_1453 as FurniturePresentWidgetHandler).container.roomSession.roomId;
               _loc5_ = 10;
               _loc3_ = _roomEngine.getRoomObject(_loc4_,var_1101,_loc5_);
               if(_loc3_ != null)
               {
                  _roomEngine.modifyRoomObject(_loc3_.getId(),_loc5_,"OBJECT_PICKUP");
               }
            }
         }
         resetAndHideInterface();
      }
      
      private function showInterface() : void
      {
         var _loc10_:String = null;
         var _loc8_:String = null;
         var _loc2_:String = null;
         var _loc5_:class_3127 = null;
         var _loc3_:String = null;
         var _loc12_:class_3127 = null;
         if(var_347 < 0)
         {
            return;
         }
         if(_window != null)
         {
            _window.dispose();
         }
         var _loc6_:XmlAsset = assets.getAssetByName("packagecard_new") as XmlAsset;
         _window = windowManager.buildFromXML(_loc6_.content as XML) as class_3281;
         _window.center();
         if(!isUnknownSender())
         {
            _loc10_ = "widget.furni.present.window.title_from";
            var_44.registerParameter(_loc10_,"name",_senderName);
            _window.caption = var_44.getLocalization(_loc10_,_senderName);
         }
         var _loc4_:class_3127;
         if((_loc4_ = _window.findChildByName("header_button_close")) != null)
         {
            _loc4_.addEventListener("WME_CLICK",onClose);
         }
         var _loc9_:IStaticBitmapWrapperWindow;
         if(_loc9_ = _window.findChildByName("gift_card") as IStaticBitmapWrapperWindow)
         {
            if((_loc8_ = String(_habboConfiguration.getProperty("catalog.gift_wrapping_new.gift_card"))) != "")
            {
               _loc9_.assetUri = "${image.library.url}Giftcards/" + _loc8_ + ".png";
            }
         }
         prepareAvatarImageContainer();
         if(isUnknownSender())
         {
            updateUnknownSenderAvatarImage();
         }
         else
         {
            updateGiftDialogAvatarImage(var_3229);
         }
         var _loc1_:ITextWindow = _window.findChildByName("message_text") as ITextWindow;
         if(_loc1_ != null)
         {
            _loc1_.text = _text;
         }
         var _loc11_:ITextWindow;
         if((_loc11_ = _window.findChildByName("message_from") as ITextWindow) != null)
         {
            _loc11_.text = "";
            if(!isUnknownSender())
            {
               _loc2_ = "widget.furni.present.message_from";
               var_44.registerParameter(_loc2_,"name",_senderName);
               _loc11_.text = var_44.getLocalization(_loc2_,_senderName);
               _loc11_.addEventListener("WME_CLICK",onSenderNameClick);
            }
            else
            {
               _loc11_.visible = false;
            }
         }
         var _loc7_:IItemListWindow;
         if((_loc7_ = _window.findChildByName("button_list") as IItemListWindow) != null)
         {
            if((_loc5_ = _loc7_.getListItemByName("give_gift_button")) != null)
            {
               if(!isUnknownSender())
               {
                  _loc3_ = "widget.furni.present.give_gift";
                  var_44.registerParameter(_loc3_,"name",_senderName);
                  _loc5_.caption = var_44.getLocalization(_loc3_,_senderName);
               }
               if(var_282)
               {
                  _loc5_.addEventListener("WME_CLICK",onGiveGift);
               }
               if(!var_282 || isUnknownSender())
               {
                  _loc5_.visible = false;
               }
            }
            if((_loc12_ = _window.findChildByName("open_gift_button")) != null)
            {
               if(var_282)
               {
                  _loc12_.addEventListener("WME_CLICK",onOpenGift);
               }
               else
               {
                  _loc12_.visible = false;
               }
            }
            _loc7_.arrangeListItems();
         }
         _window.resizeToFitContent();
      }
      
      private function isUnknownSender() : Boolean
      {
         return _senderName == null || false;
      }
      
      private function onClose(param1:class_3134) : void
      {
         var_1692 = false;
         hideInterface();
      }
      
      private function onGiveGift(param1:class_3134) : void
      {
         openGiftShop();
         HabboTracking.getInstance().trackEventLog("Catalog","click","client.return_gift_from_open_giftcard.clicked");
      }
      
      private function onGiveGiftOpened(param1:class_3134) : void
      {
         openGiftShop();
         HabboTracking.getInstance().trackEventLog("Catalog","click","client.return_gift_from_opened_present.clicked");
      }
      
      private function openGiftShop() : void
      {
         if(!isUnknownSender())
         {
            _catalog.giftReceiver = _senderName;
         }
         _catalog.openCatalogPage("gift_shop");
      }
      
      private function send(param1:IMessageComposer) : void
      {
         var _loc2_:IConnection = null;
         if(_catalog != null)
         {
            _loc2_ = _catalog.connection;
            if(_loc2_ != null)
            {
               _loc2_.send(param1);
            }
         }
      }
      
      private function getExtendedProfile() : void
      {
         if(!isUnknownSender())
         {
            send(new class_985(_senderName));
         }
      }
      
      private function onSenderImageClick(param1:class_3134) : void
      {
         getExtendedProfile();
      }
      
      private function onSenderNameClick(param1:class_3134) : void
      {
         getExtendedProfile();
      }
      
      private function onOpenGift(param1:class_3134) : void
      {
         sendOpen();
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc3_:class_1690 = (var_1453 as FurniturePresentWidgetHandler).container.avatarRenderManager;
         if(_loc3_ == null || param1 == null || param1.length == 0)
         {
            return null;
         }
         var _loc2_:BitmapData = null;
         var _loc4_:class_3156;
         if((_loc4_ = _loc3_.createAvatarImage(param1,"h",null,this)) != null)
         {
            _loc2_ = _loc4_.getCroppedImage("head");
            _loc4_.dispose();
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         if(_window == null || false)
         {
            return;
         }
         if(param1 == var_3229)
         {
            updateGiftDialogAvatarImage(param1);
         }
      }
      
      private function prepareAvatarImageContainer() : void
      {
         var _loc1_:IRegionWindow = _window.findChildByName("avatar_image_region") as IRegionWindow;
         if(_loc1_ != null)
         {
            if(!isUnknownSender())
            {
               _loc1_.addEventListener("WME_CLICK",onSenderImageClick);
            }
            else
            {
               _loc1_.disable();
            }
         }
      }
      
      private function updateGiftDialogAvatarImage(param1:String) : void
      {
         var _loc2_:BitmapData = getAvatarFaceBitmap(param1);
         if(_loc2_ != null)
         {
            updateAvatarImage(_loc2_);
         }
      }
      
      private function updateUnknownSenderAvatarImage() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:BitmapDataAsset = _assets.getAssetByName("gift_incognito") as BitmapDataAsset;
         if(_loc2_ != null)
         {
            _loc1_ = _loc2_.content as BitmapData;
            if(_loc1_ != null)
            {
               updateAvatarImage(_loc1_.clone());
            }
         }
      }
      
      private function updateAvatarImage(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:class_3282 = _window.findChildByName("avatar_image") as class_3282;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.bitmap = param1;
         _loc3_.width = param1.width;
         _loc3_.height = param1.height;
         var _loc2_:class_3151 = _window.findChildByName("avatar_image_region") as class_3151;
         if(_loc2_ != null)
         {
            _loc2_.width = param1.width;
            _loc2_.height = param1.height;
         }
      }
      
      private function hideInterface() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(!var_1692)
         {
            var_347 = -1;
         }
         _text = "";
         var_282 = false;
      }
      
      private function sendOpen() : void
      {
         var _loc1_:RoomWidgetPresentOpenMessage = null;
         if(var_1692 || var_347 == -1 || !var_282)
         {
            return;
         }
         var_1692 = true;
         hideInterface();
         if(messageListener != null)
         {
            _loc1_ = new RoomWidgetPresentOpenMessage("RWPOM_OPEN_PRESENT",var_347);
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      private function selectGiftedObject() : void
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObject = null;
         var _loc1_:class_3259 = null;
         if(var_1101 > 0 && _placedInRoom)
         {
            _loc5_ = 0;
            if(var_1278 == "p")
            {
               _loc3_ = _roomEngine.getRoomObjectCount(_loc5_,100);
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  _loc2_ = _roomEngine.getRoomObjectWithIndex(_loc5_,_loc4_,100);
                  _loc1_ = (var_1453 as FurniturePresentWidgetHandler).container.roomSession.userDataManager.getUserDataByIndex(_loc2_.getId());
                  if(_loc1_ != null && _loc1_.webID == var_1101)
                  {
                     _roomEngine.selectRoomObject(_loc5_,_loc1_.roomObjectId,100);
                     break;
                  }
                  _loc4_++;
               }
            }
            else
            {
               _roomEngine.selectRoomObject(_loc5_,var_1101,10);
            }
         }
      }
   }
}
