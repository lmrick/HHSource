package com.sulake.habbo.ui.widget.furniture.clothingchange
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetClothingChangeUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetClothingChangeMessage;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   
   public class ClothingChangeFurnitureWidget extends RoomWidgetBase
   {
      
      private static const const_682:String = "Boy";
      
      private static const const_931:String = "Girl";
       
      
      private var var_1915:class_3151;
      
      private var var_347:int = 0;
      
      private var var_907:int = 0;
      
      private var var_354:int = 0;
      
      public function ClothingChangeFurnitureWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21 = null, param4:class_18 = null)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         hideGenderSelectionInterface();
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWCCUE_SHOW_GENDER_SELECTION",onUpdate);
         param1.addEventListener("RWCCUE_SHOW_CLOTHING_EDITOR",onUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWCCUE_SHOW_GENDER_SELECTION",onUpdate);
         param1.removeEventListener("RWCCUE_SHOW_CLOTHING_EDITOR",onUpdate);
      }
      
      private function onUpdate(param1:RoomWidgetClothingChangeUpdateEvent) : void
      {
         var _loc2_:* = param1.type;
         if("RWCCUE_SHOW_GENDER_SELECTION" === _loc2_)
         {
            showGenderSelectionInterface(param1);
         }
      }
      
      private function showGenderSelectionInterface(param1:RoomWidgetClothingChangeUpdateEvent) : void
      {
         hideGenderSelectionInterface();
         var_347 = param1.objectId;
         var_907 = param1.objectCategory;
         var_354 = param1.roomId;
         var _loc4_:IAsset = assets.getAssetByName("boygirl");
         var _loc2_:XmlAsset = XmlAsset(_loc4_);
         if(_loc2_ == null)
         {
            return;
         }
         var_1915 = windowManager.createWindow("clothing change gender selection","",4,0,163841,new Rectangle(100,100,200,200),null,0) as class_3151;
         var_1915.buildFromXML(XML(_loc2_.content));
         var_1915.addEventListener("WME_CLICK",onGenderSelectionMouseEvent);
         var_1915.center();
         var _loc3_:class_3127 = var_1915.findChildByTag("close");
         if(_loc3_ != null)
         {
            _loc3_.procedure = onGenderSelectionWindowClose;
         }
         _loc3_ = var_1915.findChildByName("Boy");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener("WME_CLICK",onGenderSelectionMouseEvent);
         }
         _loc3_ = var_1915.findChildByName("Girl");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener("WME_CLICK",onGenderSelectionMouseEvent);
         }
      }
      
      private function hideGenderSelectionInterface() : void
      {
         if(var_1915 != null)
         {
            var_1915.dispose();
            var_1915 = null;
         }
      }
      
      private function onGenderSelectionWindowClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         hideGenderSelectionInterface();
      }
      
      private function onGenderSelectionMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:class_3127 = param1.target as class_3127;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "Boy":
               requestEditor("M");
               hideGenderSelectionInterface();
               break;
            case "Girl":
               requestEditor("F");
               hideGenderSelectionInterface();
               break;
            case "close":
            case "close_btn":
               hideGenderSelectionInterface();
         }
      }
      
      private function requestEditor(param1:String) : void
      {
         var _loc2_:RoomWidgetClothingChangeMessage = new RoomWidgetClothingChangeMessage("RWCCM_REQUEST_EDITOR",param1,var_347,var_907,var_354);
         messageListener.processWidgetMessage(_loc2_);
      }
   }
}
