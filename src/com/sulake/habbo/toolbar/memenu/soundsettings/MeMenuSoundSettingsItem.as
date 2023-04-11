package com.sulake.habbo.toolbar.memenu.soundsettings
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class MeMenuSoundSettingsItem implements class_13
   {
      
      public static const TYPE_UI_VOLUME:int = 0;
      
      public static const TYPE_FURNI_VOLUME:int = 1;
      
      public static const TYPE_TRAX_VOLUME:int = 2;
       
      
      private var var_271:int;
      
      private var _volume:Number;
      
      private var _window:class_3151;
      
      private var var_2627:com.sulake.habbo.toolbar.memenu.soundsettings.MeMenuSoundSettingsSlider;
      
      private var var_1776:com.sulake.habbo.toolbar.memenu.soundsettings.MeMenuSoundSettingsView;
      
      public function MeMenuSoundSettingsItem(param1:com.sulake.habbo.toolbar.memenu.soundsettings.MeMenuSoundSettingsView, param2:int, param3:class_3151)
      {
         var _loc4_:class_3127 = null;
         super();
         var_271 = param2;
         var_1776 = param1;
         _window = param3;
         var_2627 = new com.sulake.habbo.toolbar.memenu.soundsettings.MeMenuSoundSettingsSlider(this,_window.findChildByName("volume_container") as class_3151,var_1776.widget.toolbar.assets,0,1);
         if((_loc4_ = _window.findChildByName("sounds_off")) != null)
         {
            _loc4_.addEventListener("WME_CLICK",onButtonClicked);
         }
         if((_loc4_ = _window.findChildByName("sounds_on")) != null)
         {
            _loc4_.addEventListener("WME_CLICK",onButtonClicked);
         }
         updateSoundIcons();
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            if(var_2627)
            {
               var_2627.dispose();
               var_2627 = null;
            }
            if(_window)
            {
               _window.dispose();
               _window = null;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_1776 == null;
      }
      
      public function saveVolume(param1:Number, param2:Boolean) : void
      {
         _volume = param1;
         switch(var_271)
         {
            case 0:
               var_1776.saveVolume(param1,-1,-1,param2);
               break;
            case 1:
               var_1776.saveVolume(-1,param1,-1,param2);
               break;
            case 2:
               var_1776.saveVolume(-1,-1,param1,param2);
         }
         updateSoundIcons();
         var_1776.updateSettings();
      }
      
      private function updateSoundIcons() : void
      {
         if(_volume == 0)
         {
            setBitmap("sounds_on_icon","sounds_on_white");
            setBitmap("sounds_off_icon","sounds_off_color");
         }
         else
         {
            setBitmap("sounds_on_icon","sounds_on_color");
            setBitmap("sounds_off_icon","sounds_off_white");
         }
      }
      
      private function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:class_3127 = param1.target as class_3127;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "sounds_off":
               saveVolume(0,false);
               break;
            case "sounds_on":
               saveVolume(1,false);
               break;
            default:
               class_14.log("Me Menu Settings, Sound settings item: unknown button: " + _loc3_);
         }
      }
      
      private function setBitmap(param1:String, param2:String) : void
      {
         IStaticBitmapWrapperWindow(_window.findChildByName(param1)).assetUri = "toolbar_memenu_settings_" + param2;
      }
      
      public function setValue(param1:Number) : void
      {
         var_2627.setValue(param1);
         updateSoundIcons();
      }
   }
}
