package com.sulake.habbo.game.snowwar.ui
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.utils.WindowUtils;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class BackgroundViewController implements class_13
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1451:SnowWarEngine;
      
      private var _background:class_3151;
      
      public function BackgroundViewController(param1:SnowWarEngine)
      {
         super();
         var_1451 = param1;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var_1451 = null;
         if(_background)
         {
            _background.dispose();
            _background = null;
         }
         _disposed = true;
      }
      
      public function get background() : class_3127
      {
         if(!_background)
         {
            createView();
         }
         return _background;
      }
      
      private function createView() : void
      {
         var _loc1_:class_3234 = var_1451.windowManager.getDesktop(0);
         _background = WindowUtils.createWindow("snowwar_loading_background_xml",1) as class_3151;
         _background.width = _loc1_.width;
         _background.height = _loc1_.height;
         _loc1_.addChildAt(_background,0);
         setBitmap("bg_sky","sky",_background);
         setBitmap("bg_sunshine","sunshine",_background);
         setBitmap("bg_vista_1","vista_1",_background,true);
         setBitmap("bg_vista_2","vista_2",_background,true);
         setBitmap("bg_vista_3","vista_3",_background,true);
      }
      
      private function setBitmap(param1:String, param2:String, param3:class_3151, param4:Boolean = false) : void
      {
         var _loc8_:BitmapData = null;
         var _loc6_:int = 0;
         var _loc9_:BitmapDataAsset = var_1451.assets.getAssetByName(param1) as BitmapDataAsset;
         var _loc7_:class_3282 = param3.findChildByName(param2) as class_3282;
         var _loc5_:BitmapData = _loc9_.content as BitmapData;
         if(param4)
         {
            _loc8_ = new BitmapData(param3.width,_loc5_.height,true,0);
            _loc6_ = 0;
            while(_loc6_ < param3.width / _loc5_.width + 1)
            {
               _loc8_.copyPixels(_loc5_,_loc5_.rect,new Point(_loc6_ * _loc5_.width,0));
               _loc6_++;
            }
            _loc7_.bitmap = _loc8_;
         }
         else
         {
            _loc7_.bitmap = _loc5_;
            _loc7_.disposesBitmap = false;
         }
      }
   }
}
