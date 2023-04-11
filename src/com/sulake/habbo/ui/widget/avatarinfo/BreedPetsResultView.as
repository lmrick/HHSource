package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.inventory.class_1697;
   import com.sulake.habbo.inventory.items.class_3172;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class BreedPetsResultView implements class_13, class_3158
   {
      
      private static const ELEM_LIST:String = "element_list";
      
      private static const PREVIEW_LIST:String = "preview_list";
      
      private static const PREVIEW_BUTTONLIST:String = "preview_buttonlist";
      
      private static const ELEM_SEED1_ITEMLIST:String = "seed1_itemlist";
      
      private static const ELEM_SEED2_ITEMLIST:String = "seed2_itemlist";
      
      private static const ELEM_SEED1_BUTTONLIST:String = "seed1_buttonlist";
      
      private static const ELEM_SEED2_BUTTONLIST:String = "seed2_buttonlist";
      
      private static const const_657:String = "header_button_close";
      
      private static const const_563:String = "close_button";
      
      private static const const_526:String = "save_button";
      
      private static const ELEM_PLACE_BUTTON1:String = "place_button1";
      
      private static const ELEM_PLACE_BUTTON2:String = "place_button2";
      
      private static const ELEM_PICK_BUTTON1:String = "pick_button1";
      
      private static const ELEM_PICK_BUTTON2:String = "pick_button2";
      
      private static const ELEM_PREVIEW_IMAGE:String = "preview_image";
      
      private static const ELEM_PREVIEW_IMAGE2:String = "preview_image2";
      
      private static const const_575:String = "preview_image_region";
      
      private static const ELEM_PREVIEW_IMAGE_REGION2:String = "preview_image_region2";
      
      private static const ELEM_BUTTON_LIST:String = "button_list";
      
      private static const const_738:String = "description";
      
      private static const const_1100:String = "description_sorry";
      
      private static const ELEM_INFO:String = "info";
      
      private static const const_794:String = "info_sorry";
      
      private static const ELEM_INFO_MUTATE1:String = "info_mutate1";
      
      private static const ELEM_INFO_MUTATE2:String = "info_mutate2";
      
      private static const const_515:String = "ok_button";
       
      
      private var _window:class_3281;
      
      private var var_311:Boolean = false;
      
      private var var_1429:com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
      
      private var _windowManager:class_1684;
      
      private var _assets:class_21;
      
      private var var_2446:class_24;
      
      private var var_963:com.sulake.habbo.ui.widget.avatarinfo.BreedPetsResultData;
      
      private var _resultData2:com.sulake.habbo.ui.widget.avatarinfo.BreedPetsResultData;
      
      private var var_2583:Boolean;
      
      public function BreedPetsResultView(param1:com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget)
      {
         super();
         var_1429 = param1;
         _windowManager = param1.windowManager;
         _assets = var_1429.assets;
         var_2446 = new class_24();
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         var_311 = true;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_2446 != null)
         {
            var_2446.dispose();
         }
         var_2446 = null;
      }
      
      public function open(param1:com.sulake.habbo.ui.widget.avatarinfo.BreedPetsResultData, param2:com.sulake.habbo.ui.widget.avatarinfo.BreedPetsResultData) : void
      {
         var_963 = param1;
         _resultData2 = param2;
         setWindowContent();
         show();
      }
      
      private function resolvePreviewImage(param1:int, param2:String) : BitmapData
      {
         var _loc5_:BitmapData = null;
         var _loc4_:int = 0;
         var _loc3_:class_3266 = var_1429.handler.container.roomEngine.getFurnitureImage(param1,new Vector3d(90,0,0),64,this,0,null,-1,-1,null);
         if(_loc3_ != null)
         {
            if((_loc4_ = _loc3_.id) > 0)
            {
               var_2446.add(_loc4_,param2);
            }
            _loc5_ = _loc3_.data;
         }
         return _loc5_;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(disposed)
         {
            return;
         }
         var _loc3_:String = var_2446.getValue(param1);
         if(_loc3_ != null)
         {
            updatePreviewImage(param2,_loc3_);
         }
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      private function setWindowContent() : void
      {
         var _loc3_:String = null;
         var _loc1_:class_3148 = var_1429.handler.container.sessionDataManager.getFloorItemData(var_963.classId);
         var _loc4_:class_3148 = var_1429.handler.container.sessionDataManager.getFloorItemData(_resultData2.classId);
         var_1429.localizations.registerParameter("breedpetsresult.widget.seed1.name","name",_loc1_ != null ? _loc1_.localizedName : "");
         var_1429.localizations.registerParameter("breedpetsresult.widget.seed2.name","name",_loc4_ != null ? _loc4_.localizedName : "");
         var_1429.localizations.registerParameter("breedpetsresult.widget.seed1.description","name",var_963.userName);
         var_1429.localizations.registerParameter("breedpetsresult.widget.seed2.description","name",_resultData2.userName);
         var_1429.localizations.registerParameter("breedpetsresult.widget.seed1.raritylevel","level",var_963.rarityLevel.toString());
         var_1429.localizations.registerParameter("breedpetsresult.widget.seed2.raritylevel","level",_resultData2.rarityLevel.toString());
         var _loc7_:int = var_1429.handler.container.sessionDataManager.userId;
         var _loc5_:* = var_963.userId == _loc7_;
         var _loc6_:* = _resultData2.userId == _loc7_;
         var _loc2_:Boolean = _loc5_ || _loc6_;
         if(!_loc2_)
         {
            _loc3_ = "";
            if(false)
            {
               _loc3_ = "null";
            }
            else if(false)
            {
               _loc3_ = "null";
            }
            var_1429.localization.registerParameter("breedpetsresult.widget.text.sorry","name",_loc3_);
         }
         if(!_window)
         {
            _window = _windowManager.buildFromXML(_assets.getAssetByName("breed_pets_result_xml").content as XML) as class_3281;
            addClickListener("header_button_close");
         }
         _window.center();
         _window.visible = true;
         enableElement("seed1_buttonlist",false);
         enableElement("seed2_buttonlist",false);
         enableElement("place_button1",false);
         enableElement("pick_button1",false);
         enableElement("place_button2",false);
         enableElement("pick_button2",false);
         enableElement("close_button",false);
         if(_loc5_)
         {
            enableElement("place_button1",true);
            enableElement("seed1_buttonlist",true);
         }
         if(_loc6_)
         {
            enableElement("place_button2",true);
            enableElement("seed2_buttonlist",true);
         }
         if(_loc2_)
         {
            enableElement("preview_buttonlist",true);
         }
         enableElement("seed2_itemlist",true);
         if(false)
         {
            enableElement("seed2_itemlist",false);
         }
         enableElement("description",true);
         enableElement("info",true);
         enableElement("description_sorry",false);
         enableElement("info",false);
         enableElement("button_list",false);
         enableElement("close_button",false);
         if(!_loc2_)
         {
            enableElement("preview_buttonlist",false);
            enableElement("description",false);
            enableElement("info",false);
            enableElement("save_button",false);
            enableElement("place_button1",false);
            enableElement("pick_button1",false);
            enableElement("place_button2",false);
            enableElement("pick_button2",false);
            enableElement("button_list",true);
            enableElement("description_sorry",true);
            enableElement("info_sorry",true);
            enableElement("close_button",true);
         }
         enableElement("info_mutate1",false);
         enableElement("info_mutate2",false);
         if(false)
         {
            enableElement("info_mutate1",true);
         }
         if(false)
         {
            enableElement("info_mutate2",true);
         }
         addClickListener("save_button");
         addClickListener("header_button_close");
         addClickListener("close_button");
         addClickListener("place_button1");
         addClickListener("place_button2");
         addClickListener("pick_button1");
         addClickListener("pick_button2");
         addClickListener("preview_image_region");
         addClickListener("preview_image_region2");
         var _loc8_:BitmapData = resolvePreviewImage(_loc1_.id,"preview_image");
         updatePreviewImage(_loc8_ != null ? _loc8_ : new BitmapData(10,10),"preview_image");
         _loc8_ = resolvePreviewImage(_loc1_.id,"preview_image2");
         updatePreviewImage(_loc8_ != null ? _loc8_ : new BitmapData(10,10),"preview_image2");
         arrangeListItems();
         _window.invalidate();
      }
      
      private function enableElement(param1:String, param2:Boolean) : void
      {
         var _loc3_:class_3127 = _window.findChildByName(param1);
         if(_loc3_ != null)
         {
            _loc3_.visible = param2;
         }
      }
      
      private function arrangeListItems() : void
      {
         arrangeListItem("seed1_itemlist");
         arrangeListItem("seed2_itemlist");
         arrangeListItem("seed1_buttonlist");
         arrangeListItem("seed2_buttonlist");
         arrangeListItem("preview_buttonlist");
         arrangeListItem("button_list");
         arrangeListItem("preview_list");
         arrangeListItem("element_list");
         _window.resizeToFitContent();
      }
      
      private function arrangeListItem(param1:String) : void
      {
         var _loc2_:IItemListWindow = _window.findChildByName(param1) as IItemListWindow;
         if(_loc2_ != null)
         {
            _loc2_.arrangeListItems();
         }
      }
      
      private function updatePreviewImage(param1:BitmapData, param2:String) : void
      {
         var _loc5_:BitmapData = null;
         if(!_window || !param1)
         {
            return;
         }
         var _loc6_:class_3282;
         (_loc6_ = _window.findChildByName(param2) as class_3282).bitmap = new BitmapData(_loc6_.width,_loc6_.height);
         var _loc3_:IAsset = _assets.getAssetByName("breed_pets_preview_bg_png") as IAsset;
         if(_loc3_)
         {
            _loc5_ = _loc3_.content as BitmapData;
            _loc6_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(0,0));
         }
         var _loc4_:Point = new Point((_loc6_.width - param1.width) / 2,(_loc6_.height - param1.height) / 2);
         _loc6_.bitmap.copyPixels(param1,param1.rect,_loc4_,null,null,true);
      }
      
      public function close() : void
      {
         if(var_1429)
         {
            var_1429.removeBreedPetsResultView(this);
         }
      }
      
      public function show() : void
      {
         var_2583 = false;
         if(_window)
         {
            _window.visible = true;
         }
      }
      
      private function hide() : void
      {
         if(_window)
         {
            _window.visible = false;
         }
      }
      
      private function addClickListener(param1:String) : void
      {
         var _loc2_:class_3127 = _window.findChildByName(param1);
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onMouseClick);
         }
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "header_button_close":
            case "close_button":
               close();
               break;
            case "place_button1":
               var_2583 = placeItemToRoom(var_963.stuffId);
               if(var_2583)
               {
                  close();
                  break;
               }
               break;
            case "place_button2":
               var_2583 = placeItemToRoom(_resultData2.stuffId);
               if(var_2583)
               {
                  close();
                  break;
               }
               break;
            case "pick_button1":
               pickItemFromRoom(var_963.stuffId);
               break;
            case "pick_button2":
               pickItemFromRoom(_resultData2.stuffId);
               break;
            case "preview_image_region":
               selectItemFromInventoryOrRoom(var_963.stuffId);
               break;
            case "preview_image_region2":
               selectItemFromInventoryOrRoom(_resultData2.stuffId);
               break;
            case "ok_button":
               hide();
               break;
            case "save_button":
               hide();
         }
      }
      
      private function selectItemFromInventoryOrRoom(param1:int) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:class_3172 = findInventoryFloorItemById(param1);
         if(_loc2_ != null)
         {
            var_1429.handler.container.inventory.toggleInventoryPage("furni");
            return true;
         }
         var _loc3_:IRoomObject = findRoomObject(param1);
         if(_loc3_ != null)
         {
            _loc4_ = var_1429.handler.container.roomSession.roomId;
            _loc5_ = 10;
            var_1429.handler.container.roomEngine.selectRoomObject(_loc4_,_loc3_.getId(),_loc5_);
            return true;
         }
         return false;
      }
      
      private function pickItemFromRoom(param1:int) : Boolean
      {
         var _loc2_:IRoomObject = findRoomObject(param1);
         if(_loc2_ != null)
         {
            var_1429.handler.container.roomEngine.modifyRoomObject(_loc2_.getId(),10,"OBJECT_PICKUP");
            return true;
         }
         return false;
      }
      
      private function placeItemToRoom(param1:int) : Boolean
      {
         var _loc2_:class_3172 = findInventoryFloorItemById(param1);
         return requestSelectedFurniPlacement(_loc2_);
      }
      
      private function findRoomObject(param1:int) : IRoomObject
      {
         var _loc3_:int = var_1429.handler.container.roomSession.roomId;
         return var_1429.handler.container.roomEngine.getRoomObject(_loc3_,param1,10);
      }
      
      private function findInventoryFloorItemById(param1:int) : class_3172
      {
         if(var_1429 == null)
         {
            return null;
         }
         var _loc3_:class_1697 = var_1429.handler.container.inventory;
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getFloorItemById(-param1);
      }
      
      private function requestSelectedFurniPlacement(param1:class_3172) : Boolean
      {
         if(param1 == null || var_1429 == null)
         {
            return false;
         }
         var _loc3_:class_1697 = var_1429.handler.container.inventory;
         if(_loc3_ == null)
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
            _loc2_ = _loc3_.requestSelectedFurniToMover(param1);
         }
         return _loc2_;
      }
      
      public function roomObjectRemoved(param1:int) : void
      {
         if(var_963 == null || _resultData2 == null)
         {
            return;
         }
         if(var_963.stuffId == param1 || _resultData2.stuffId == param1)
         {
            updatePlacingButtons();
            show();
         }
      }
      
      public function roomObjectAdded(param1:int) : void
      {
         if(var_963 == null || _resultData2 == null)
         {
            return;
         }
         if(var_963.stuffId == param1 || _resultData2.stuffId == param1)
         {
            updatePlacingButtons();
            show();
         }
      }
      
      public function updatePlacingButtons() : void
      {
         updateButtons(var_963,"place_button1","pick_button1");
         updateButtons(_resultData2,"place_button2","pick_button2");
         arrangeListItems();
      }
      
      private function updateButtons(param1:com.sulake.habbo.ui.widget.avatarinfo.BreedPetsResultData, param2:String, param3:String) : void
      {
         var _loc5_:class_3172 = null;
         if(_window == null || param1 == null)
         {
            return;
         }
         var _loc10_:int = var_1429.handler.container.sessionDataManager.userId;
         var _loc4_:* = param1.userId == _loc10_;
         var _loc9_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc7_:IRoomObject;
         if((_loc7_ = findRoomObject(param1.stuffId)) != null)
         {
            _loc8_ = true;
         }
         if(!_loc8_)
         {
            if((_loc5_ = findInventoryFloorItemById(param1.stuffId)) != null)
            {
               _loc9_ = true;
            }
         }
         var _loc6_:class_3127 = _window.findChildByName(param2);
         var _loc11_:class_3127 = _window.findChildByName(param3);
         if(_loc6_ != null)
         {
            _loc6_.visible = false;
            if(_loc4_)
            {
               if(_loc9_)
               {
                  _loc6_.visible = true;
               }
               if(!_loc9_ && !_loc8_)
               {
                  _loc6_.visible = true;
               }
            }
         }
         if(_loc11_ != null)
         {
            _loc11_.visible = false;
            if(_loc4_)
            {
               if(_loc8_)
               {
                  _loc11_.visible = true;
               }
            }
         }
      }
   }
}
