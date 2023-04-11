package com.sulake.habbo.ui.widget.camera
{
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.assets.loaders.BitmapFileLoader;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.purse.class_3160;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.utils.StringUtil;
   import com.sulake.habbo.utils.TextWindowUtils;
   import com.sulake.habbo.window.utils.AlertDialogCaption;
   import com.sulake.habbo.window.utils.class_3216;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.Timer;
   import package_82.class_452;
   import package_82.class_507;
   
   internal class PhotoPurchaseConfirmationDialog
   {
      
      private static const STATE_LOADING_IMAGE:String = "loading_image";
      
      private static const STATE_IMAGE_LOADED:String = "image_loaded";
      
      private static const STATE_WAITING_PURCHASE_TO_COMPLETE:String = "waiting_purchase_to_complete";
      
      private static const STATE_WAITING_PUBLISH_TO_COMPLETE:String = "waiting_publish_to_complete";
      
      private static const STATE_WAITING_COMPETITION_SUBMIT_TO_COMPLETE:String = "waiting_competition_submit_to_complete";
      
      private static const STATE_RENDERING_FAILED:String = "rendering_failed";
       
      
      private var var_159:String;
      
      private var _window:class_3151;
      
      private var var_1429:com.sulake.habbo.ui.widget.camera.CameraWidget;
      
      private var var_973:BitmapData;
      
      private var _caption:String;
      
      private var var_3702:Boolean;
      
      private var var_3380:Boolean = false;
      
      private var var_3241:Boolean = false;
      
      private var var_477:String = null;
      
      private var var_1778:Timer;
      
      private var var_3731:int = 0;
      
      public function PhotoPurchaseConfirmationDialog(param1:com.sulake.habbo.ui.widget.camera.CameraWidget, param2:String)
      {
         super();
         var_1429 = param1;
         _caption = param2;
         _window = var_1429.getXmlWindow("photo_purchase_confirmation") as class_3151;
         var _loc3_:IItemListWindow = (_window as class_3281).content.getChildByName("contentlist") as IItemListWindow;
         if(param1.component.getBoolean("camera.competition.enabled"))
         {
            TextWindowUtils.setHTMLLinkStyle(_window.findChildByName("competition_info") as ITextWindow,16777215,16777215,16777215);
         }
         else
         {
            _loc3_.removeListItem(_loc3_.getListItemByName("competition_wrapper"));
         }
         if(param1.component.getBoolean("disclaimer.credit_spending.enabled"))
         {
            setDisclaimerAccepted(false);
         }
         else
         {
            _loc3_.removeListItem(_loc3_.getListItemByName("disclaimer"));
            setDisclaimerAccepted(true);
         }
         if(!param1.component.getBoolean("camera.photo.publishing.enabled"))
         {
            _loc3_.removeListItem(_loc3_.getListItemByName("publish_wrapper"));
         }
         (_window as class_3281).resizeToFitContent();
         setState("loading_image");
         _window.center();
         _window.procedure = windowEventHandler;
      }
      
      private function checkPurse(param1:int, param2:int) : Boolean
      {
         var _loc3_:class_3160 = var_1429.catalog.getPurse();
         if(_loc3_.credits < param1)
         {
            var_1429.catalog.showNotEnoughCreditsAlert();
            return false;
         }
         if(_loc3_.getActivityPointsForType(0) < param2)
         {
            var_1429.catalog.showNotEnoughActivityPointsAlert(0);
            return false;
         }
         return true;
      }
      
      private function disableButtons(param1:Boolean) : void
      {
         var _loc4_:class_3140 = class_3140(_window.findChildByName("buy_button"));
         var _loc2_:class_3140 = class_3140(_window.findChildByName("publish_button"));
         var _loc3_:class_3140 = class_3140(_window.findChildByName("competition_button"));
         if(_loc4_)
         {
            _loc4_.disable();
         }
         if(_loc2_)
         {
            _loc2_.disable();
         }
         if(_loc3_)
         {
            _loc3_.disable();
         }
         if(param1)
         {
            class_3140(_window.findChildByName("cancel_button")).caption = var_1429.localizations.getLocalization("generic.close");
            _window.findChildByName("status_info").caption = var_1429.localizations.getLocalization("camera.purchase.pleasewait");
         }
      }
      
      private function setState(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         var_159 = param1;
         var _loc4_:class_3140 = class_3140(_window.findChildByName("buy_button"));
         var _loc2_:class_3140 = class_3140(_window.findChildByName("publish_button"));
         var _loc3_:class_3140 = class_3140(_window.findChildByName("competition_button"));
         switch(param1)
         {
            case "loading_image":
               disableButtons(false);
               break;
            case "image_loaded":
               if(var_3702)
               {
                  _loc4_.enable();
               }
               if(!var_3241)
               {
                  if(_loc2_)
                  {
                     _loc2_.enable();
                  }
               }
               if(!var_3380 && _loc3_)
               {
                  _loc3_.enable();
                  break;
               }
               break;
            case "waiting_purchase_to_complete":
               disableButtons(true);
               if(var_1429.component.getBoolean("disclaimer.credit_spending.enabled"))
               {
                  setDisclaimerAccepted(false);
                  break;
               }
               break;
            case "waiting_publish_to_complete":
               var_3241 = true;
               disableButtons(true);
               break;
            case "waiting_competition_submit_to_complete":
               var_3380 = true;
               disableButtons(true);
               break;
            case "rendering_failed":
               disableButtons(false);
               _window.findChildByName("status_info").caption = "";
         }
      }
      
      public function animateIconToToolbar() : void
      {
         if(!_window)
         {
            return;
         }
         var _loc2_:class_3282 = _window.findChildByName("product_image") as class_3282;
         var _loc4_:Point = new Point();
         _loc2_.getGlobalPosition(_loc4_);
         var _loc6_:BitmapData;
         var _loc3_:Number = (_loc6_ = new BitmapData(120,120)).width / 0;
         var _loc5_:Matrix = new Matrix(_loc3_,0,0,_loc3_,0,0);
         _loc6_.draw(var_973,_loc5_);
         var_1429.component.toolbar.createTransitionToIcon("HTIE_ICON_INVENTORY",_loc6_,_loc4_.x,_loc4_.y);
         _window.findChildByName("status_info").caption = var_1429.localizations.getLocalization("camera.purchase.successful");
         _window.findChildByName("buy_button").caption = var_1429.localizations.getLocalization("camera.buy.another.button.text");
         _window.findChildByName("inventory_link_area").visible = true;
         var_3731++;
         _window.findChildByName("purchase_count").caption = "";
         _window.findChildByName("purchase_count").caption = var_3731.toString();
         setState("image_loaded");
      }
      
      public function setImageUrl(param1:String) : void
      {
         var _loc2_:BitmapFileLoader = null;
         if(var_1429 == null)
         {
            return;
         }
         if(param1 && param1.length > 0)
         {
            param1 = var_1429.component.context.configuration.getProperty("stories.image_url_base") + param1;
            _loc2_ = new BitmapFileLoader("image/png",new URLRequest(param1));
            _loc2_.addEventListener("AssetLoaderEventComplete",onImageLoaded);
         }
         else
         {
            setRenderingFailed();
            var_1429.windowManager.alert("${generic.alert.title}","${camera.render.count.info}",0,null);
         }
      }
      
      private function onImageLoaded(param1:AssetLoaderEvent) : void
      {
         if(!_window)
         {
            return;
         }
         var _loc2_:Bitmap = BitmapFileLoader(param1.target).content as Bitmap;
         if(_loc2_)
         {
            setImage(_loc2_.bitmapData);
         }
         _window.findChildByName("status_info").caption = var_1429.localizations.getLocalization("camera.confirm_phase.info");
         setState("image_loaded");
      }
      
      private function setImage(param1:BitmapData) : void
      {
         if(_window == null || param1 == null)
         {
            return;
         }
         var _loc3_:class_3282 = _window.findChildByName("product_image") as class_3282;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.bitmap != null)
         {
            _loc3_.bitmap.dispose();
            _loc3_.bitmap = null;
         }
         if(_loc3_.bitmap == null)
         {
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         }
         var _loc2_:Number = _loc3_.width / param1.width;
         _loc3_.bitmap.draw(param1,new Matrix(_loc2_,0,0,_loc2_,0,0),null,null,null,true);
         var_973 = param1;
      }
      
      public function setRenderingFailed() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:class_3282 = _window.findChildByName("product_image") as class_3282;
         if(_loc1_ != null)
         {
            var_973 = new BitmapData(_loc1_.width,_loc1_.height,false,0);
            if(_loc1_.bitmap == null)
            {
               _loc1_.bitmap = var_973;
            }
            else
            {
               _loc1_.bitmap.dispose();
               _loc1_.bitmap.draw(var_973);
            }
         }
         setState("rendering_failed");
      }
      
      public function publishingStatus(param1:class_452) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:String = null;
         if(_window == null)
         {
            return;
         }
         if(param1.getParser().isOk())
         {
            var_477 = param1.getParser().getExtraDataId();
            _window.findChildByName("status_info").caption = var_1429.localizations.getLocalization("camera.publish.successful");
            _window.findChildByName("publish_explanation").caption = var_1429.localizations.getLocalization("camera.publish.successful");
            _window.findChildByName("publish_detailed_explanation").caption = var_1429.localizations.getLocalization("camera.publish.success.short.info");
            _window.findChildByName("publish_button").visible = false;
            _window.findChildByName("publish_price_area").visible = false;
            _window.findChildByName("publish_link_area").visible = true;
            if(var_1778 != null)
            {
               var_1778.reset();
            }
         }
         else
         {
            _loc3_ = (_loc4_ = param1.getParser().getSecondsToWait()) / 60 + 1;
            _loc2_ = String(var_1429.localizations.registerParameter("camera.publish.wait","minutes",_loc3_.toString()));
            var_1429.windowManager.alert("${generic.alert.title}",_loc2_,0,null);
            _window.findChildByName("status_info").caption = "";
            if(var_1778 == null)
            {
               var_1778 = new Timer(_loc4_ * 1000,1);
               var_1778.addEventListener("timerComplete",onPublishTimerComplete);
            }
            else
            {
               var_1778.reset();
               var_1778.delay = _loc4_ * 1000;
            }
            var_1778.start();
         }
         setState("image_loaded");
      }
      
      private function onPublishTimerComplete(param1:TimerEvent) : void
      {
         var _loc2_:class_3140 = null;
         var_3241 = false;
         var_1778 = null;
         if(var_159 == "image_loaded")
         {
            _loc2_ = class_3140(_window.findChildByName("publish_button"));
            _loc2_.enable();
         }
      }
      
      public function competitionStatus(param1:class_507) : void
      {
         var _loc2_:class_3216 = null;
         if(_window == null || _window.findChildByName("competition_wrapper") == null)
         {
            return;
         }
         if(param1.getParser().isOk())
         {
            _window.findChildByName("status_info").caption = var_1429.localizations.getLocalization("camera.competition.submitted.status");
            _window.findChildByName("competition_name").caption = var_1429.localizations.getLocalization("camera.competition.submitted.info");
         }
         else if(param1.getParser().getErrorReason() == "too-many-submits")
         {
            _window.findChildByName("status_info").caption = var_1429.localizations.getLocalization("generic.failed");
            _window.findChildByName("competition_name").caption = var_1429.localizations.getLocalization("camera.competition.limit.info");
         }
         else if(param1.getParser().getErrorReason() == "email-not-verified")
         {
            var_3380 = false;
            _window.findChildByName("status_info").caption = var_1429.localizations.getLocalization("generic.failed");
            _loc2_ = var_1429.windowManager.confirm("${generic.alert.title}","${camera.competition.email.not.verified}",48,onEmailVerificationGo);
            _loc2_.setButtonCaption(16,new AlertDialogCaption(var_1429.localizations.getLocalization("email.settings"),"",true));
            _loc2_.setButtonCaption(32,new AlertDialogCaption(var_1429.localizations.getLocalization("groupforum.settings.cancel"),"",true));
         }
         setState("image_loaded");
         var _loc3_:class_3127 = _window.findChildByName("competition_button");
         if(_loc3_ != null && _loc3_.y < 10)
         {
            _loc3_.y = 10;
         }
      }
      
      private function onEmailVerificationGo(param1:class_3216, param2:class_3134) : void
      {
         var _loc4_:String = null;
         var _loc3_:String = null;
         if(param2.type == "WE_OK")
         {
            _loc4_ = String(var_1429.component.context.configuration.getProperty("email.verification.url"));
            if(!StringUtil.isEmpty(_loc4_))
            {
               _loc3_ = var_1429.component.getInteger("spaweb",0) == 1 ? "" : "_blank";
               navigateToURL(new URLRequest(_loc4_),_loc3_);
            }
         }
         param1.dispose();
      }
      
      public function setPrices(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:ITextWindow;
         (_loc4_ = _window.findChildByName("purchase_credit_cost_text") as ITextWindow).text = param1.toString();
         var _loc5_:ITextWindow = _window.findChildByName("purchase_ducket_cost_text") as ITextWindow;
         if(param2 > 0)
         {
            _loc5_.text = param2.toString();
         }
         else
         {
            _loc5_.visible = false;
            _window.findChildByName("ducket_icon").visible = false;
         }
         var _loc6_:ITextWindow;
         if(_loc6_ = _window.findChildByName("publish_ducket_cost_text") as ITextWindow)
         {
            _loc6_.text = param3.toString();
         }
      }
      
      private function windowEventHandler(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(!param1 || !param2)
         {
            return;
         }
         if(param1.type != "WME_CLICK" && param1.type != "WME_DOUBLE_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "spending_disclaimer":
               setDisclaimerAccepted(class_3176(param2).isSelected);
               break;
            case "competition_button":
               if(var_159 == "image_loaded")
               {
                  setState("waiting_competition_submit_to_complete");
                  var_1429.handler.confirmPhotoCompetitionSubmit();
                  break;
               }
               break;
            case "buy_button":
               if(var_159 == "image_loaded" && var_3702 && checkPurse(var_1429.handler.creditPrice,var_1429.handler.ducketPrice))
               {
                  setState("waiting_purchase_to_complete");
                  var_1429.handler.confirmPhotoPurchase();
                  break;
               }
               break;
            case "publish_button":
               if(var_159 == "image_loaded" && checkPurse(0,var_1429.handler.publishDucketPrice))
               {
                  setState("waiting_publish_to_complete");
                  var_1429.handler.confirmPhotoPublish();
                  break;
               }
               break;
            case "inventory_link":
               var_1429.component.context.createLinkEvent("inventory/open/furni");
               break;
            case "publish_link":
               _loc3_ = var_1429.container.sessionDataManager.userName;
               _loc4_ = "/profile/" + _loc3_ + "/photo/" + var_477;
               HabboWebTools.openPage(_loc4_);
               break;
            case "header_button_close":
            case "cancel_button":
               var_1429.startTakingPhoto("photoPurchaseCancel");
               hide();
         }
      }
      
      private function setDisclaimerAccepted(param1:Boolean) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:class_3127 = _window.findChildByName("buy_button");
         if(_loc2_ == null)
         {
            return;
         }
         var_3702 = param1;
         if(param1 && var_159 == "image_loaded")
         {
            _loc2_.enable();
         }
         else
         {
            _loc2_.disable();
         }
      }
      
      public function hide() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         var_973 = null;
         var_1429 = null;
         if(var_1778 != null)
         {
            var_1778.stop();
            var_1778 = null;
         }
      }
   }
}
