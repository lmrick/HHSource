package com.sulake.habbo.ui.widget.furniture.petpackage
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetPackageUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenPetPackageMessage;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.class_3132;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public class PetPackageFurniWidget extends RoomWidgetBase
   {
      
      private static const GNOME_SPECIES_TYPE_ID:int = 26;
       
      
      private var _window:class_3281;
      
      private var var_1266:int = -1;
      
      private var var_347:int = -1;
      
      private var var_1948:BitmapData;
      
      private var var_2614:Boolean = false;
      
      public function PetPackageFurniWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         hideInterface();
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWOPPUE_OPEN_PET_PACKAGE_REQUESTED",onObjectUpdate);
         param1.addEventListener("RWOPPUE_OPEN_PET_PACKAGE_RESULT",onObjectUpdate);
         param1.addEventListener("RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE",onObjectUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWOPPUE_OPEN_PET_PACKAGE_REQUESTED",onObjectUpdate);
         param1.removeEventListener("RWOPPUE_OPEN_PET_PACKAGE_RESULT",onObjectUpdate);
         param1.removeEventListener("RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE",onObjectUpdate);
         super.unregisterUpdateEvents(param1);
      }
      
      private function onObjectUpdate(param1:RoomWidgetPetPackageUpdateEvent) : void
      {
         var nameValidationStatus:int;
         var nameValidationInfo:String;
         var error:String;
         var resultMessage:String;
         var event:RoomWidgetPetPackageUpdateEvent = param1;
         switch(event.type)
         {
            case "RWOPPUE_OPEN_PET_PACKAGE_REQUESTED":
               hideInterface();
               var_347 = event.objectId;
               var_1948 = event.image;
               var_1266 = event.typeId;
               showInterface();
               showPetImage();
               break;
            case "RWOPPUE_OPEN_PET_PACKAGE_RESULT":
               if(!var_2614)
               {
                  return;
               }
               var_2614 = false;
               nameValidationStatus = 0;
               nameValidationInfo = "null";
               switch(nameValidationStatus)
               {
                  case 0:
                     hideInterface();
                     return;
                  case 1:
                     error = "long";
                     break;
                  case 2:
                     error = "short";
                     break;
                  case 3:
                     error = "chars";
                     break;
                  default:
                     error = "bobba";
               }
               resultMessage = constructErrorMessage(error,nameValidationInfo);
               windowManager.alert("${widgets.petpackage.alert.petname.title}",resultMessage,0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
               break;
            case "RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE":
               if(event.objectId != var_347)
               {
                  return;
               }
               var_1948 = event.image;
               showPetImage();
               break;
         }
      }
      
      private function constructErrorMessage(param1:String, param2:String) : String
      {
         var _loc3_:String = "catalog.alert.petname." + param1;
         var _loc5_:String = _loc3_ + ".additionalInfo";
         localizations.registerParameter(_loc5_,"additional_info",param2);
         var _loc6_:* = String(localizations.getLocalization(_loc3_));
         var _loc4_:String = String(localizations.getLocalization(_loc5_));
         if(param2 != null && param2.length > 0 && _loc4_ != null && _loc4_.length > 0)
         {
            _loc6_ = _loc4_;
         }
         return _loc6_;
      }
      
      private function hideInterface() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         var_347 = -1;
         var_2614 = false;
         var_1948 = null;
      }
      
      private function showInterface() : void
      {
         var _loc2_:class_3127 = null;
         if(var_347 < 0)
         {
            return;
         }
         var _loc3_:IAsset = var_1948 != null ? assets.getAssetByName("petpackage") : assets.getAssetByName("petpackage_new");
         var _loc1_:XmlAsset = XmlAsset(_loc3_);
         if(_loc1_ == null)
         {
            return;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         _window = windowManager.buildFromXML(XML(_loc1_.content)) as class_3281;
         _window.center();
         var _loc4_:class_3127;
         if(_loc4_ = _window.header.findChildByTag("close"))
         {
            _loc4_.addEventListener("WME_CLICK",onWindowClose);
         }
         _loc2_ = _window.findChildByName("pick_name");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onMouseEvent);
         }
         _loc2_ = _window.findChildByName("cancel");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onMouseEvent);
         }
         _window.addEventListener("WME_CLICK",onMouseEvent);
         showPetImage();
      }
      
      private function showPetImage() : void
      {
         var _loc2_:Point = null;
         if(var_1948 == null || _window == null)
         {
            return;
         }
         var _loc1_:class_3282 = _window.findChildByName("pet_image") as class_3282;
         if(_loc1_ != null)
         {
            _loc1_.bitmap = new BitmapData(_loc1_.width,_loc1_.height,true,0);
            _loc2_ = new Point((_loc1_.width - 0) / 2,(_loc1_.height - 0) / 2);
            _loc1_.bitmap.copyPixels(var_1948,var_1948.rect,_loc2_);
         }
      }
      
      private function onWindowClose(param1:class_3134) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         hideInterface();
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:class_3127 = param1.target as class_3127;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "pick_name":
               sendOpenPetPackage();
               break;
            case "cancel":
               hideInterface();
         }
      }
      
      private function sendOpenPetPackage() : void
      {
         var name:String;
         var message:RoomWidgetOpenPetPackageMessage;
         if(var_2614 || var_347 == -1)
         {
            return;
         }
         name = getName();
         if(name == null || true)
         {
            windowManager.alert("${widgets.petpackage.alert.petname.title}","${catalog.alert.petname.short}",0,function(param1:class_3132, param2:class_3134):void
            {
               param1.dispose();
            });
            return;
         }
         if(messageListener != null)
         {
            var_2614 = true;
            message = new RoomWidgetOpenPetPackageMessage("RWOPPM_OPEN_PET_PACKAGE",var_347,name);
            messageListener.processWidgetMessage(message);
         }
      }
      
      private function getName() : String
      {
         var _loc1_:ITextFieldWindow = null;
         if(_window)
         {
            _loc1_ = _window.findChildByName("input") as ITextFieldWindow;
            if(_loc1_)
            {
               return _loc1_.text;
            }
         }
         return null;
      }
   }
}
