package com.sulake.habbo.ui.widget.furniture.contextmenu
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.ui.widget.contextmenu.class_3167;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniActionMessage;
   
   public class GenericUsableFurnitureContextMenuView extends FurnitureContextInfoView
   {
       
      
      private var var_907:int;
      
      public function GenericUsableFurnitureContextMenuView(param1:class_3167)
      {
         super(param1);
      }
      
      override protected function updateWindow() : void
      {
         var _loc1_:XML = null;
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
               _loc1_ = XmlAsset(var_1429.assets.getAssetByName("generic_usable_menu")).content as XML;
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
            _window.findChildByName("furni_name").caption = "${furni.generic_usable.name}";
            _window.findChildByName("buttons").procedure = buttonEventProc;
            _window.visible = false;
            activeView = _window;
            _lockPosition = false;
         }
      }
      
      override protected function buttonEventProc(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || !_window || false)
         {
            return;
         }
         var _loc3_:Boolean = false;
         if(param1.type == "WME_CLICK")
         {
            if(param2.name == "button")
            {
               var _loc4_:* = param2.parent.name;
               if("use" === _loc4_)
               {
                  var_1429.messageListener.processWidgetMessage(new RoomWidgetFurniActionMessage("RWFAM_USE",var_1795.getId(),var_907));
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
      
      public function set objectCategory(param1:int) : void
      {
         var_907 = param1;
      }
   }
}
