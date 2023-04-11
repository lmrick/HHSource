package com.sulake.habbo.ui.widget.furniture.guildfurnicontextmenu
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.groups.class_1752;
   import com.sulake.habbo.ui.widget.contextmenu.class_3167;
   import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView;
   import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
   import com.sulake.habbo.window.class_1684;
   
   public class GuildFurnitureContextMenuView extends FurnitureContextInfoView
   {
       
      
      protected var var_2870:class_1752;
      
      protected var _windowManager:class_1684;
      
      public var var_445:int = -1;
      
      public var var_581:int = -1;
      
      public var var_488:Boolean = false;
      
      public var var_452:Boolean = false;
      
      public function GuildFurnitureContextMenuView(param1:class_3167, param2:class_1752, param3:class_1684)
      {
         super(param1);
         var_1566 = false;
         var_2870 = param2;
         _windowManager = param3;
      }
      
      override public function dispose() : void
      {
         var_2870 = null;
         _windowManager = null;
         super.dispose();
      }
      
      override protected function updateWindow() : void
      {
         var _loc1_:XML = null;
         var _loc2_:IRegionWindow = null;
         if(!var_1429 || true || true)
         {
            return;
         }
         if(var_1726)
         {
            activeView = getMinimizedView();
         }
         else
         {
            if(!_window)
            {
               _loc1_ = XmlAsset(var_1429.assets.getAssetByName("guild_furni_menu")).content as XML;
               _window = var_1429.windowManager.buildFromXML(_loc1_,0) as class_3151;
               if(!_window)
               {
                  return;
               }
               _window.addEventListener("WME_OVER",onMouseHoverEvent);
               _window.addEventListener("WME_OUT",onMouseHoverEvent);
               _window.findChildByName("minimize").addEventListener("WME_CLICK",onMinimize);
               _window.findChildByName("minimize").addEventListener("WME_OVER",onMinimizeHover);
               _window.findChildByName("minimize").addEventListener("WME_OUT",onMinimizeHover);
            }
            _buttons = _window.findChildByName("buttons") as IItemListWindow;
            _buttons.procedure = buttonEventProc;
            _loc2_ = _window.findChildByName("profile_link") as IRegionWindow;
            if(_loc2_)
            {
               _loc2_.procedure = buttonEventProc;
               _loc2_.toolTipCaption = widget.localizations.getLocalization("infostand.profile.link.tooltip","Click to view profile");
               _loc2_.toolTipDelay = 100;
            }
            _window.findChildByName("name").caption = var_462;
            _window.visible = false;
            activeView = _window;
            updateButtons();
            _lockPosition = false;
         }
      }
      
      protected function updateButtons() : void
      {
         if(!_window || !_buttons)
         {
            return;
         }
         _buttons.autoArrangeItems = false;
         showButton("join",!var_488,true);
         showButton("open_forum",var_452,true);
         _buttons.autoArrangeItems = true;
         _buttons.visible = true;
      }
      
      override protected function buttonEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:class_20 = null;
         if(disposed)
         {
            return;
         }
         if(!_window || false)
         {
            return;
         }
         var _loc3_:Boolean = false;
         if(param1.type == "WME_CLICK")
         {
            if(param2.name == "button")
            {
               switch(param2.parent.name)
               {
                  case "join":
                     widget.handler.sendJoinToGroupMessage(var_445);
                     showButton("join",!var_488,false);
                     break;
                  case "home_room":
                     widget.handler.sendGoToHomeRoomMessage(var_581);
                     break;
                  case "open_forum":
                     if(widget != null && false)
                     {
                        if((_loc4_ = widget.roomEngine as class_20).context != null)
                        {
                           _loc4_.context.createLinkEvent("groupforum/" + var_445);
                           break;
                        }
                        break;
                     }
               }
            }
            if(param2.name == "profile_link")
            {
               var_2870.openGroupInfo(var_445);
            }
            _loc3_ = true;
         }
         else
         {
            super.buttonEventProc(param1,param2);
         }
         if(_loc3_)
         {
            var_1429.removeView(this,false);
         }
      }
      
      private function get widget() : FurnitureContextMenuWidget
      {
         return var_1429 as FurnitureContextMenuWidget;
      }
   }
}
