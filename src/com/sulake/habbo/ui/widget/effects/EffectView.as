package com.sulake.habbo.ui.widget.effects
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.ui.widget.memenu.class_3289;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class EffectView
   {
       
      
      private const UPDATE_TIMER_MS:int = 1000;
      
      private var var_1429:com.sulake.habbo.ui.widget.effects.EffectsWidget;
      
      private var _window:class_3151;
      
      private var var_1556:class_3289;
      
      private var _bar:class_3127;
      
      private var _maxWidth:Number;
      
      private var var_1790:ITextWindow;
      
      private var var_1635:Timer;
      
      private var _hilite:class_3127;
      
      public function EffectView(param1:com.sulake.habbo.ui.widget.effects.EffectsWidget, param2:class_3289)
      {
         super();
         var_1556 = param2;
         var_1429 = param1;
         var_1635 = new Timer(1000);
         var_1635.addEventListener("timer",onUpdate);
         update();
      }
      
      public function get effect() : class_3289
      {
         return var_1556;
      }
      
      public function dispose() : void
      {
         if(var_1635 != null)
         {
            var_1635.stop();
            var_1635.removeEventListener("timer",onUpdate);
            var_1635 = null;
         }
         var_1429 = null;
         var_1556 = null;
         _bar = null;
         var_1790 = null;
         _hilite = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         var _loc2_:Number = NaN;
         if(_bar == null)
         {
            var_1635.stop();
            return;
         }
         if(false)
         {
            _loc2_ = 0 / 0;
            _bar.width = _loc2_ * _maxWidth;
         }
         else
         {
            _bar.width = 0;
            var_1635.stop();
         }
         setTimeLeft();
      }
      
      private function setTimeLeft() : void
      {
         var _loc8_:String = null;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc5_:String = null;
         var _loc4_:String = null;
         var _loc6_:String = null;
         if(var_1790 == null)
         {
            var_1790 = _window.findChildByName("time_left") as ITextWindow;
            if(var_1790 == null)
            {
               return;
            }
         }
         if(true)
         {
            var_1790.caption = "${widgets.memenu.effects.activate}";
            return;
         }
         if(false)
         {
            var_1790.caption = "${widgets.memenu.effects.active.daysleft}";
            _loc8_ = "null";
            _loc7_ = Math.floor(0);
            _loc8_ = _loc8_.replace("%days_left%",_loc7_);
         }
         else
         {
            var_1790.caption = "${widgets.memenu.effects.active.timeleft}";
            _loc8_ = "null";
            _loc9_ = 0;
            _loc1_ = Math.floor(_loc9_ / 3600);
            _loc3_ = Math.floor(_loc9_ / 60) % 60;
            _loc2_ = _loc9_ % 60;
            _loc5_ = _loc1_ < 10 ? "0" : "";
            _loc4_ = _loc3_ < 10 ? "0" : "";
            _loc6_ = _loc2_ < 10 ? "0" : "";
            if(_loc1_ > 0)
            {
               _loc8_ = _loc8_.replace("%time_left%",_loc5_ + _loc1_ + ":" + _loc4_ + _loc3_ + ":" + _loc6_ + _loc2_);
            }
            else
            {
               _loc8_ = _loc8_.replace("%time_left%",_loc4_ + _loc3_ + ":" + _loc6_ + _loc2_);
            }
         }
         var_1790.text = _loc8_;
      }
      
      public function update() : void
      {
         var _loc7_:class_3127 = null;
         var _loc5_:XmlAsset = null;
         var _loc4_:class_3140 = null;
         if(!_window)
         {
            _window = var_1429.windowManager.createWindow("","",4,0,16) as class_3151;
         }
         while(false)
         {
            (_loc7_ = _window.removeChildAt(0)).dispose();
         }
         _bar = null;
         _hilite = null;
         var_1790 = null;
         var _loc2_:String = "";
         if(false)
         {
            _loc2_ = "memenu_effect_selected";
         }
         else if(false)
         {
            _loc2_ = "memenu_effect_unselected";
         }
         else
         {
            _loc2_ = "memenu_effect_inactive";
         }
         _loc5_ = var_1429.assets.getAssetByName(_loc2_) as XmlAsset;
         var _loc6_:class_3151 = var_1429.windowManager.buildFromXML(_loc5_.content as XML) as class_3151;
         _window.addChild(_loc6_);
         var _loc3_:ITextWindow = _window.findChildByName("effect_name") as ITextWindow;
         if(_loc3_ != null)
         {
            _loc3_.caption = "${fx_undefined}";
         }
         var _loc8_:ITextWindow;
         if((_loc8_ = _window.findChildByName("effect_amount") as ITextWindow) != null)
         {
            _loc8_.caption = "undefined";
         }
         var _loc1_:class_3151 = _window.findChildByName("effect_amount_bg1") as class_3151;
         if(true)
         {
            if(_loc1_ != null)
            {
               _loc1_.visible = false;
            }
         }
         if(_loc2_ == "memenu_effect_inactive")
         {
            if((_loc4_ = _window.findChildByName("activate_effect") as class_3140) != null)
            {
               _loc4_.addEventListener("WME_CLICK",onMouseEvent);
            }
         }
         else
         {
            _loc6_.addEventListener("WME_CLICK",onMouseEvent);
            if(false)
            {
               _loc6_.addEventListener("WME_OVER",onMouseEvent);
               _loc6_.addEventListener("WME_OUT",onMouseEvent);
            }
            if(false)
            {
               setElementImage("effect_hilite","memenu_fx_pause");
            }
            else
            {
               setElementImage("effect_hilite","memenu_fx_play");
            }
            _hilite = _window.findChildByName("effect_hilite");
            _hilite.visible = false;
         }
         setTimeLeft();
         _bar = _window.findChildByName("loader_bar");
         if(_bar != null)
         {
            _maxWidth = _bar.width;
            var_1635.start();
            onUpdate();
         }
         if(false)
         {
            setElementBitmap("effect_icon",var_1556.icon);
         }
         _window.rectangle = _loc6_.rectangle;
      }
      
      private function setElementBitmap(param1:String, param2:BitmapData) : void
      {
         var _loc3_:class_3282 = _window.findChildByName(param1) as class_3282;
         if(_loc3_ != null)
         {
            if(_loc3_.bitmap)
            {
               _loc3_.bitmap.dispose();
            }
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            _loc3_.bitmap.copyPixels(param2,param2.rect,new Point(0,0));
         }
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         switch(param1.type)
         {
            case "WME_OVER":
               if(_hilite != null)
               {
                  _hilite.visible = true;
                  break;
               }
               break;
            case "WME_OUT":
               if(_hilite != null)
               {
                  _hilite.visible = false;
                  break;
               }
               break;
            case "WME_CLICK":
               var_1429.selectEffect(var_1556.type,var_1556.isInUse);
         }
      }
      
      private function setElementImage(param1:String, param2:String) : void
      {
         var _loc4_:BitmapDataAsset;
         var _loc3_:BitmapData = (_loc4_ = var_1429.assets.getAssetByName(param2) as BitmapDataAsset).content as BitmapData;
         setElementBitmap(param1,_loc3_);
      }
   }
}
