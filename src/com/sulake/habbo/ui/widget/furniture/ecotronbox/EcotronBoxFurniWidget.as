package com.sulake.habbo.ui.widget.furniture.ecotronbox
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetEcotronBoxDataUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPresentDataUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetEcotronBoxOpenMessage;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class EcotronBoxFurniWidget extends RoomWidgetBase
   {
      
      private static const const_782:Number = 100;
      
      private static const const_693:Number = 100;
       
      
      private var _window:class_3151;
      
      private var var_347:int = -1;
      
      private var _text:String;
      
      private var var_282:Boolean;
      
      private var var_1692:Boolean = false;
      
      private var _furniTypeName:String = "ecotron_box";
      
      private var _interfaceMapByFurniTypeName:class_24;
      
      public function EcotronBoxFurniWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21 = null)
      {
         _interfaceMapByFurniTypeName = new class_24();
         super(param1,param2,param3);
         _interfaceMapByFurniTypeName.add("","ecotronbox_card");
         _interfaceMapByFurniTypeName.add("ecotron_box","ecotronbox_card");
         _interfaceMapByFurniTypeName.add("matic_box","ecotronbox_card_furnimatic");
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
         param1.addEventListener("RWEBDUE_PACKAGEINFO",onObjectUpdate);
         param1.addEventListener("RWEBDUE_CONTENTS",onObjectUpdate);
         param1.addEventListener("RWROUE_FURNI_REMOVED",onRoomObjectRemoved);
         param1.addEventListener("RWPDUE_PACKAGEINFO",onPresentUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWEBDUE_PACKAGEINFO",onObjectUpdate);
         param1.removeEventListener("RWEBDUE_CONTENTS",onObjectUpdate);
         param1.removeEventListener("RWPDUE_PACKAGEINFO",onPresentUpdate);
         param1.removeEventListener("RWROUE_FURNI_REMOVED",onRoomObjectRemoved);
      }
      
      private function onObjectUpdate(param1:RoomWidgetEcotronBoxDataUpdateEvent) : void
      {
         hideInterface();
         switch(param1.type)
         {
            case "RWEBDUE_PACKAGEINFO":
               var_1692 = false;
               var_347 = param1.objectId;
               _text = param1.text;
               var_282 = param1.controller;
               _furniTypeName = param1.furniTypeName;
               showInterface();
               break;
            case "RWEBDUE_CONTENTS":
               if(!var_1692)
               {
                  return;
               }
               var_347 = param1.objectId;
               showInterface();
               showIcon(param1.iconBitmapData);
               showDescription(param1.text);
               setOpenButton(false);
               break;
         }
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         if(param1.id == var_347)
         {
            hideInterface();
         }
      }
      
      private function onPresentUpdate(param1:RoomWidgetPresentDataUpdateEvent) : void
      {
         var _loc2_:* = param1.type;
         if("RWPDUE_PACKAGEINFO" === _loc2_)
         {
            hideInterface();
         }
      }
      
      private function showIcon(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            param1 = new BitmapData(1,1);
         }
         if(_window == null)
         {
            return;
         }
         var _loc4_:class_3282;
         if((_loc4_ = _window.findChildByName("ecotronbox_card_preview") as class_3282) == null)
         {
            return;
         }
         var _loc2_:int = (_loc4_.width - param1.width) / 2;
         var _loc3_:int = (_loc4_.height - param1.height) / 2;
         if(_loc4_.bitmap == null)
         {
            _loc4_.bitmap = new BitmapData(_loc4_.width,_loc4_.height,true,16777215);
         }
         _loc4_.bitmap.fillRect(_loc4_.bitmap.rect,16777215);
         _loc4_.bitmap.copyPixels(param1,param1.rect,new Point(_loc2_,_loc3_),null,null,false);
      }
      
      private function showDescription(param1:String) : void
      {
         var _loc2_:ITextWindow = null;
         _loc2_ = _window.findChildByName("ecotronbox_card_msg") as ITextWindow;
         if(_loc2_ != null && param1 != null)
         {
            _loc2_.caption = param1;
         }
      }
      
      private function showInterface() : void
      {
         var _loc3_:ITextWindow = null;
         var _loc2_:class_3127 = null;
         if(var_347 < 0)
         {
            return;
         }
         var _loc4_:IAsset = assets.getAssetByName(_interfaceMapByFurniTypeName.getValue(_furniTypeName));
         var _loc1_:XmlAsset = XmlAsset(_loc4_);
         if(_loc1_ == null)
         {
            return;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         _window = windowManager.createWindow("ecotronboxcardui_container","",4,0,131073,new Rectangle(100,100,2,2),null,0) as class_3151;
         _window.buildFromXML(XML(_loc1_.content));
         _loc3_ = _window.findChildByName("ecotronbox_card_date") as ITextWindow;
         if(_loc3_ != null && _text != null)
         {
            _loc3_.caption = _text;
         }
         _loc2_ = _window.findChildByName("ecotronbox_card_btn_close");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onMouseEvent);
         }
         setOpenButton(true);
      }
      
      private function setOpenButton(param1:Boolean) : void
      {
         var _loc2_:class_3127 = null;
         if(_window == null)
         {
            return;
         }
         _loc2_ = _window.findChildByName("ecotronbox_card_btn_open");
         if(_loc2_ != null)
         {
            if(var_282 && param1)
            {
               _loc2_.visible = true;
               _loc2_.addEventListener("WME_CLICK",onMouseEvent);
            }
            else
            {
               _loc2_.visible = false;
            }
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
         var _loc1_:RoomWidgetEcotronBoxOpenMessage = null;
         if(var_1692 || var_347 == -1 || !var_282)
         {
            return;
         }
         var_1692 = true;
         if(messageListener != null)
         {
            _loc1_ = new RoomWidgetEcotronBoxOpenMessage("RWEBOM_OPEN_ECOTRONBOX",var_347);
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:class_3127 = param1.target as class_3127;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "ecotronbox_card_btn_open":
               sendOpen();
               break;
            case "ecotronbox_card_btn_close":
            default:
               var_1692 = false;
               hideInterface();
         }
      }
   }
}
