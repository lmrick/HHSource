package com.sulake.habbo.ui.widget.furniture.externalimage
{
   import adobe.serialization.json.JSONDecoder;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.assets.loaders.BitmapFileLoader;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ILabelWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3181;
   import com.sulake.core.window.components.class_3207;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowLinkEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.class_1697;
   import com.sulake.habbo.inventory.items.class_3172;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.ExternalImageWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.utils.StringUtil;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.AlertDialogCaption;
   import com.sulake.habbo.window.utils.class_3216;
   import com.sulake.habbo.window.widgets.IIlluminaInputWidget;
   import com.sulake.room.object.IRoomObject;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextField;
   import package_7.class_313;
   
   public class ExternalImageWidget extends RoomWidgetBase
   {
      
      private static const TYPE_PHOTO_POSTER:String = "photo_poster";
      
      private static const TYPE_SELFIE:String = "selfie";
      
      private static const TYPE_LEGACY:String = "legacy";
      
      private static const HORIZONTAL_ITEM_SPACING:int = 10;
      
      private static const VERTICAL_SPACE:int = 71;
       
      
      private var _window:class_3151;
      
      private var var_1539:class_3282;
      
      private var _moderationText:class_3181;
      
      private var _makeOwnButton:class_3127;
      
      private var _closeButton:class_3127;
      
      private var _deleteButton:class_3151;
      
      private var _bgBorder:class_3127;
      
      private var _buttonContainer:class_3151;
      
      private var _shareArea:class_3151;
      
      private var _shareButton:class_3127;
      
      private var _senderNameButton:IRegionWindow;
      
      private var var_3314:ILabelWindow;
      
      private var var_2277:TextField;
      
      private var var_3150:ILabelWindow;
      
      private var var_2790:BitmapFileLoader;
      
      private var var_3438:Bitmap;
      
      private var _inventory:class_1697;
      
      private var var_2525:int;
      
      private var var_2571:String;
      
      private var _caption:String;
      
      private var var_1323:int;
      
      private var var_2210:String;
      
      private var _reportImagebutton:class_3151;
      
      private var var_2127:String;
      
      private var var_4353:class_3282;
      
      private var _habboHelp:IHabboHelp;
      
      private var _roomEngine:IRoomEngine;
      
      private var reportWindow:class_3151;
      
      private var var_1708:int = 0;
      
      private var var_3330:Boolean = false;
      
      private var var_1460:class_20;
      
      public function ExternalImageWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18, param5:class_1697, param6:IHabboHelp, param7:IRoomEngine, param8:class_20)
      {
         var _loc9_:class_3207 = null;
         super(param1,param2,param3,param4);
         _window = param2.buildFromXML(param3.getAssetByName("stories_image_widget_xml").content as XML) as class_3151;
         ownHandler.widget = this;
         _closeButton = _window.findChildByName("closebutton") as class_3127;
         var_1539 = _window.findChildByName("imageLoader") as class_3282;
         _moderationText = _window.findChildByName("moderationText") as class_3181;
         _moderationText.addEventListener("WE_LINK",onClickModerationInfoLink);
         _shareArea = _window.findChildByName("shareArea") as class_3151;
         _deleteButton = _window.findChildByName("removeButtonContainer") as class_3151;
         _makeOwnButton = _window.findChildByName("makeOwnButton") as class_3127;
         _shareButton = _window.findChildByName("shareButtonContainer") as class_3127;
         _bgBorder = _window.findChildByName("bgBorder") as class_3127;
         _senderNameButton = _window.findChildByName("senderNameButton") as IRegionWindow;
         var_3314 = _window.findChildByName("senderName") as ILabelWindow;
         var_2277 = new TextField();
         if(ownHandler.container.roomSession.roomControllerLevel == 5)
         {
            _loc9_ = _window.findChildByName("name_copy_wrapper") as class_3207;
            var_2277.textColor = 10061943;
            var_2277.text = "";
            _loc9_.setDisplayObject(var_2277);
         }
         var_3150 = _window.findChildByName("creationDate") as ILabelWindow;
         _buttonContainer = _window.findChildByName("buttonContainer") as class_3151;
         _inventory = param5;
         _habboHelp = param6;
         _roomEngine = param7;
         _reportImagebutton = _window.findChildByName("reportButtonContainer") as class_3151;
         _window.procedure = onWindowEvent;
         _window.center();
         _shareArea.visible = false;
         var_1460 = param8;
         hide();
      }
      
      private function get ownHandler() : ExternalImageWidgetHandler
      {
         return var_1453 as ExternalImageWidgetHandler;
      }
      
      public function showWithRoomObject(param1:IRoomObject) : void
      {
         var_2525 = param1.getId();
         var_2127 = param1.getType();
         var_3330 = false;
         _deleteButton.visible = ownHandler.hasRightsToRemove();
         if(getType() == "photo_poster")
         {
            _reportImagebutton.visible = true;
         }
         else
         {
            _reportImagebutton.visible = ownHandler.isSelfieReportingEnabled();
         }
         show(param1.getModel().getString("furniture_data"));
         var _loc2_:Vector.<IRoomObject> = getWallItemsOfCurrentTypeInRoom();
         if(_loc2_.indexOf(param1) != -1)
         {
            var_1708 = _loc2_.indexOf(param1);
         }
      }
      
      public function showWithFurniID(param1:int) : void
      {
         var _loc2_:class_3172 = _inventory.getWallItemById(param1);
         if(_loc2_)
         {
            var_2525 = param1;
            var_2127 = _roomEngine.getWallItemType(_loc2_.type);
            var_3330 = true;
            _deleteButton.visible = false;
            _reportImagebutton.visible = false;
            show(_loc2_.stuffData.getLegacyString());
         }
      }
      
      private function show(param1:String) : void
      {
         if(false)
         {
            return;
         }
         clearImage();
         if(param1 != null)
         {
            readFurniJson(param1);
         }
      }
      
      private function showNext() : void
      {
         var _loc1_:Vector.<IRoomObject> = getWallItemsOfCurrentTypeInRoom();
         if(_loc1_.length > 0)
         {
            var_1708++;
            if(var_1708 > _loc1_.length - 1)
            {
               var_1708 = 0;
            }
            showWithRoomObject(_loc1_[var_1708]);
         }
      }
      
      private function showPrevious() : void
      {
         var _loc1_:Vector.<IRoomObject> = getWallItemsOfCurrentTypeInRoom();
         if(_loc1_.length > 0)
         {
            var_1708--;
            if(var_1708 < 0)
            {
               var_1708 = _loc1_.length - 1;
            }
            showWithRoomObject(_loc1_[var_1708]);
         }
      }
      
      private function getWallItemsOfCurrentTypeInRoom() : Vector.<IRoomObject>
      {
         var _loc2_:Vector.<IRoomObject> = new Vector.<IRoomObject>();
         var _loc3_:Array = _roomEngine.getObjectsByCategory(20);
         for each(var _loc1_ in _loc3_)
         {
            if(_loc1_.getType() == var_2127)
            {
               _loc2_.push(_loc1_);
            }
         }
         return _loc2_;
      }
      
      private function clearImage() : void
      {
         var_2571 = null;
         _caption = "";
         var _loc1_:ITextWindow = _window.findChildByName("captionText") as ITextWindow;
         _loc1_.text = "";
         _senderNameButton.visible = false;
         var_1323 = 0;
         var_3314.caption = "";
         var_2277.text = "";
         var_3150.caption = "";
         var_2210 = null;
         _moderationText.visible = false;
         drawImage(new Bitmap(new BitmapData(-2,-2,false,0)));
      }
      
      private function readFurniJson(param1:String) : void
      {
         try
         {
            var_2571 = new JSONDecoder(param1,false).getValue().id;
            if(var_2571)
            {
               loadExternalData();
               return;
            }
            loadPhoto(param1,getImageUrl(new JSONDecoder(param1,false).getValue()));
         }
         catch(error:Error)
         {
         }
      }
      
      private function getImageUrl(param1:Object) : String
      {
         var _loc3_:String = null;
         var _loc2_:String = getJsonValue(param1,"w","url");
         if(_loc2_.indexOf("http") != 0)
         {
            _loc3_ = "postcards/selfie/";
            if(getType() == "photo_poster")
            {
               _loc3_ = "";
            }
            if(_loc2_.indexOf(".png") == -1)
            {
               _loc2_ += ".png";
            }
            _loc2_ = ownHandler.storiesImageUrlBase + _loc3_ + _loc2_;
         }
         return _loc2_;
      }
      
      private function loadPhoto(param1:String, param2:String) : void
      {
         var _loc8_:Object = null;
         var _loc3_:class_3127 = null;
         var _loc10_:String = null;
         var _loc7_:ITextWindow = null;
         try
         {
            _loc8_ = new JSONDecoder(param1,false).getValue();
         }
         catch(error:Error)
         {
            return;
         }
         if(!param2)
         {
            param2 = getImageUrl(_loc8_);
         }
         var_2790 = new BitmapFileLoader("image/png",new URLRequest(param2));
         var_2790.addEventListener("AssetLoaderEventComplete",onImageLoaded);
         var _loc4_:String = getJsonValue(_loc8_,"n","creator_name");
         var _loc5_:String = getJsonValue(_loc8_,"s","creator_id");
         var _loc11_:String = getJsonValue(_loc8_,"u","unique_id");
         var _loc6_:String = getJsonValue(_loc8_,"t","time");
         var _loc9_:Date = new Date(Number(_loc6_));
         if(_loc4_)
         {
            var_3314.caption = _loc4_;
            _senderNameButton.visible = true;
            var_2277.text = _loc4_;
            var_1323 = int(_loc5_);
            var_3150.caption = _loc9_.date + "-" + (_loc9_.month + 1) + "-" + _loc9_.fullYear;
         }
         if(false && ownHandler.storiesImageShareUrl.length > 4)
         {
            _loc3_ = _window.findChildByName("urlField") as class_3127;
            _loc10_ = ownHandler.storiesImageShareUrl.replace("%id%",_loc11_);
            _loc3_.caption = _loc10_;
            var_2210 = _loc10_;
         }
         _caption = getJsonValue(_loc8_,"m","caption");
         if(_caption)
         {
            (_loc7_ = _window.findChildByName("captionText") as ITextWindow).text = _caption;
         }
      }
      
      private function getJsonValue(param1:Object, param2:String, param3:String = null) : String
      {
         var _loc4_:String = null;
         if(!(_loc4_ = String(param1[param2])) && param3)
         {
            _loc4_ = String(param1[param3]);
         }
         return _loc4_;
      }
      
      private function onImageLoaded(param1:AssetLoaderEvent) : void
      {
         var _loc2_:Bitmap = null;
         if(var_2790)
         {
            _loc2_ = var_2790.content as Bitmap;
            if(_loc2_)
            {
               var_1539.width = _loc2_.width + 2;
               var_1539.height = _loc2_.height + 2;
               drawImage(_loc2_);
            }
         }
      }
      
      private function drawImage(param1:Bitmap) : void
      {
         var_3438 = param1;
         var_1539.bitmap = new BitmapData(var_1539.width,var_1539.height,true,0);
         _window.visible = true;
         var _loc3_:class_3127 = _window.findChildByName("previousButton");
         var _loc2_:class_3127 = _window.findChildByName("nextButton");
         _loc3_.x = 10;
         _bgBorder.y = _bgBorder.x = 0;
         var_1539.x = 20 + _loc3_.width;
         var_1539.y = 71;
         _bgBorder.height = _window.height = NaN;
         var _loc6_:* = NaN + _loc3_.width * 2;
         _window.width = NaN + _loc3_.width * 2;
         _bgBorder.width = _loc6_;
         _senderNameButton.x = 0 - 0 - 3;
         _senderNameButton.y = NaN;
         var_3150.x = NaN;
         var_3150.y = _senderNameButton.y = var_1539.bottom;
         _buttonContainer.y = 0;
         _buttonContainer.x = 0 - 0;
         _loc2_.x = NaN;
         if(var_3330)
         {
            _loc2_.visible = _loc3_.visible = false;
         }
         else
         {
            _loc6_ = getWallItemsOfCurrentTypeInRoom().length > 1;
            _loc3_.visible = getWallItemsOfCurrentTypeInRoom().length > 1;
            _loc2_.visible = _loc6_;
         }
         var _loc4_:Matrix = new Matrix();
         var _loc5_:ColorTransform;
         (_loc5_ = new ColorTransform()).color = 0;
         _loc4_.ty += 1;
         var_1539.bitmap.draw(param1,_loc4_,_loc5_);
         _loc4_.tx += 1;
         _loc4_.ty -= 1;
         var_1539.bitmap.draw(param1,_loc4_,_loc5_);
         _loc4_.ty += 2;
         var_1539.bitmap.draw(param1,_loc4_,_loc5_);
         _loc4_.ty -= 1;
         _loc4_.tx += 1;
         var_1539.bitmap.draw(param1,_loc4_,_loc5_);
         _loc4_.tx -= 1;
         var_1539.bitmap.draw(param1,_loc4_);
         _window.activate();
         updateWindowPosition();
      }
      
      private function loadExternalData() : void
      {
         var _loc2_:String = ownHandler.extraDataServiceUrl + var_2571;
         var _loc1_:URLLoader = new URLLoader(new URLRequest(_loc2_));
         _loc1_.addEventListener("httpStatus",onExternalDataHttpStatus);
         _loc1_.addEventListener("complete",onExternalDataLoaded);
         _loc1_.addEventListener("ioError",onExternalDataError);
      }
      
      private function onExternalDataHttpStatus(param1:HTTPStatusEvent) : void
      {
         if(param1.status == 403 && ownHandler.hasRightsToRemove())
         {
            _moderationText.visible = true;
         }
      }
      
      private function onExternalDataError(param1:Event) : void
      {
         if(true)
         {
            class_14.log("Extra data loading failed: " + param1.toString());
         }
      }
      
      private function onExternalDataLoaded(param1:Event) : void
      {
         var _loc2_:String = String(URLLoader(param1.target).data);
         if(_loc2_.length == 0)
         {
            return;
         }
         loadPhoto(_loc2_,null);
      }
      
      override public function dispose() : void
      {
         if(!_window)
         {
            return;
         }
         var_1539 = null;
         _closeButton = null;
         _bgBorder = null;
         _makeOwnButton = null;
         _deleteButton = null;
         var_2790 = null;
         _inventory = null;
         _habboHelp = null;
         _roomEngine = null;
         var_1323 = 0;
         _senderNameButton = null;
         var_2277 = null;
         _buttonContainer = null;
         _shareArea = null;
         _window.procedure = null;
         _window.dispose();
         var_1460 = null;
         super.dispose();
         if(reportWindow)
         {
            reportWindow.destroy();
         }
      }
      
      public function hide() : void
      {
         _window.visible = false;
      }
      
      private function updateWindowPosition() : void
      {
         if(!var_3438)
         {
            _window.center();
            return;
         }
         var _loc5_:Stage;
         var _loc1_:Number = ((_loc5_ = var_1460.context.displayObjectContainer.stage).stageWidth - 100) / 0;
         var _loc3_:Number = (_loc5_.stageHeight - 200) / 0;
         if(_loc1_ < 1)
         {
            _window.x = 50;
         }
         else
         {
            _window.x = (_loc5_.stageWidth - 0) * 0.5;
         }
         if(_loc3_ < 1)
         {
            _window.y = 50;
         }
         else
         {
            _window.y = (_loc5_.stageHeight - 0) * 0.5;
         }
         var _loc4_:class_3127 = _window.findChildByName("previousButton");
         var _loc2_:class_3127 = _window.findChildByName("nextButton");
         var _loc6_:int = int(var_1460.context.displayObjectContainer.stage.stageHeight);
         if(_bgBorder.height > _loc6_)
         {
            var _loc7_:* = _loc6_ / 2 - _loc4_.height / 2;
            _loc2_.y = _loc6_ / 2 - _loc4_.height / 2;
            _loc4_.y = _loc7_;
         }
         else
         {
            _loc7_ = 0 - _loc4_.height / 2;
            _loc2_.y = 0 - _loc4_.height / 2;
            _loc4_.y = _loc7_;
         }
      }
      
      private function onWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:class_3216 = null;
         var _loc4_:HabboToolbarEvent = null;
         var _loc5_:ITextFieldWindow = null;
         if(param2 == _window)
         {
            var _loc6_:* = param1.type;
            if("WE_PARENT_RESIZED" === _loc6_)
            {
               updateWindowPosition();
            }
         }
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "closebutton":
               hide();
               break;
            case "removebutton":
               _loc3_ = windowManager.confirm(var_44.getLocalization("inventory.remove.external_image_wallitem_header"),var_44.getLocalization("inventory.remove.external_image_wallitem_body"),0,onDeleteConfirm);
               _loc3_.setButtonCaption(16,new AlertDialogCaption(var_44.getLocalization("inventory.remove.external_image_wallitem_delete"),"",true));
               break;
            case "makeOwnButton":
               if(getType() == "photo_poster")
               {
                  (_loc4_ = new HabboToolbarEvent("HTE_ICON_CAMERA")).iconName = "imageWidgetMakeOwn";
                  ownHandler.container.toolbar.events.dispatchEvent(_loc4_);
                  hide();
                  break;
               }
               if(var_1460.getInteger("spaweb",0) == 1)
               {
                  HabboWebTools.openPage("/stories/cards/selfie/edit");
                  break;
               }
               var_1460.context.createLinkEvent("games/play/elisa_habbo_stories?ref=btn_selfie_myo");
               break;
            case "shareButton":
               _shareArea.visible = true;
               HabboTracking.getInstance().trackEventLog("Stories","shareopened","stories.share.clicked",var_2127);
               break;
            case "twitterShare":
               navigateToURL(new URLRequest("http://www.twitter.com/share?url=" + var_2210),"_blank");
               HabboTracking.getInstance().trackEventLog("Stories","twitter","stories.share.clicked",var_2127);
               break;
            case "fbShare":
               navigateToURL(new URLRequest("https://www.facebook.com/sharer/sharer.php?u=" + var_2210),"_blank");
               HabboTracking.getInstance().trackEventLog("Stories","facebook","stories.share.clicked",var_2127);
               break;
            case "senderNameButton":
               ownHandler.sendMessage(new class_313(var_1323));
               break;
            case "urlField":
               (_loc5_ = _window.findChildByName("urlField") as ITextFieldWindow).setSelection(0,_loc5_.length);
               HabboTracking.getInstance().trackEventLog("Stories","fieldselected","stories.share.clicked",var_2127);
               break;
            case "reportButton":
               openReportImage();
               break;
            case "nextButton":
               showNext();
               break;
            case "previousButton":
               showPrevious();
         }
      }
      
      private function onClickModerationInfoLink(param1:WindowLinkEvent) : void
      {
         if(param1 != null && !StringUtil.isBlank(param1.link))
         {
            navigateToURL(new URLRequest(param1.link),"_blank");
         }
      }
      
      private function openReportImage() : void
      {
         _habboHelp.startPhotoReportingInNewCfhFlow(var_1323,var_3314.caption,var_2571,var_2525);
      }
      
      private function getType() : String
      {
         switch(var_2127)
         {
            case "external_image_wallitem_poster":
            case "external_image_wallitem_poster_small":
               break;
            case "external_image_wallitem":
               return "selfie";
            default:
               return "legacy";
         }
         return "photo_poster";
      }
      
      private function onReportWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = 0;
         var _loc9_:class_3127 = null;
         var _loc8_:ISelectableWindow = null;
         var _loc6_:String = null;
         var _loc4_:class_3127 = null;
         var _loc7_:IIlluminaInputWidget = null;
         var _loc5_:Boolean = false;
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
               reportWindow.destroy();
               break;
            case "report_confirm":
               _loc3_ = 0;
               if((_loc9_ = reportWindow.findChildByName("reporting_reason")) != null)
               {
                  if((_loc8_ = ISelectorWindow(_loc9_).getSelected()) != null)
                  {
                     _loc3_ = int(_loc8_.name);
                  }
               }
               _loc6_ = null;
               if((_loc4_ = reportWindow.findChildByName("input_widget")) != null)
               {
                  _loc6_ = (_loc7_ = (_loc4_ as class_3217).widget as IIlluminaInputWidget).message;
               }
               if(!var_2210)
               {
                  var_2210 = "url not available";
               }
               if(getType() == "photo_poster")
               {
                  _loc5_ = _habboHelp.reportPhoto(var_2571,_loc3_,_roomEngine.activeRoomId,var_1323,var_2525);
               }
               else
               {
                  _loc5_ = _habboHelp.reportSelfie(var_2210,_loc6_,_roomEngine.activeRoomId,var_1323,var_2525);
               }
               if(_loc5_)
               {
                  reportWindow.destroy();
                  break;
               }
         }
      }
      
      private function onDeleteConfirm(param1:class_3216, param2:class_3134) : void
      {
         param1.dispose();
         if(param2.type == "WE_OK")
         {
            ownHandler.deleteCard(var_2525);
         }
      }
   }
}
