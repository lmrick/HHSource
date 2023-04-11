package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;
   import com.sulake.habbo.window.widgets.class_3308;
   import com.sulake.habbo.window.widgets.class_3366;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import package_13.class_282;
   
   public class InfoStandRentableBotView
   {
      
      private static const STATUS_BAR_WIDTH:int = 162;
      
      private static const STATUS_BAR_HEIGHT:int = 16;
      
      private static const ITEM_SPACER:int = 5;
      
      private static const STATUS_BAR_HIGHLIGHT_HEIGHT:int = 4;
      
      private static const STATUS_BAR_BORDER_COLOR:uint = 14342874;
      
      private static const STATUS_BAR_BG_COLOR:uint = 3815994;
      
      private static const STATUS_BAR_EXPIRE_HIGHLIGHT_COLOR:uint = 2085362;
      
      private static const STATUS_BAR_EXPIRE_CONTENT_COLOR:uint = 39616;
      
      private static const FIELD_NAME:String = "name_text";
      
      private static const FIELD_DESCRIPTION:String = "description_text";
      
      private static const FIELD_HAND_ITEM:String = "handitem_text";
      
      private static const FIELD_OWNER:String = "owner_text";
      
      private static const FIELD_EXPIRE_TIME:String = "expire_time_left";
      
      private static const FIELD_EXPIRE_HEADER:String = "expire_time_info";
      
      private static const const_1000:String = "handitem_spacer";
      
      private static const BUTTONS_MAX_WIDTH:int = 250;
      
      private static const BUTTON_HEIGHT:int = 25;
      
      private static const BUTTON_MARGIN:int = 5;
       
      
      private var _catalog:IHabboCatalog;
      
      private var _habboTracking:class_1693;
      
      private var var_1429:com.sulake.habbo.ui.widget.infostand.InfoStandWidget;
      
      private var _window:IItemListWindow;
      
      private var var_1438:class_3213;
      
      private var _buttonsContainer:class_3151;
      
      private var var_1496:IItemListWindow;
      
      private var var_484:String;
      
      private var var_341:int;
      
      private var _disposed:Boolean;
      
      public function InfoStandRentableBotView(param1:com.sulake.habbo.ui.widget.infostand.InfoStandWidget, param2:String, param3:IHabboCatalog)
      {
         super();
         var_1429 = param1;
         _catalog = param3;
         _habboTracking = HabboTracking.getInstance();
         createWindow(param2);
      }
      
      public function dispose() : void
      {
         var_1429 = null;
         _catalog = null;
         _habboTracking = null;
         var_1438 = null;
         _buttonsContainer = null;
         var_1496 = null;
         if(_window)
         {
            _window.dispose();
         }
         _window = null;
         _disposed = true;
      }
      
      public function get window() : IItemListWindow
      {
         return _window;
      }
      
      private function updateWindow() : void
      {
         if(var_1496 == null || var_1438 == null || _buttonsContainer == null)
         {
            return;
         }
         _buttonsContainer.width = _buttonsContainer.width;
         _buttonsContainer.visible = false;
         var_1496.height = var_1496.scrollableRegion.height;
         var_1438.height = NaN;
         _window.width = Math.max(var_1438.width,_buttonsContainer.width);
         _window.height = _window.scrollableRegion.height;
         if(false)
         {
            var_1438.x = 0 - 0;
            _buttonsContainer.x = 0;
         }
         else
         {
            _buttonsContainer.x = 0 - 0;
            var_1438.x = 0;
         }
         var_1429.refreshContainer();
      }
      
      public function update(param1:RoomWidgetRentableBotInfoUpdateEvent) : void
      {
         var_341 = param1.webID;
         setFieldText("name_text",true,param1.name);
         setFieldText("description_text",true,param1.motto);
         if(param1.ownerId > -1)
         {
            var_1429.localizations.registerParameter("infostand.text.botowner","name",param1.ownerName);
            setFieldText("owner_text",true,var_1429.localizations.getLocalization("infostand.text.botowner"));
         }
         else
         {
            setFieldText("owner_text",false,"");
         }
         updateRentExpireField();
         setCarryItem(param1.carryItem);
         var _loc2_:Array = param1.badges;
         setBadge(_loc2_ && _loc2_.length > 0 ? _loc2_[0] : null);
         setFigure(param1.figure);
         showButton("whisper",false);
         showButton("ignore",false);
         showButton("unignore",false);
         showButton("pick",param1.ownerId > -1 && (param1.amIOwner || param1.amIAnyRoomController));
         updateWindow();
      }
      
      private function updateRentExpireField() : void
      {
         setFieldText("expire_time_left",false,"N/A");
         setFieldText("expire_time_info",false,"");
      }
      
      public function setCarryItem(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc6_:ITextWindow = var_1496.getListItemByName("handitem_text") as ITextWindow;
         var _loc3_:class_3151 = var_1496.getListItemByName("handitem_spacer") as class_3151;
         if(_loc6_ == null || _loc3_ == null)
         {
            return;
         }
         if(param1 > 0 && param1 < 999999)
         {
            _loc2_ = String(var_1429.localizations.getLocalization("handitem" + param1,"handitem" + param1));
            var_1429.localizations.registerParameter("infostand.text.handitem","item",_loc2_);
         }
         _loc6_.height = _loc6_.textHeight + 5;
         var _loc4_:Boolean = Boolean(_loc6_.visible);
         var _loc5_:Boolean = param1 > 0 && param1 < 999999;
         _loc6_.visible = _loc5_;
         _loc3_.visible = _loc5_;
         if(_loc5_ != _loc4_)
         {
            var_1496.arrangeListItems();
         }
         updateWindow();
      }
      
      private function createPercentageBar(param1:int, param2:int, param3:uint, param4:uint) : BitmapData
      {
         param2 = Math.max(param2,1);
         param1 = Math.max(param1,0);
         if(param1 > param2)
         {
            param1 = param2;
         }
         var _loc10_:Number = param1 / param2;
         var _loc7_:BitmapData;
         (_loc7_ = new BitmapData(162,16,false)).fillRect(new Rectangle(0,0,_loc7_.width,_loc7_.height),14342874);
         var _loc8_:Rectangle = new Rectangle(1,1,_loc7_.width - 2,_loc7_.height - 2);
         _loc7_.fillRect(_loc8_,3815994);
         var _loc6_:Rectangle;
         (_loc6_ = new Rectangle(1,5,_loc7_.width - 2,_loc7_.height - 2 - 4)).width = _loc10_ * _loc6_.width;
         _loc7_.fillRect(_loc6_,param3);
         var _loc5_:Rectangle;
         (_loc5_ = new Rectangle(1,1,_loc7_.width - 2,4)).width = _loc10_ * _loc5_.width;
         _loc7_.fillRect(_loc5_,param4);
         return _loc7_;
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc5_:XmlAsset = var_1429.assets.getAssetByName("rentable_bot_view") as XmlAsset;
         _window = var_1429.windowManager.buildFromXML(_loc5_.content as XML) as IItemListWindow;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var_1438 = _window.getListItemByName("info_border") as class_3213;
         if(var_1438 != null)
         {
            var_1496 = var_1438.findChildByName("infostand_element_list") as IItemListWindow;
         }
         _window.name = param1;
         var_1429.mainContainer.addChild(_window);
         var _loc4_:class_3127;
         if((_loc4_ = var_1438.findChildByTag("close")) != null)
         {
            _loc4_.addEventListener("WME_CLICK",onClose);
         }
         _buttonsContainer = _window.getListItemByName("button_list") as class_3151;
         if(_buttonsContainer == null)
         {
            return;
         }
         var _loc3_:* = [];
         _buttonsContainer.groupChildrenWithTag("CMD_BUTTON",_loc3_,-1);
         for each(var _loc2_ in _loc3_)
         {
            _loc2_.addEventListener("WME_CLICK",onButtonClicked);
         }
         for each(var _loc6_ in _loc3_)
         {
            if(_loc6_.parent)
            {
               _loc6_.parent.width = _loc6_.width;
            }
            _loc6_.addEventListener("WE_RESIZED",onButtonResized);
         }
      }
      
      private function setFieldText(param1:String, param2:Boolean, param3:String) : void
      {
         var _loc5_:class_3151 = null;
         if(var_1496 == null)
         {
            return;
         }
         var _loc4_:ITextWindow;
         if((_loc4_ = var_1496.getListItemByName(param1) as ITextWindow) == null)
         {
            if((_loc5_ = var_1496.getListItemByName("description_container") as class_3151) == null)
            {
               return;
            }
            if(!(_loc4_ = _loc5_.findChildByName(param1) as ITextWindow))
            {
               return;
            }
         }
         _loc4_.text = param3;
         _loc4_.visible = param2;
      }
      
      private function setFigure(param1:String) : void
      {
         var _loc2_:class_3308 = class_3217(var_1438.findChildByName("avatar_image")).widget as class_3308;
         _loc2_.figure = param1;
      }
      
      private function setBadge(param1:String) : void
      {
         var _loc2_:class_3366 = class_3217(var_1438.findChildByName("badge")).widget as class_3366;
         _loc2_.badgeId = param1;
      }
      
      protected function onButtonClicked(param1:WindowMouseEvent) : void
      {
         if(param1.target.name == "pick")
         {
            var_1429.handler.container.connection.send(new class_282(var_341));
         }
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         var_1429.close();
      }
      
      protected function showButton(param1:String, param2:Boolean) : void
      {
         if(_buttonsContainer == null)
         {
            return;
         }
         var _loc3_:class_3127 = _buttonsContainer.getChildByName(param1);
         if(_loc3_ != null)
         {
            _loc3_.visible = param2;
            arrangeButtons();
         }
      }
      
      protected function onButtonResized(param1:class_3134) : void
      {
         var _loc2_:class_3127 = param1.window.parent;
         if(_loc2_ && _loc2_.tags.indexOf("CMD_BUTTON_REGION") > -1)
         {
            _loc2_.width = param1.window.width;
         }
      }
      
      private function arrangeButtons() : void
      {
         _buttonsContainer.width = 250;
         var _loc2_:* = [];
         _buttonsContainer.groupChildrenWithTag("CMD_BUTTON_REGION",_loc2_,-1);
         var _loc1_:int = 250;
         var _loc3_:int = 0;
         for each(var _loc4_ in _loc2_)
         {
            if(_loc4_.visible)
            {
               if(_loc1_ - _loc4_.width < 0)
               {
                  _loc1_ = 250;
                  _loc3_ += 30;
               }
               _loc4_.x = _loc1_ - _loc4_.width;
               _loc4_.y = _loc3_;
               _loc1_ = _loc4_.x - 5;
            }
         }
         _buttonsContainer.height = _loc3_ + 25;
         updateWindow();
      }
   }
}
