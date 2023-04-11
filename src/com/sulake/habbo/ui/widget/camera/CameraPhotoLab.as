package com.sulake.habbo.ui.widget.camera
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.utils.images.class_3146;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IScrollableGridWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3207;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.quest.class_2047;
   import com.sulake.habbo.tracking.HabboTracking;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.globalization.DateTimeFormatter;
   import flash.net.FileReference;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import package_82.class_452;
   import package_82.class_507;
   
   public class CameraPhotoLab implements class_13
   {
      
      private static var TEXT_WIDTH_MARGIN:int = 6;
      
      private static var var_1590:PhotoPurchaseConfirmationDialog;
       
      
      private var var_1429:com.sulake.habbo.ui.widget.camera.CameraWidget;
      
      private var _window:class_3151;
      
      private var _disposed:Boolean = false;
      
      private var var_1580:class_3282;
      
      private var var_2998:BitmapData;
      
      private var var_1844:com.sulake.habbo.ui.widget.camera.CameraFxStrengthSlider;
      
      private var _sliderEffectInfo:ITextWindow;
      
      private var var_1647:com.sulake.habbo.ui.widget.camera.CameraEffect;
      
      private var var_1696:class_24;
      
      private var _itemGrid:IScrollableGridWindow;
      
      private var var_3129:Sprite;
      
      private var var_2669:class_24;
      
      private var _captionInputKeyEvents:int = 0;
      
      private var _latestCaption:String = "";
      
      private var var_3358:Boolean = false;
      
      private var var_106:FileReference;
      
      public function CameraPhotoLab(param1:com.sulake.habbo.ui.widget.camera.CameraWidget)
      {
         var_1696 = new class_24();
         var_2669 = new class_24();
         var_106 = new FileReference();
         super();
         var_1429 = param1;
      }
      
      public static function preloadEffects(param1:String, param2:String, param3:class_18) : void
      {
         var _loc5_:* = [];
         var _loc4_:class_24 = com.sulake.habbo.ui.widget.camera.CameraEffect.getEffects(param2,param3);
         for each(var _loc6_ in _loc4_)
         {
            if(_loc6_.type == "composite" || _loc6_.type == "frame")
            {
               _loc5_.push(_loc6_.name);
            }
         }
         CameraFxPreloader.init(param1,_loc5_);
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(var_1590)
         {
            var_1590.hide();
         }
         com.sulake.habbo.ui.widget.camera.CameraEffect.resetAllEffects();
         var_2998 = null;
         var_1429 = null;
         var_1580 = null;
         if(var_1844 != null)
         {
            var_1844.dispose();
            var_1844 = null;
         }
         _sliderEffectInfo = null;
         var_1647 = null;
         var_1696 = null;
         var_2669 = null;
         _disposed = true;
         if(_window)
         {
            _window.dispose();
         }
         _window = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function setImageAndFilterButtons(param1:BitmapData) : void
      {
         var_2998 = param1.clone();
         var_1580.bitmap = param1;
         buildFilterButtons();
      }
      
      internal function setSelectedFxValue(param1:Number) : void
      {
         if(var_1647)
         {
            var_1647.value = param1;
            updateSliderEffectInfo();
            renderAllEffects();
         }
      }
      
      private function updateSliderEffectInfo() : void
      {
         _sliderEffectInfo.text = "undefined " + int(var_1647.getEffectStrength() * 100) + "%";
         _sliderEffectInfo.width = _sliderEffectInfo.textWidth + TEXT_WIDTH_MARGIN;
      }
      
      internal function setCaptionText(param1:String) : void
      {
         ITextWindow(_window.findChildByName("captionInput")).text = param1;
      }
      
      private function buildTypeButtons() : void
      {
         var _loc5_:int = 0;
         _loc5_ = 6;
         var _loc3_:int = 0;
         _loc3_ = 2;
         if(false)
         {
            return;
         }
         var _loc1_:int = (_window as class_3281).margins.left + _itemGrid.x;
         var _loc2_:class_3151 = createTypeButton("colormatrix","camera_icon_colorfilter");
         _loc2_.x = _loc1_ + (0 - (2 * (_loc2_.width + 6) - 6)) / 2;
         _loc2_.y = 50;
         _window.addChild(_loc2_);
         var _loc4_:class_3151;
         (_loc4_ = createTypeButton("composite","camera_icon_compositefilter")).x = _loc2_.right + 6;
         _loc4_.y = _loc2_.y;
         _window.addChild(_loc4_);
      }
      
      private function buildFilterButtons() : void
      {
         var _loc1_:class_3151 = null;
         var _loc5_:String = null;
         if(CameraFxPreloader.preloadFinished() == false)
         {
            setTimeout(buildFilterButtons,200);
         }
         var _loc6_:int = 0;
         var _loc7_:class_2047;
         if((_loc7_ = var_1429.handler.roomDesktop.questEngine) != null)
         {
            if((_loc6_ = _loc7_.getAchievementLevel("explore","ACH_CameraPhotoCount")) == 0)
            {
               _loc6_ = _loc7_.getAchievementLevel("archive","ACH_CameraPhotoCount");
            }
         }
         var _loc2_:class_24 = com.sulake.habbo.ui.widget.camera.CameraEffect.getEffects(var_1429.component.getProperty("camera.available.effects"),var_1429.localizations);
         for each(var _loc4_ in _loc2_)
         {
            _loc1_ = createFxButton(_loc4_,var_2998.clone(),_loc6_);
            if(_loc1_)
            {
               _loc5_ = _loc4_.description;
               if(_loc6_ < _loc4_.var_3577)
               {
                  _loc5_ = var_1429.localizations.getLocalization("camera.effect.required.level") + " " + _loc4_.var_3577;
               }
               IRegionWindow(_loc1_).toolTipCaption = _loc5_;
            }
         }
         var _loc3_:class_3151 = _window.findChildByName("slider_container") as class_3151;
         var_1844 = new com.sulake.habbo.ui.widget.camera.CameraFxStrengthSlider(this,_loc3_,var_1429.windowManager.assets);
         var_1844.disable();
         com.sulake.habbo.ui.widget.camera.CameraEffect.setMaxValue(var_1844.getScale());
         setFilterType("colormatrix");
      }
      
      private function createTypeButton(param1:String, param2:String) : class_3151
      {
         var _loc3_:IRegionWindow = var_1429.getXmlWindow("camera_typebutton") as IRegionWindow;
         var _loc4_:class_3282;
         (_loc4_ = _loc3_.findChildByName("icon") as class_3282).bitmap = (var_1429.windowManager.assets.getAssetByName(param2).content as BitmapData).clone();
         _loc3_.name = "typebutton," + param1;
         _loc3_.toolTipCaption = param1;
         var_2669.add(param1,_loc3_);
         return _loc3_;
      }
      
      private function createFxButton(param1:com.sulake.habbo.ui.widget.camera.CameraEffect, param2:BitmapData, param3:int) : class_3151
      {
         var _loc7_:class_3282 = null;
         var _loc5_:Number = NaN;
         var _loc8_:Matrix = null;
         var _loc9_:Bitmap = null;
         var _loc6_:class_3127 = null;
         var _loc4_:class_3151 = var_1429.getXmlWindow("camera_filterbutton") as class_3151;
         if(param3 >= param1.var_3577)
         {
            (_loc7_ = _loc4_.findChildByName("content") as class_3282).bitmap = new BitmapData(_loc7_.width,_loc7_.height,true,0);
            _loc5_ = _loc7_.width / param2.width;
            (_loc8_ = new Matrix()).scale(_loc5_,_loc5_);
            _loc9_ = new Bitmap(param2,"auto",true);
            switch(param1.type)
            {
               case "colormatrix":
                  param2.applyFilter(param2,param2.rect,new Point(0,0),param1.getColorMatrixFilter(true));
                  break;
               case "composite":
                  if(CameraFxPreloader.getImage(param1.name) == null)
                  {
                     return null;
                  }
                  param2.draw(CameraFxPreloader.getImage(param1.name),null,null,param1.var_4051,null,true);
                  break;
               case "frame":
                  if(CameraFxPreloader.getImage(param1.name) == null)
                  {
                     return null;
                  }
                  param2.draw(CameraFxPreloader.getImage(param1.name),null,null,null,null,true);
                  break;
            }
            _loc7_.bitmap.draw(_loc9_,_loc8_,null,null,null,true);
            _loc4_.procedure = effectButtonClick;
         }
         else
         {
            (_loc6_ = _loc4_.findChildByName("lock_indicator") as class_3127).visible = true;
         }
         _loc4_.name = param1.name;
         param1.button = _loc4_;
         var_1696[_loc4_.name] = param1;
         return _loc4_;
      }
      
      public function openPhotoLab(param1:BitmapData) : void
      {
         _window = var_1429.getXmlWindow("camera_editor") as class_3151;
         _window.center();
         if(var_1429.component.getProperty("camera.effects.enabled") != "true")
         {
            openPurchaseConfirmationDialog(null);
            return;
         }
         _itemGrid = _window.findChildByName("item_grid") as IScrollableGridWindow;
         _itemGrid.spacing = 7;
         var_1580 = _window.findChildByName("image") as class_3282;
         _window.procedure = windowEventHandler;
         var _loc10_:ITextWindow;
         (_loc10_ = ITextWindow(_window.findChildByName("captionInput"))).procedure = captionProcedure;
         var _loc6_:class_3207 = _window.findChildByName("purchase_display_object") as class_3207;
         var_3129 = new Sprite();
         var_3129.graphics.beginFill(16711680,0);
         var_3129.graphics.drawRect(0,0,_loc6_.width,_loc6_.height);
         _loc6_.setDisplayObject(var_3129);
         var_3129.addEventListener("click",openPurchaseConfirmationDialog);
         var _loc11_:class_3213;
         var _loc7_:IRegionWindow;
         var _loc5_:ITextWindow = (_loc11_ = (_loc7_ = _window.findChildByName("zoom_button") as IRegionWindow).getChildByName("centerizer") as class_3213).getChildByName("zoom_text") as ITextWindow;
         _loc5_.width = _loc5_.textWidth + TEXT_WIDTH_MARGIN;
         var _loc4_:class_3213;
         var _loc8_:IRegionWindow;
         var _loc9_:ITextWindow = (_loc4_ = (_loc8_ = _window.findChildByName("save_button") as IRegionWindow).getChildByName("centerizer") as class_3213).getChildByName("save_text") as ITextWindow;
         _loc9_.width = _loc9_.textWidth + TEXT_WIDTH_MARGIN;
         var _loc2_:class_3207 = _window.findChildByName("save_click_catcher") as class_3207;
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(16711680,0);
         _loc3_.graphics.drawRect(0,0,_loc2_.width,_loc2_.height);
         _loc2_.setDisplayObject(_loc3_);
         _loc3_.addEventListener("click",offerSaveAsFile);
         buildTypeButtons();
         setImageAndFilterButtons(param1);
         _sliderEffectInfo = _window.findChildByName("slider_effect_info") as ITextWindow;
         com.sulake.habbo.ui.widget.camera.CameraEffect.resetAllEffects();
      }
      
      private function effectButtonClick(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:com.sulake.habbo.ui.widget.camera.CameraEffect = null;
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(param2.name == "remove_effect_button")
         {
            if(var_1696.hasKey(param2.parent.name))
            {
               _loc3_ = var_1696[param2.parent.name];
               _loc3_.setChosen(false);
               if(var_1647 == _loc3_)
               {
                  var_1844.disable();
                  var_1647 = null;
               }
               renderAllEffects();
               return;
            }
         }
         if(var_1696.hasKey(param2.name))
         {
            setActiveEffect(var_1696[param2.name]);
         }
      }
      
      private function captionProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WKE_KEY_DOWN")
         {
            if(WindowKeyboardEvent(param1).ctrlKey || WindowKeyboardEvent(param1).charCode == 0)
            {
               _captionInputKeyEvents = 0;
            }
            else
            {
               _captionInputKeyEvents++;
            }
         }
         else if(param1.type == "WKE_KEY_UP")
         {
            _captionInputKeyEvents = 0;
         }
         else if(param1.type == "WE_CHANGE")
         {
            if(_captionInputKeyEvents == 1)
            {
               _latestCaption = ITextWindow(_window.findChildByName("captionInput")).text;
            }
            else
            {
               setCaptionText(_latestCaption);
            }
            _captionInputKeyEvents = 0;
         }
      }
      
      private function openPurchaseConfirmationDialog(param1:MouseEvent) : void
      {
         if(var_1590)
         {
            var_1590.hide();
         }
         if(var_1429.container.sessionDataManager.isAccountSafetyLocked())
         {
            var_1429.windowManager.alert("${generic.alert.title}","${notifications.text.safety_locked}",0,null);
            if(var_1429.component.getProperty("camera.effects.enabled") != "true")
            {
               dispose();
            }
            return;
         }
         var_1590 = new PhotoPurchaseConfirmationDialog(var_1429,ITextWindow(_window.findChildByName("captionInput")).text);
         var _loc2_:Boolean = var_1429.sendPhotoData();
         var_1590.setPrices(var_1429.handler.creditPrice,var_1429.handler.ducketPrice,var_1429.handler.publishDucketPrice);
         HabboTracking.getInstance().trackEventLog("Stories","camera","stories.photo.purchase_dialog_opened");
         if(!_loc2_)
         {
            var_1590.setRenderingFailed();
            var_1429.windowManager.alert("${generic.alert.title}","${camera.alert.too_much_stuff}",0,null);
         }
         hide();
      }
      
      public function hide() : void
      {
         _window.visible = false;
      }
      
      public function show() : void
      {
         _window.visible = true;
      }
      
      public function closePurchaseConfirmation() : void
      {
         if(var_1590)
         {
            var_1590.hide();
            var_1590 = null;
         }
      }
      
      internal function animateSuccessfulPurchase() : void
      {
         if(var_1590)
         {
            var_1590.animateIconToToolbar();
         }
      }
      
      public function publishingStatus(param1:class_452) : void
      {
         if(var_1590)
         {
            var_1590.publishingStatus(param1);
         }
      }
      
      public function competitionStatus(param1:class_507) : void
      {
         if(var_1590)
         {
            var_1590.competitionStatus(param1);
         }
      }
      
      private function offerSaveAsFile(param1:MouseEvent) : void
      {
         var _loc2_:DateTimeFormatter = null;
         var _loc4_:String = null;
         var _loc3_:BitmapData = var_1580.bitmap.clone();
         var _loc5_:ByteArray = class_3146.encode(_loc3_);
         try
         {
            _loc2_ = new DateTimeFormatter("i-default");
            _loc2_.setDateTimePattern("yyyy-MM-dd_HH-mm-ss");
            _loc4_ = "Habbo_" + _loc2_.format(new Date()) + ".png";
            var_106.save(_loc5_,_loc4_);
         }
         catch(error:Error)
         {
         }
      }
      
      public function logChosenEffects() : void
      {
         for each(var _loc1_ in var_1696)
         {
            if(_loc1_.isOn)
            {
               HabboTracking.getInstance().trackEventLog("Stories","camera","stories.photo.effect.chosen",_loc1_.name);
            }
         }
      }
      
      private function windowEventHandler(param1:class_3134, param2:class_3127) : void
      {
         if(_disposed || !_window || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "cancel_button":
               var_1429.startTakingPhoto("effectEditorCancel");
               dispose();
               break;
            case "header_button_close":
               dispose();
               break;
            case "help_button":
               var_1429.component.context.createLinkEvent("habbopages/camera");
               break;
            case "save_button":
            case "slider_container":
               break;
            case "zoom_button":
               var_3358 = !var_3358;
               renderAllEffects();
               break;
            default:
               var_1844.disable();
               if(var_1647 != null)
               {
                  var_1647.turnOffHighlight();
                  break;
               }
         }
         if(param2.name.indexOf("typebutton") != -1)
         {
            setFilterType(param2.name.split(",")[1]);
         }
      }
      
      private function setActiveEffect(param1:com.sulake.habbo.ui.widget.camera.CameraEffect) : void
      {
         if(var_1647 != null)
         {
            var_1647.turnOffHighlight();
         }
         var_1647 = param1;
         var_1647.setChosen(true);
         if(param1.usesEffectStrength())
         {
            var_1844.enable();
            var_1844.setValue(param1.value);
            updateSliderEffectInfo();
         }
         else
         {
            var_1844.disable();
         }
         if(param1.allowsOnlyOneInstance())
         {
            turnOffOtherEffectsOfSameType(param1);
         }
         renderAllEffects();
      }
      
      private function turnOffOtherEffectsOfSameType(param1:com.sulake.habbo.ui.widget.camera.CameraEffect) : void
      {
         for each(var _loc2_ in var_1696)
         {
            if(_loc2_.type == param1.type && _loc2_ != param1)
            {
               _loc2_.setChosen(false);
            }
         }
      }
      
      private function setFilterType(param1:String) : void
      {
         if(var_1647 != null)
         {
            var_1647.turnOffHighlight();
         }
         _itemGrid.removeGridItems();
         for each(var _loc2_ in var_1696)
         {
            if(_loc2_.type == param1)
            {
               _itemGrid.addGridItem(_loc2_.button);
            }
         }
         highlightSelectedButtonType(param1);
      }
      
      private function highlightSelectedButtonType(param1:String) : void
      {
         var _loc3_:class_3127 = null;
         for each(var _loc2_ in var_2669)
         {
            _loc3_ = _loc2_.findChildByName("active_border");
            _loc3_.visible = _loc2_.name == "typebutton," + param1;
         }
      }
      
      private function renderAllEffects() : void
      {
         var _loc2_:ColorTransform = null;
         var _loc5_:Matrix = null;
         var _loc3_:BitmapData = null;
         var _loc1_:* = var_2998.clone();
         if(var_3358)
         {
            (_loc5_ = new Matrix()).a = 2;
            _loc5_.d = 2;
            _loc5_.tx = -_loc1_.width / 2;
            _loc5_.ty = -_loc1_.height / 2;
            _loc3_ = new BitmapData(_loc1_.width,_loc1_.height);
            _loc3_.draw(_loc1_,_loc5_);
            _loc1_ = _loc3_;
         }
         for each(var _loc4_ in var_1696)
         {
            if(_loc4_.isOn)
            {
               if(_loc4_.type == "colormatrix")
               {
                  _loc1_.applyFilter(_loc1_,_loc1_.rect,new Point(0,0),_loc4_.getColorMatrixFilter());
               }
               if(_loc4_.type == "composite")
               {
                  _loc2_ = new ColorTransform(1,1,1,_loc4_.getEffectStrength());
                  _loc1_.draw(CameraFxPreloader.getImage(_loc4_.name),null,_loc2_,_loc4_.var_4051);
               }
            }
         }
         for each(var _loc6_ in var_1696)
         {
            if(_loc6_.isOn && _loc6_.type == "frame")
            {
               _loc1_.draw(CameraFxPreloader.getImage(_loc6_.name));
            }
         }
         var_1580.bitmap = _loc1_;
         var_1580.invalidate();
      }
      
      protected function onClose(param1:WindowMouseEvent) : void
      {
         dispose();
      }
      
      public function setRenderedPhotoUrl(param1:String) : void
      {
         if(var_1590)
         {
            var_1590.setImageUrl(param1);
         }
      }
      
      public function getEffectDataJson() : String
      {
         var _loc2_:* = null;
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         for each(var _loc3_ in var_1696)
         {
            if(_loc3_.isOn && _loc3_.type != "frame")
            {
               _loc2_ = {};
               _loc2_.name = _loc3_.name;
               _loc2_.alpha = int(_loc3_.getEffectStrength() * 255);
               _loc1_.push(_loc2_);
            }
         }
         for each(var _loc4_ in var_1696)
         {
            if(_loc4_.isOn && _loc4_.type == "frame")
            {
               _loc2_ = {};
               _loc2_.name = _loc4_.name;
               _loc1_.push(_loc2_);
            }
         }
         return JSON.stringify(_loc1_);
      }
      
      public function getZoom() : int
      {
         return var_3358 ? 2 : 1;
      }
   }
}
