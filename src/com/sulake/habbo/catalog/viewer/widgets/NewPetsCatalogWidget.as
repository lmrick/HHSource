package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.pets.PetCustomPart;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetMultiColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSellablePetPalettesEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.PetColorResult;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import package_128.class_1578;
   
   public class NewPetsCatalogWidget extends CatalogWidget implements class_3321, class_3158
   {
      
      private static const NORMAL_SIZE_PETS:Array = [15];
      
      private static const MAX_PALETTES:int = 20;
       
      
      private var _offers:class_24;
      
      private var var_1437:class_3127;
      
      private var var_1700:int = -1;
      
      private var var_1812:int = -1;
      
      private var var_3927:String;
      
      private var var_2213:Boolean = false;
      
      private var var_311:Boolean = false;
      
      private var var_1605:Array = null;
      
      private var _catalog:HabboCatalog;
      
      private var var_1936:class_3127;
      
      private var var_3837:int = -1;
      
      public function NewPetsCatalogWidget(param1:class_3151, param2:HabboCatalog)
      {
         super(param1);
         _catalog = param2;
      }
      
      override public function dispose() : void
      {
         if(var_311)
         {
            return;
         }
         var_2213 = false;
         if(_offers != null)
         {
            _offers.dispose();
            _offers = null;
         }
         var_1605 = null;
         _catalog = null;
         var_1936 = null;
         super.dispose();
         var_311 = true;
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var_2213 = false;
         var_1437 = window.findChildByName("name_input_text");
         if(var_1437 == null)
         {
            return false;
         }
         var_1437.caption = "";
         _offers = new class_24();
         if(page.offers.length == 0)
         {
            return false;
         }
         var _loc1_:class_3159 = page.offers[0];
         var_1700 = getPetTypeIndexFromProduct(_loc1_.localizationId);
         if(var_1700 < 8)
         {
            return false;
         }
         var_3927 = _loc1_.localizationId;
         updateAvailablePalettes(_loc1_.localizationId);
         if(var_1605 != null && false)
         {
            var_1812 = 0;
         }
         else
         {
            var_1812 = -1;
         }
         _offers.add(var_1700,_loc1_);
         events.addEventListener("SELECT_PRODUCT",onSelectProduct);
         events.addEventListener("COLOUR_INDEX",onColourIndex);
         events.addEventListener("CWE_APPROVE_RESULT",onApproveNameResult);
         events.addEventListener("WIDGETS_INITIALIZED",onWidgetsInitialized);
         events.addEventListener("SELLABLE_PET_PALETTES",onSellablePetPalettes);
         return true;
      }
      
      private function onWidgetsInitialized(param1:CatalogWidgetEvent = null) : void
      {
         if(var_311)
         {
            return;
         }
         events.dispatchEvent(new CatalogWidgetPurchaseOverrideEvent(onPurchase));
         var _loc2_:class_3159 = _offers.getWithIndex(0);
         if(_loc2_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc2_));
         }
         initializePaletteSelection();
      }
      
      private function initializePaletteSelection() : void
      {
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc1_:class_1578 = null;
         var _loc3_:PetColorResult = null;
         if(var_1605 != null)
         {
            _loc4_ = [];
            _loc2_ = 0;
            while(_loc2_ < 20 && _loc2_ < var_1605.length)
            {
               _loc1_ = var_1605[_loc2_];
               _loc3_ = _catalog.roomEngine.getPetColor(var_1700,_loc1_.paletteId);
               if(_loc3_ != null)
               {
                  if(_loc3_.primaryColor == _loc3_.secondaryColor)
                  {
                     _loc4_.push([_loc3_.primaryColor]);
                  }
                  else
                  {
                     _loc4_.push([_loc3_.primaryColor,_loc3_.secondaryColor]);
                  }
               }
               _loc2_++;
            }
            events.dispatchEvent(new CatalogWidgetMultiColoursEvent(_loc4_,"ctlg_clr_27x22_1","ctlg_clr_27x22_2","ctlg_clr_27x22_3"));
         }
      }
      
      private function onColourIndex(param1:CatalogWidgetColourIndexEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = param1.index;
         selectedPalette(_loc2_);
      }
      
      private function selectedPalette(param1:int) : void
      {
         if(var_1605 != null && false)
         {
            if(param1 < 0 || param1 > var_1605.length)
            {
               param1 = 0;
            }
            var_1812 = param1;
            updateImage();
         }
      }
      
      private function getPetLocalization() : String
      {
         var _loc1_:class_1578 = null;
         if(var_1812 < 0)
         {
            return "";
         }
         if(page != null && false)
         {
            if(_catalog != null && false)
            {
               _loc1_ = var_1605[var_1812] as class_1578;
               return _catalog.localization.getLocalization(getRaceLocalizationKey(var_1700,_loc1_.breedId),getRaceLocalizationKey(var_1700,_loc1_.breedId));
            }
         }
         _loc1_ = var_1605[var_1812];
         return getRaceLocalizationKey(var_1700,_loc1_.breedId);
      }
      
      private function onPurchase(param1:class_3134) : void
      {
         if(var_2213)
         {
            class_14.log("* Cannot buy a pet, pending previous name approval.");
         }
         if(getPurchaseParameters() == "")
         {
            return;
         }
         var _loc2_:String = "null";
         var_2213 = true;
         _catalog.approveName(_loc2_,1);
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         updateImage();
      }
      
      private function onApproveNameResult(param1:CatalogWidgetApproveNameResultEvent) : void
      {
         var nameValidationInfo:String;
         var extraParameter:String;
         var event:CatalogWidgetApproveNameResultEvent = param1;
         if(event == null || !var_2213)
         {
            return;
         }
         var_2213 = false;
         nameValidationInfo = "null";
         if(true)
         {
            _catalog.purchaseWillBeGift(false);
         }
         switch(-1)
         {
            case 0:
               _catalog.windowManager.alert("${catalog.alert.purchaseerror.title}",constructErrorMessage("long",nameValidationInfo),0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
               return;
            case 1:
               _catalog.windowManager.alert("${catalog.alert.purchaseerror.title}",constructErrorMessage("short",nameValidationInfo),0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
               return;
            case 2:
               _catalog.windowManager.alert("${catalog.alert.purchaseerror.title}",constructErrorMessage("chars",nameValidationInfo),0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
               return;
            case 3:
               _catalog.windowManager.alert("${catalog.alert.purchaseerror.title}",constructErrorMessage("bobba",nameValidationInfo),0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
               return;
            default:
               extraParameter = getPurchaseParameters();
               if(extraParameter == "")
               {
                  class_14.log("* Not enough information to buy a pet!");
                  return;
               }
               class_14.log("* Will buy pet as " + extraParameter);
               _catalog.showPurchaseConfirmation(_offers.getWithIndex(0),page.pageId,extraParameter,1,null,null,true,getPetImage());
               return;
         }
      }
      
      private function constructErrorMessage(param1:String, param2:String) : String
      {
         var _loc4_:class_18 = _catalog.localization;
         var _loc3_:String = "catalog.alert.petname." + param1;
         var _loc6_:String = _loc3_ + ".additionalInfo";
         _loc4_.registerParameter(_loc6_,"additional_info",param2);
         var _loc7_:* = String(_loc4_.getLocalization(_loc3_));
         var _loc5_:String = String(_loc4_.getLocalization(_loc6_));
         if(param2 != null && param2.length > 0 && _loc5_ != null && _loc5_.length > 0)
         {
            _loc7_ = _loc5_;
         }
         return _loc7_;
      }
      
      private function onSellablePetPalettes(param1:CatalogWidgetSellablePetPalettesEvent) : void
      {
         if(param1.productCode == var_3927)
         {
            var_1605 = parseSellablePalettes(param1.sellablePalettes);
            initializePaletteSelection();
            selectedPalette(0);
            updateImage();
         }
      }
      
      private function parseSellablePalettes(param1:Array) : Array
      {
         if(!param1)
         {
            return null;
         }
         var _loc2_:* = [];
         for each(var _loc3_ in param1)
         {
            if(_loc3_.type == var_1700 && _loc3_.sellable)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      private function getPetImage() : BitmapData
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc13_:PetColorResult = null;
         var _loc12_:PetColorResult = null;
         var _loc1_:int = 0;
         var _loc14_:int = 0;
         var _loc11_:PetCustomPart = null;
         var _loc5_:PetCustomPart = null;
         var _loc10_:class_3159;
         if((_loc10_ = _offers.getWithIndex(0)) == null || var_1812 < 0)
         {
            return null;
         }
         var _loc6_:int = var_1700;
         var _loc3_:class_1578 = var_1605[var_1812];
         var _loc7_:int = _loc3_.paletteId;
         var _loc16_:IRoomEngine = _catalog.roomEngine;
         var _loc8_:* = NORMAL_SIZE_PETS.indexOf(_loc6_) == -1;
         var _loc18_:Vector3d = NORMAL_SIZE_PETS.indexOf(_loc6_) == -1 ? new Vector3d(135) : new Vector3d(90);
         var _loc17_:* = [];
         switch(_loc6_ - 15)
         {
            case 0:
               _loc4_ = _loc16_.getPetLayerIdForTag(_loc6_,"hair");
               _loc2_ = _loc16_.getPetLayerIdForTag(_loc6_,"tail");
               _loc13_ = _loc16_.getPetDefaultPalette(_loc6_,"hair");
               _loc12_ = _loc16_.getPetDefaultPalette(_loc6_,"tail");
               _loc1_ = !!_loc13_ ? parseInt(_loc13_.id) : -1;
               _loc14_ = !!_loc12_ ? parseInt(_loc12_.id) : -1;
               _loc11_ = new PetCustomPart(_loc4_,-1,_loc1_);
               _loc5_ = new PetCustomPart(_loc2_,-1,_loc14_);
               _loc17_ = [_loc11_,_loc5_];
         }
         var _loc15_:class_3266;
         if((_loc15_ = _loc16_.getPetImage(_loc6_,_loc7_,16777215,_loc18_,64,this,true,0,_loc17_)) != null)
         {
            var_3837 = _loc15_.id;
            return _loc15_.data;
         }
         return null;
      }
      
      private function updateImage() : void
      {
         var _loc1_:class_3159 = _offers.getWithIndex(0);
         if(_loc1_ == null || var_1812 < 0)
         {
            return;
         }
         var _loc2_:BitmapData = getPetImage();
         if(_loc2_ != null)
         {
            setPreviewImage(_loc2_,true);
         }
         var _loc4_:class_3127 = window.findChildByName("ctlg_teaserimg_1");
         var_1936 = _catalog.utils.showPriceOnProduct(_loc1_,_window,var_1936,_loc4_,-6,false,6);
         var _loc3_:class_3127 = _window.findChildByName("pet_breed_text");
         if(_loc3_)
         {
            _loc3_.caption = getPetLocalization();
         }
      }
      
      private function getPurchaseParameters() : String
      {
         var color:uint;
         var data:class_1578;
         var p:String;
         var name:String = "null";
         if(name == null || false)
         {
            _catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.empty}",0,function(param1:class_3132, param2:class_3134):void
            {
               param1.dispose();
            });
            return "";
         }
         if(var_1812 < 0)
         {
            return "";
         }
         color = 16777215;
         data = var_1605[var_1812];
         p = name + String.fromCharCode(10) + data.paletteId + String.fromCharCode(10) + addZeroPadding(color.toString(16).toUpperCase(),6);
         return p;
      }
      
      private function setPreviewImage(param1:BitmapData, param2:Boolean) : void
      {
         var _loc6_:class_3282 = null;
         var _loc5_:int = 0;
         var _loc3_:BitmapData = null;
         var _loc4_:Point = null;
         if(true)
         {
            if(param1 == null)
            {
               param1 = new BitmapData(1,1);
               param2 = true;
            }
            if((_loc6_ = window.findChildByName("ctlg_teaserimg_1") as class_3282) != null)
            {
               if(_loc6_.bitmap == null)
               {
                  _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
               }
               _loc6_.bitmap.fillRect(_loc6_.bitmap.rect,16777215);
               _loc5_ = 1;
               if(NORMAL_SIZE_PETS.indexOf(var_1700) == -1)
               {
                  _loc5_ = 2;
               }
               _loc3_ = new BitmapData(param1.width * _loc5_,param1.height * _loc5_,true,16777215);
               _loc3_.draw(param1,new Matrix(_loc5_,0,0,_loc5_));
               _loc4_ = new Point((_loc6_.width - _loc3_.width) / 2,(_loc6_.height - _loc3_.height) / 2);
               _loc6_.bitmap.copyPixels(_loc3_,_loc3_.rect,_loc4_,null,null,true);
               _loc6_.invalidate();
               _loc3_.dispose();
            }
         }
         if(param2)
         {
            param1.dispose();
         }
      }
      
      private function getPetTypeIndexFromProduct(param1:String) : int
      {
         if(param1.length == 0)
         {
            return 0;
         }
         var _loc2_:int = 0;
         _loc2_ = param1.length - 1;
         while(_loc2_ >= 0)
         {
            if(isNaN(parseInt(param1.charAt(_loc2_))))
            {
               break;
            }
            _loc2_--;
         }
         if(_loc2_ > 0)
         {
            return int(param1.substring(_loc2_ + 1));
         }
         return -1;
      }
      
      private function getRaceLocalizationKey(param1:int, param2:int) : String
      {
         return "pet.breed." + param1 + "." + param2;
      }
      
      private function addZeroPadding(param1:String, param2:int) : String
      {
         while(param1.length < param2)
         {
            param1 = "0" + param1;
         }
         return param1;
      }
      
      private function updateAvailablePalettes(param1:String) : void
      {
         var _loc2_:Array = null;
         if(var_1605 == null)
         {
            _loc2_ = _catalog.getSellablePetPalettes(param1);
            var_1605 = parseSellablePalettes(_loc2_);
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 == var_3837)
         {
            setPreviewImage(param2,true);
            onWidgetsInitialized();
         }
      }
      
      public function imageFailed(param1:int) : void
      {
      }
   }
}
