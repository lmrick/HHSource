package com.sulake.habbo.avatar.effects
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.class_3356;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class EffectsParamView implements class_13
   {
       
      
      private var var_1443:com.sulake.habbo.avatar.effects.EffectsModel;
      
      private var _container:class_3151;
      
      private var _catalogPageName:String;
      
      private var _windowManager:class_1684;
      
      private var var_2184:Timer;
      
      private var var_3274:int = 0;
      
      private var var_3162:class_3356 = null;
      
      public function EffectsParamView(param1:com.sulake.habbo.avatar.effects.EffectsModel, param2:class_1684, param3:class_21)
      {
         super();
         var_1443 = param1;
         _windowManager = param2;
         _container = param1.controller.view.effectsParamViewContainer;
         _catalogPageName = param1.controller.manager.getProperty("avatareditor.effects.buy.button.catalog.page.name");
         var_2184 = new Timer(1000);
         var_2184.addEventListener("timer",onSecondsTimer);
         _container.findChildByName("get_more_button").addEventListener("WME_CLICK",onBuyButtonClick);
         updateView(null);
      }
      
      public function dispose() : void
      {
         if(var_2184)
         {
            var_2184.stop();
            var_2184.removeEventListener("timer",onSecondsTimer);
            var_2184 = null;
         }
         _windowManager = null;
         var_1443 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_1443 == null;
      }
      
      public function updateView(param1:class_3356) : void
      {
         var_3162 = param1;
         _container.visible = true;
         if(param1 == null)
         {
            _container.findChildByName("time_left_bg").visible = false;
            _container.findChildByName("save_to_activate").visible = false;
            _container.findChildByName("effect_name").visible = false;
         }
         else
         {
            _container.findChildByName("effect_name").visible = true;
            if(!param1.isActive && !param1.isPermanent)
            {
               _container.findChildByName("time_left_bg").visible = false;
               _container.findChildByName("save_to_activate").visible = true;
               var_2184.stop();
            }
            else
            {
               var_3274 = param1.secondsLeft;
               setSecondsLeft(param1.secondsLeft,param1.duration,param1.isPermanent);
               _container.findChildByName("time_left_bg").visible = true;
               _container.findChildByName("save_to_activate").visible = false;
               var_2184.start();
            }
            _container.findChildByName("effect_name").caption = "${fx_" + param1.type + "}";
         }
      }
      
      private function setSecondsLeft(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc17_:String = null;
         var _loc16_:int = 0;
         var _loc18_:* = 0;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc13_:int = 0;
         var _loc10_:String = null;
         var _loc14_:String = null;
         var _loc15_:String = null;
         var _loc5_:class_3151 = _container.findChildByName("time_left_bg") as class_3151;
         var _loc12_:class_3282 = class_3282(_loc5_.findChildByName("progress_bar_bitmap"));
         var _loc6_:BitmapData = new BitmapData(_loc12_.width,_loc12_.height,false,0);
         var _loc4_:int = param3 ? param2 : param1;
         var _loc8_:Rectangle = new Rectangle(0,0,int(_loc6_.width * (_loc4_ / param2)),_loc6_.height);
         _loc6_.fillRect(_loc8_,2146080);
         _loc12_.bitmap = _loc6_;
         var _loc11_:ITextWindow = ITextWindow(_loc5_.findChildByName("effect_time_left"));
         if(param3)
         {
            _loc11_.caption = "${avatareditor.effects.active.permanent}";
            _loc17_ = _loc11_.text;
         }
         else if(param1 > 86400)
         {
            _loc11_.caption = "${avatareditor.effects.active.daysleft}";
            _loc17_ = _loc11_.text;
            _loc16_ = Math.floor(param1 / 86400);
            _loc17_ = _loc17_.replace("%days_left%",_loc16_);
         }
         else
         {
            _loc11_.caption = "${avatareditor.effects.active.timeleft}";
            _loc17_ = _loc11_.text;
            _loc18_ = param1;
            _loc7_ = Math.floor(_loc18_ / 3600);
            _loc9_ = Math.floor(_loc18_ / 60) % 60;
            _loc13_ = _loc18_ % 60;
            _loc10_ = _loc7_ < 10 ? "0" : "";
            _loc14_ = _loc9_ < 10 ? "0" : "";
            _loc15_ = _loc13_ < 10 ? "0" : "";
            if(_loc7_ > 0)
            {
               _loc17_ = _loc17_.replace("%time_left%",_loc10_ + _loc7_ + ":" + _loc14_ + _loc9_ + ":" + _loc15_ + _loc13_);
            }
            else
            {
               _loc17_ = _loc17_.replace("%time_left%",_loc14_ + _loc9_ + ":" + _loc15_ + _loc13_);
            }
         }
         _loc11_.text = _loc17_;
      }
      
      private function onBuyButtonClick(param1:WindowMouseEvent) : void
      {
         var_1443.controller.manager.catalog.openCatalogPage(_catalogPageName);
      }
      
      private function onSecondsTimer(param1:TimerEvent) : void
      {
         if(var_3162 != null && false)
         {
            setSecondsLeft(var_3274--,var_3162.duration,var_3162.isPermanent);
         }
      }
   }
}
