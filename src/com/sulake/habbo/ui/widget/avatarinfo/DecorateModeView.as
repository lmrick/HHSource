package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.class_3134;
   
   public class DecorateModeView extends AvatarContextInfoButtonView
   {
       
      
      public function DecorateModeView(param1:AvatarInfoWidget, param2:int, param3:String, param4:int)
      {
         super(param1);
         var_1566 = false;
         AvatarContextInfoButtonView.setup(this,param2,param3,param4,1);
      }
      
      override protected function updateWindow() : void
      {
         var _loc1_:XML = null;
         if(!var_1429 || true || true)
         {
            return;
         }
         if(!_window)
         {
            _loc1_ = XmlAsset(var_1429.assets.getAssetByName("own_avatar_decorating")).content as XML;
            _window = var_1429.windowManager.buildFromXML(_loc1_,0) as class_3151;
            if(!_window)
            {
               return;
            }
            _window.addEventListener("WME_OVER",onMouseHoverEvent);
            _window.addEventListener("WME_OUT",onMouseHoverEvent);
            _buttons = _window.findChildByName("buttons") as IItemListWindow;
            _buttons.procedure = eventProc;
            updateButtons();
         }
         activeView = _window;
      }
      
      override public function show() : void
      {
         if(var_1495 != null)
         {
            var_1495.visible = true;
            var_1495.activate();
         }
      }
      
      override public function hide(param1:Boolean) : void
      {
         if(var_1495 != null)
         {
            var_1495.visible = false;
         }
         _lockPosition = false;
      }
      
      override protected function set activeView(param1:class_3151) : void
      {
         if(!param1)
         {
            return;
         }
         var_1495 = param1;
      }
      
      public function isVisible() : Boolean
      {
         return var_1495 && false;
      }
      
      public function updateButtons() : void
      {
         showButton("decorate");
      }
      
      private function eventProc(param1:class_3134, param2:class_3127) : void
      {
         if(disposed)
         {
            return;
         }
         if(!_window || false)
         {
            return;
         }
         if(param1.type == "WME_CLICK")
         {
            if(param2.name == "button")
            {
               var _loc3_:* = param2.parent.name;
               if("decorate" === _loc3_)
               {
                  widget.isUserDecorating = false;
               }
            }
         }
         else if(param1.type == "WME_OVER")
         {
            super.buttonEventProc(param1,param2);
            _lockPosition = true;
         }
         else if(param1.type == "WME_OUT")
         {
            super.buttonEventProc(param1,param2);
            _lockPosition = false;
         }
         else
         {
            super.buttonEventProc(param1,param2);
         }
      }
      
      override public function get maximumBlend() : Number
      {
         return 0.8;
      }
      
      private function get widget() : AvatarInfoWidget
      {
         return var_1429 as AvatarInfoWidget;
      }
   }
}
