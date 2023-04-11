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
   import com.sulake.habbo.avatar.pets.PetFigureData;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class BreedMonsterPlantsConfirmationView implements class_13, class_3158
   {
      
      private static const STATE_NORMAL:int = 0;
      
      private static const STATE_REQUESTED:int = 1;
      
      private static const ELEM_LIST:String = "element_list";
      
      private static const PREVIEW_LIST:String = "preview_list";
      
      private static const ELEM_PLANT1_ITEMLIST:String = "plant1_itemlist";
      
      private static const ELEM_PLANT2_ITEMLIST:String = "plant2_itemlist";
      
      private static const const_738:String = "description";
      
      private static const ELEM_REQUEST:String = "request";
      
      private static const const_563:String = "header_button_close";
      
      private static const const_526:String = "save_button";
      
      private static const const_572:String = "accept_button";
      
      private static const const_813:String = "cancel_button";
      
      private static const const_515:String = "ok_button";
      
      private static const BUTTON_LIST:String = "button_list";
       
      
      private var _window:class_3281;
      
      private var var_311:Boolean = false;
      
      private var var_1429:com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
      
      private var _windowManager:class_1684;
      
      private var _assets:class_21;
      
      private var var_2446:class_24;
      
      private var var_3004:int;
      
      private var var_2795:int;
      
      private var var_296:class_3259;
      
      private var _petData2:class_3259;
      
      private var var_159:int = 0;
      
      public function BreedMonsterPlantsConfirmationView(param1:com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget)
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
      
      public function get requestRoomObjectId() : int
      {
         return var_3004;
      }
      
      public function get targetRoomObjectId() : int
      {
         return var_2795;
      }
      
      public function open(param1:int, param2:int, param3:Boolean) : void
      {
         var_3004 = param1;
         var_2795 = param2;
         var_296 = var_1429.handler.roomSession.userDataManager.getUserDataByIndex(param1);
         _petData2 = var_1429.handler.roomSession.userDataManager.getUserDataByIndex(param2);
         var_159 = param3 ? 1 : 0;
         setWindowContent();
         _window.visible = true;
      }
      
      private function resolvePreviewImage(param1:String, param2:String) : BitmapData
      {
         var _loc7_:BitmapData = null;
         var _loc6_:int = 0;
         var _loc3_:PetFigureData = new PetFigureData(param1);
         var _loc5_:class_3266;
         if((_loc5_ = var_1429.handler.roomEngine.getPetImage(_loc3_.typeId,_loc3_.paletteId,_loc3_.color,new Vector3d(90),64,this,true,0,_loc3_.customParts,"std")) != null)
         {
            if((_loc6_ = _loc5_.id) > 0)
            {
               var_2446.add(_loc6_,param2);
            }
            _loc7_ = _loc5_.data;
         }
         return _loc7_;
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
         var_1429.localizations.registerParameter("breedpets.widget.title","name",var_296.name);
         var_1429.localizations.registerParameter("breedpets.widget.plant1.name","name",var_296.name);
         var_1429.localizations.registerParameter("breedpets.widget.plant2.name","name",_petData2.name);
         var_1429.localizations.registerParameter("breedpets.widget.plant1.description","name",var_296.ownerName);
         var_1429.localizations.registerParameter("breedpets.widget.plant2.description","name",_petData2.ownerName);
         var_1429.localizations.registerParameter("breedpets.widget.plant1.raritylevel","level",var_296.rarityLevel.toString());
         var_1429.localizations.registerParameter("breedpets.widget.plant2.raritylevel","level",_petData2.rarityLevel.toString());
         var_1429.localizations.registerParameter("breedpets.widget.request","name",_petData2.ownerName);
         if(!_window)
         {
            _window = _windowManager.buildFromXML(_assets.getAssetByName("breed_pets_confirmation_xml").content as XML) as class_3281;
            addClickListener("header_button_close");
         }
         _window.center();
         _window.visible = true;
         addClickListener("save_button");
         addClickListener("accept_button");
         addClickListener("cancel_button");
         enableElement("description",false);
         enableElement("request",false);
         enableElement("save_button",false);
         enableElement("save_button",false);
         enableElement("accept_button",false);
         enableElement("cancel_button",true);
         enableElement("cancel_button",true);
         switch(var_159)
         {
            case 0:
               enableElement("description",true);
               enableElement("save_button",true);
               break;
            case 1:
               enableElement("request",true);
               enableElement("accept_button",true);
         }
         var _loc1_:BitmapData = resolvePreviewImage(var_296.figure,"preview_image");
         updatePreviewImage(_loc1_ != null ? _loc1_ : new BitmapData(10,10),"preview_image");
         _loc1_ = resolvePreviewImage(_petData2.figure,"preview_image2");
         updatePreviewImage(_loc1_ != null ? _loc1_ : new BitmapData(10,10),"preview_image2");
         arrangeListItems();
         _window.invalidate();
      }
      
      private function arrangeListItems() : void
      {
         arrangeListItem("button_list");
         arrangeListItem("plant1_itemlist");
         arrangeListItem("plant2_itemlist");
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
      
      private function close() : void
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
      
      private function enableElement(param1:String, param2:Boolean) : void
      {
         var _loc3_:class_3127 = _window.findChildByName(param1);
         if(_loc3_ != null)
         {
            _loc3_.visible = param2;
         }
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "header_button_close":
            case "cancel_button":
               var_1429.cancelBreedPets(var_3004,var_2795);
               close();
               break;
            case "ok_button":
               close();
               break;
            case "accept_button":
               close();
               var_1429.acceptBreedPets(var_3004,var_2795);
               break;
            case "save_button":
               var_1429.breedPets(var_3004,var_2795);
               if(false)
               {
                  var_1429.showBreedingPetsWaitingConfirmationAlert(requestRoomObjectId,var_2795);
               }
               close();
         }
      }
   }
}
