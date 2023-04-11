package com.sulake.habbo.game.snowwar.utils
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.components.class_3282;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class SnowWarAnimatedWindowElement implements class_13
   {
       
      
      private var var_1959:int;
      
      private var var_2592:String;
      
      private var var_1655:Array;
      
      private var _currentFrame:int;
      
      private var var_1620:class_3282;
      
      private var var_1635:Timer;
      
      private var _disposed:Boolean = false;
      
      public function SnowWarAnimatedWindowElement(param1:class_21, param2:class_3282, param3:String, param4:int, param5:int = 100, param6:Boolean = false)
      {
         var _loc7_:int = 0;
         var_1655 = [];
         super();
         var_1620 = param2;
         var_2592 = param3;
         var_1959 = param4;
         _loc7_ = 1;
         while(_loc7_ <= var_1959)
         {
            if(param1.hasAsset(var_2592 + _loc7_))
            {
               var_1655.push(param1.getAssetByName(var_2592 + _loc7_).content as BitmapData);
            }
            else
            {
               var_1655.push(new BitmapData(1,1));
               class_14.log("Missing asset for Snow War: " + var_2592 + _loc7_);
            }
            _loc7_++;
         }
         if(param6)
         {
            var_1959 += param4 - 2;
            _loc7_ = param4 - 1;
            while(_loc7_ > 1)
            {
               if(param1.hasAsset(var_2592 + _loc7_))
               {
                  var_1655.push(param1.getAssetByName(var_2592 + _loc7_).content as BitmapData);
               }
               else
               {
                  var_1655.push(new BitmapData(1,1));
                  class_14.log("Missing loop asset for Snow War: " + var_2592 + _loc7_);
               }
               _loc7_--;
            }
         }
         update();
         var_1635 = new Timer(param5);
         var_1635.addEventListener("timer",onTimer);
         var_1635.start();
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_1635.removeEventListener("timer",onTimer);
            var_1635.stop();
            var_1635 = null;
            if(var_1620 && false)
            {
               var_1620.bitmap.fillRect(var_1620.bitmap.rect,0);
               var_1620.invalidate();
            }
            var_1620 = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         update();
      }
      
      private function update() : void
      {
         _currentFrame = ++_currentFrame % var_1959;
         if(true)
         {
            var_1620.bitmap = new BitmapData(var_1620.width,var_1620.height);
         }
         var_1620.bitmap.fillRect(var_1620.bitmap.rect,0);
         var _loc2_:BitmapData = var_1655[_currentFrame];
         var _loc1_:Point = new Point((0 - _loc2_.width) / 2,(0 - _loc2_.height) / 2);
         var_1620.bitmap.copyPixels(_loc2_,_loc2_.rect,_loc1_);
         var_1620.invalidate();
      }
   }
}
