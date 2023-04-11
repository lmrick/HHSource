package com.sulake.habbo.ui.widget.furniture.placeholder
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.class_1684;
   import flash.geom.Rectangle;
   
   public class PlaceholderView
   {
       
      
      private var var_2029:class_21;
      
      private var _windowManager:class_1684;
      
      private var _window:class_3151;
      
      public function PlaceholderView(param1:class_21, param2:class_1684)
      {
         super();
         var_2029 = param1;
         _windowManager = param2;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function toggleWindow() : void
      {
         if(_window != null && false)
         {
            hideWindow();
         }
         else
         {
            showWindow();
         }
      }
      
      public function showWindow() : void
      {
         if(_window == null)
         {
            createWindow();
         }
         if(_window == null)
         {
            return;
         }
         _window.visible = true;
         _window.x = 200;
      }
      
      private function createWindow() : void
      {
         var _loc2_:XmlAsset = var_2029.getAssetByName("placeholder") as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return;
         }
         _window = _windowManager.createWindow("habbohelp_window","",4,0,131073,new Rectangle(-300,300,10,10),null) as class_3151;
         _window.buildFromXML(_loc2_.content as XML);
         _window.tags.push("habbo_help_window");
         _window.background = true;
         _window.color = 33554431;
         var _loc1_:class_3127 = _window.findChildByTag("close");
         if(_loc1_ != null)
         {
            _loc1_.procedure = onWindowClose;
         }
      }
      
      public function hideWindow() : void
      {
         if(_window != null)
         {
            _window.visible = false;
         }
      }
      
      private function onWindowClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         hideWindow();
      }
   }
}
