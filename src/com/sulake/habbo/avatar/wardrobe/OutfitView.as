package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class OutfitView
   {
       
      
      private var _windowManager:class_1684;
      
      private var var_2029:class_21;
      
      private var _window:class_3151;
      
      private var var_1539:class_3282;
      
      public function OutfitView(param1:class_1684, param2:class_21, param3:Boolean)
      {
         super();
         _windowManager = param1;
         var_2029 = param2;
         var _loc4_:XmlAsset = var_2029.getAssetByName("Outfit") as XmlAsset;
         _window = class_3151(_windowManager.buildFromXML(_loc4_.content as XML));
    
         if(_window != null)
         {
            var_1539 = _window.findChildByName("bitmap") as class_3282;
         }
     
         if(!param3)
         {
            _window.findChildByName("button").disable();
         }
      }
      
      public function dispose() : void
      {
         _windowManager = null;
         var_2029 = null;
      
         if(_window)
         {
            _window.dispose();
         }
         _window = null;
       
         if(var_1539)
         {
            var_1539.dispose();
         }
         var_1539 = null;
      }
      
      public function update(param1:BitmapData) : void
      {
         var_1539.bitmap = new BitmapData(var_1539.width,var_1539.height,true,16777215);
         var _loc2_:int = (0 - param1.width) / 2;
         var _loc3_:int = 0 - param1.height;
         var_1539.bitmap.copyPixels(param1,param1.rect,new Point(_loc2_,_loc3_));
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      private function windowEventProc(param1:class_3134, param2:class_3127 = null) : void
      {
         if(param1.type != "WME_CLICK")
         {
            if(param1.type == "WME_OVER")
            {
               _window.color = 13421772;
            }
            else if(param1.type == "WME_OUT")
            {
               _window.color = 6710886;
            }
         }
      }
   }
}
