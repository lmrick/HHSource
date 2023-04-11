package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.pets.PetFigureData;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.ui.widget.events.BreedingRarityCategoryData;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class ConfirmPetBreedingView implements class_13, class_3158
   {
      
      private static const ELEM_LIST:String = "element_list";
      
      private static const PREVIEW_LIST:String = "preview_list";
      
      private static const ELEM_PET1_ITEMLIST:String = "pet1_itemlist";
      
      private static const ELEM_PET2_ITEMLIST:String = "pet2_itemlist";
      
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
      
      private var var_4350:Boolean = false;
      
      private var _stuffId:int;
      
      private var var_498:Array;
      
      private var var_3798:int;
      
      public function ConfirmPetBreedingView(param1:com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget)
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
      
      public function open(param1:int, param2:int, param3:int, param4:Array, param5:int, param6:int, param7:int) : void
      {
         var_3004 = param1;
         var_2795 = param2;
         var_296 = var_1429.handler.roomSession.userDataManager.getUserDataByIndex(param1);
         _petData2 = var_1429.handler.roomSession.userDataManager.getUserDataByIndex(param2);
         var_296.petLevel = param6;
         _petData2.petLevel = param7;
         var_498 = param4;
         var_3798 = param5;
         _stuffId = param3;
         setWindowContent();
         _window.visible = true;
      }
      
      private function resolvePreviewImage(param1:String, param2:String, param3:int = 64) : BitmapData
      {
         var _loc8_:BitmapData = null;
         var _loc7_:int = 0;
         var _loc4_:PetFigureData = new PetFigureData(param1);
         var _loc6_:class_3266;
         if((_loc6_ = var_1429.handler.roomEngine.getPetImage(_loc4_.typeId,_loc4_.paletteId,_loc4_.color,new Vector3d(90),param3,this,true,0,_loc4_.customParts,"std")) != null)
         {
            if((_loc7_ = _loc6_.id) > 0)
            {
               var_2446.add(_loc7_,param2);
            }
            _loc8_ = _loc6_.data;
         }
         return _loc8_;
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
         var _loc8_:IItemListWindow = null;
         var _loc1_:PetFigureData = null;
         var _loc5_:class_3282 = null;
         var_1429.localizations.registerParameter("breedpets.widget.title","name",var_296.name);
         var_1429.localizations.registerParameter("breedpets.widget.pet1.name","name",var_296.name);
         var_1429.localizations.registerParameter("breedpets.widget.pet2.name","name",_petData2.name);
         var_1429.localizations.registerParameter("breedpets.widget.pet1.description","name",var_296.ownerName);
         var_1429.localizations.registerParameter("breedpets.widget.pet2.description","name",_petData2.ownerName);
         var_1429.localizations.registerParameter("breedpets.widget.pet1.level","level",var_296.petLevel.toString());
         var_1429.localizations.registerParameter("breedpets.widget.pet2.level","level",_petData2.petLevel.toString());
         var_1429.localizations.registerParameter("breedpets.widget.request","name",_petData2.ownerName);
         if(!_window)
         {
            _window = _windowManager.buildFromXML(_assets.getAssetByName("confirm_pet_breeding_xml").content as XML) as class_3281;
            addClickListener("header_button_close");
         }
         _window.center();
         _window.visible = true;
         addClickListener("save_button");
         addClickListener("cancel_button");
         enable();
         var _loc6_:BitmapData = resolvePreviewImage(var_296.figure,"preview_image");
         updatePreviewImage(_loc6_ != null ? _loc6_ : new BitmapData(10,10),"preview_image");
         _loc6_ = resolvePreviewImage(_petData2.figure,"preview_image2");
         updatePreviewImage(_loc6_ != null ? _loc6_ : new BitmapData(10,10),"preview_image2");
         var _loc4_:class_3282 = _windowManager.buildFromXML(_assets.getAssetByName("pet_breeding_pet_preview_xml").content as XML) as class_3282;
         var _loc2_:int = 1;
         for each(var _loc3_ in var_498)
         {
            var_1429.localizations.registerParameter("breedpets.confirmation.widget.raritycategory." + _loc2_,"percent",_loc3_.chance.toString());
            (_loc8_ = _window.findChildByName("breeds" + _loc2_) as IItemListWindow).removeListItems();
            for each(var _loc7_ in _loc3_.breeds)
            {
               _loc1_ = new PetFigureData([var_3798,_loc7_].join(" "));
               (_loc5_ = _loc4_.clone() as class_3282).name = "breed." + _loc7_;
               _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
               if(_loc8_)
               {
                  _loc8_.addListItem(_loc5_);
               }
               _loc6_ = resolvePreviewImage(_loc1_.figureString,_loc5_.name,64);
               updatePreviewImage(_loc6_ != null ? _loc6_ : new BitmapData(25,25,true,16777215),_loc5_.name);
            }
            _loc2_++;
         }
         arrangeListItems();
         (_window.findChildByName("puppy.name.input") as ITextFieldWindow).setSelection(0,0);
         _window.invalidate();
      }
      
      private function arrangeListItems() : void
      {
         arrangeListItem("button_list");
         arrangeListItem("pet1_itemlist");
         arrangeListItem("pet2_itemlist");
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
         if(!_window || !param1)
         {
            return;
         }
         var _loc4_:class_3282;
         (_loc4_ = _window.findChildByName(param2) as class_3282).bitmap = new BitmapData(_loc4_.width,_loc4_.height,true,16777215);
         var _loc3_:Point = new Point((_loc4_.width - param1.width) / 2,(_loc4_.height - param1.height) / 2);
         _loc4_.bitmap.copyPixels(param1,param1.rect,_loc3_,null,null,true);
      }
      
      public function close() : void
      {
         if(_window)
         {
            _window.visible = false;
         }
      }
      
      private function disable() : void
      {
         enableElement("description",false,false);
         enableElement("request",false,false);
         enableElement("cancel_button",false,true);
         enableElement("description",false,true);
         enableElement("save_button",false,true);
      }
      
      public function enable() : void
      {
         enableElement("description",false,false);
         enableElement("request",false,false);
         enableElement("cancel_button",true,true);
         enableElement("description",true,true);
         enableElement("save_button",true,true);
      }
      
      private function addClickListener(param1:String) : void
      {
         var _loc2_:class_3127 = _window.findChildByName(param1);
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onMouseClick);
         }
      }
      
      private function enableElement(param1:String, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:class_3127;
         if((_loc4_ = _window.findChildByName(param1)) != null)
         {
            _loc4_.visible = param3;
            if(param2)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.target.name)
         {
            case "header_button_close":
            case "cancel_button":
               var_1429.cancelPetBreeding(_stuffId);
               close();
               break;
            case "ok_button":
               disable();
               break;
            case "save_button":
               _loc2_ = String(_window.findChildByName("puppy.name.input").caption);
               if(_loc2_.length == 0)
               {
                  _windowManager.simpleAlert("${breedpets.confirmation.alert.title}","${breedpets.confirmation.alert.name.required.head}","${breedpets.confirmation.alert.name.required.desc}");
                  break;
               }
               var_1429.confirmPetBreeding(_stuffId,_loc2_,var_296.webID,_petData2.webID);
               disable();
               break;
         }
      }
   }
}
