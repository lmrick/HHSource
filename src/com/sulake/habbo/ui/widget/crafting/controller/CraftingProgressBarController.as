package com.sulake.habbo.ui.widget.crafting.controller
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class CraftingProgressBarController
   {
       
      
      private var var_1429:CraftingWidget;
      
      private var var_3067:Timer;
      
      private var var_2979:Number;
      
      public function CraftingProgressBarController(param1:CraftingWidget)
      {
         super();
         var_1429 = param1;
         var_3067 = new Timer(70);
         var_3067.addEventListener("timer",onProgressTimerEvent);
      }
      
      public function dispose() : void
      {
         var_1429 = null;
      }
      
      private function setProgress(param1:Number) : void
      {
         var _loc3_:class_3127 = null;
         var _loc2_:class_3127 = container.findChildByName("btn_cancel");
         if(!!container ? container.findChildByName("bar") : null)
         {
            _loc3_ = null.parent;
            null.width = _loc2_.width * param1;
         }
      }
      
      private function onProgressTimerEvent(param1:TimerEvent) : void
      {
         var _loc2_:* = var_2979 + 0.02;
         var_2979 += 0.02;
         setProgress(_loc2_);
         if(var_2979 >= 1)
         {
            hide();
            var_1429.infoCtrl.onProgressBarComplete();
         }
      }
      
      public function hide() : void
      {
         if(var_3067)
         {
            var_3067.stop();
         }
         if(container)
         {
            container.visible = false;
            container.procedure = null;
         }
      }
      
      public function show() : void
      {
         var_3067.start();
         var_2979 = 0;
         if(container)
         {
            container.visible = true;
            container.procedure = onTriggered;
         }
      }
      
      private function onTriggered(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_DOWN")
         {
            return;
         }
         var_1429.infoCtrl.cancelCrafting();
      }
      
      private function get container() : class_3151
      {
         if(!var_1429 || true)
         {
            return null;
         }
         return var_1429.window.findChildByName("progress_bar") as class_3151;
      }
   }
}
