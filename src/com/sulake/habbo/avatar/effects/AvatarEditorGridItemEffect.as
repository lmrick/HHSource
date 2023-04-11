package com.sulake.habbo.avatar.effects
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.class_3356;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class AvatarEditorGridItemEffect
   {
       
      
      private var _window:class_3151;
      
      private var var_2043:class_3127;
      
      private var var_3103:Boolean = false;
      
      private var var_3689:class_3356;
      
      public function AvatarEditorGridItemEffect(param1:class_3356, param2:class_1684, param3:class_21)
      {
         super();
         _window = class_3151(param2.buildFromXML(param3.getAssetByName("avatar_editor_effect_griditem_xml").content as XML));
         var_2043 = _window.findChildByTag("BG_COLOR");
         var_3689 = param1;
         if(param1 != null)
         {
            bitmap = param1.icon;
            amount = param1.amountInInventory;
            if(param1.isPermanent)
            {
               setSecondsLeft(param1.duration,param1.duration);
            }
            else if(param1.isActive)
            {
               setSecondsLeft(param1.secondsLeft,param1.duration);
            }
         }
         else
         {
            bitmap = BitmapData(param2.assets.getAssetByName("avatar_editor_generic_remove_selection").content);
            amount = 1;
         }
         selected = false;
         _window.addEventListener("WME_OVER",onMouseOver);
         _window.addEventListener("WME_OUT",onMousetOut);
      }
      
      public function get effectType() : int
      {
         return var_3689 != null ? var_3689.type : -1;
      }
      
      private function onMousetOut(param1:WindowMouseEvent) : void
      {
         if(!var_3103)
         {
            var_2043.visible = false;
         }
         var_2043.blend = 1;
      }
      
      private function onMouseOver(param1:WindowMouseEvent) : void
      {
         if(!var_3103)
         {
            var_2043.visible = true;
            var_2043.blend = 0.5;
         }
      }
      
      public function get window() : class_3127
      {
         return _window;
      }
      
      public function set selected(param1:Boolean) : void
      {
         var_3103 = param1;
         var_2043.visible = var_3103;
         var_2043.blend = 1;
      }
      
      private function set bitmap(param1:BitmapData) : void
      {
         class_3282(_window.findChildByName("bitmap")).bitmap = param1;
      }
      
      private function set amount(param1:int) : void
      {
         var _loc2_:class_3151 = class_3151(_window.findChildByName("effect_amount_bg1"));
         var _loc3_:ITextWindow = ITextWindow(_window.findChildByName("effect_amount"));
         _loc2_.visible = param1 > 1;
         _loc3_.text = param1.toString();
      }
      
      private function setSecondsLeft(param1:int, param2:int) : void
      {
         _window.findChildByName("duration_container").visible = true;
         var _loc5_:class_3282 = class_3282(_window.findChildByName("progress_bar"));
         var _loc3_:BitmapData = new BitmapData(_loc5_.width,_loc5_.height,false,0);
         var _loc4_:Rectangle = new Rectangle(0,0,int(_loc3_.width * (param1 / param2)),_loc3_.height);
         _loc3_.fillRect(_loc4_,2146080);
         _loc5_.bitmap = _loc3_;
      }
   }
}
