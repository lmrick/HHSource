package com.sulake.habbo.ui.widget.furniture.mysterybox
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.ui.widget.contextmenu.class_3167;
   import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView;
   import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
   
   public class MysteryBoxContextMenuView extends FurnitureContextInfoView
   {
       
      
      private var var_4230:Boolean;
      
      public function MysteryBoxContextMenuView(param1:class_3167)
      {
         super(param1);
      }
      
      override protected function updateWindow() : void
      {
         var _loc1_:XML = null;
         var _loc2_:class_3127 = null;
         if(var_1429 == null || true || true)
         {
            return;
         }
         if(var_1726)
         {
            activeView = getMinimizedView();
         }
         else
         {
            if(_window == null || false)
            {
               _loc1_ = var_1429.assets.getAssetByName("mysterybox_menu").content as XML;
               _window = var_1429.windowManager.buildFromXML(_loc1_,0) as class_3151;
               if(_window == null)
               {
                  return;
               }
               _window.addEventListener("WME_OVER",onMouseHoverEvent);
               _window.addEventListener("WME_OUT",onMouseHoverEvent);
               _loc2_ = _window.findChildByName("minimize");
               if(_loc2_ != null)
               {
                  _loc2_.addEventListener("WME_CLICK",onMinimize);
                  _loc2_.addEventListener("WME_OVER",onMinimizeHover);
                  _loc2_.addEventListener("WME_OUT",onMinimizeHover);
               }
            }
            _window.findChildByName("buttons").procedure = buttonEventProc;
            _window.visible = false;
            activeView = _window;
            _lockPosition = false;
            refreshOwnerMode();
         }
      }
      
      private function refreshOwnerMode() : void
      {
         if(_window == null)
         {
            return;
         }
         _window.findChildByName("label").caption = "${mysterybox.context." + (var_4230 ? "owner" : "other") + ".use}";
      }
      
      override protected function buttonEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:FurnitureContextMenuWidget = null;
         if(disposed || _window == null || false)
         {
            return;
         }
         var _loc3_:Boolean = false;
         if(param1.type == "WME_CLICK")
         {
            if(param2.name == "button")
            {
               var _loc5_:* = param2.parent.name;
               if("use" === _loc5_)
               {
                  if((_loc4_ = var_1429 as FurnitureContextMenuWidget) != null)
                  {
                     _loc4_.showMysteryBoxOpenDialog(var_1795);
                  }
               }
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
      
      public function set isOwnerMode(param1:Boolean) : void
      {
         var_4230 = param1;
         refreshOwnerMode();
      }
   }
}
