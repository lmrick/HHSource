package com.sulake.habbo.toolbar.extensions.settings
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.HabboToolbar;
   import flash.display.BitmapData;
   
   public class SoundSettingsView
   {
       
      
      private var _window:class_3151;
      
      private var var_2476:com.sulake.habbo.toolbar.extensions.settings.SoundSettingsItem;
      
      private var var_2470:com.sulake.habbo.toolbar.extensions.settings.SoundSettingsItem;
      
      private var var_2494:com.sulake.habbo.toolbar.extensions.settings.SoundSettingsItem;
      
      private var _soundsOffIconColor:BitmapData;
      
      private var _soundsOffIconWhite:BitmapData;
      
      private var _soundsOnIconColor:BitmapData;
      
      private var _soundsOnIconWhite:BitmapData;
      
      private var _genericVolume:Number = 1;
      
      private var _furniVolume:Number = 1;
      
      private var _traxVolume:Number = 1;
      
      private var _toolbar:HabboToolbar;
      
      public function SoundSettingsView(param1:HabboToolbar)
      {
         super();
         _toolbar = param1;
         createWindow();
      }
      
      public function dispose() : void
      {
         saveVolume(_genericVolume,_furniVolume,_traxVolume);
         if(_window != null)
         {
            _window.dispose();
         }
         _window = null;
         if(var_2476 != null)
         {
            var_2476.dispose();
         }
         var_2476 = null;
         if(var_2470 != null)
         {
            var_2470.dispose();
         }
         var_2470 = null;
         if(var_2494 != null)
         {
            var_2494.dispose();
         }
         var_2494 = null;
         if(_soundsOffIconColor)
         {
            _soundsOffIconColor.dispose();
            _soundsOffIconColor = null;
         }
         if(_soundsOffIconWhite)
         {
            _soundsOffIconWhite.dispose();
            _soundsOffIconWhite = null;
         }
         if(_soundsOnIconColor)
         {
            _soundsOnIconColor.dispose();
            _soundsOnIconColor = null;
         }
         if(_soundsOnIconWhite)
         {
            _soundsOnIconWhite.dispose();
            _soundsOnIconWhite = null;
         }
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      public function updateSettings() : void
      {
         _genericVolume = _toolbar.soundManager.genericVolume;
         _furniVolume = _toolbar.soundManager.furniVolume;
         _traxVolume = _toolbar.soundManager.traxVolume;
         if(var_2476 != null)
         {
            var_2476.setValue(_genericVolume);
         }
         if(var_2470 != null)
         {
            var_2470.setValue(_furniVolume);
         }
         if(var_2494 != null)
         {
            var_2494.setValue(_traxVolume);
         }
      }
      
      private function createWindow() : void
      {
         var _loc1_:class_3127 = null;
         var _loc3_:int = 0;
         var _loc2_:XmlAsset = _toolbar.assets.getAssetByName("me_menu_sound_settings_xml") as XmlAsset;
         _window = _toolbar.windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
         _loc3_ = 0;
         while(_loc3_ < _window.numChildren)
         {
            _loc1_ = _window.getChildAt(_loc3_);
            _loc1_.addEventListener("WME_CLICK",onButtonClicked);
            _loc3_++;
         }
         var_2476 = new com.sulake.habbo.toolbar.extensions.settings.SoundSettingsItem(this,0,uiVolumeContainer);
         var_2470 = new com.sulake.habbo.toolbar.extensions.settings.SoundSettingsItem(this,1,furniVolumeContainer);
         var_2494 = new com.sulake.habbo.toolbar.extensions.settings.SoundSettingsItem(this,2,traxVolumeContainer);
         updateSettings();
      }
      
      private function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:class_3127 = param1.target as class_3127;
         var _loc3_:String = _loc2_.name;
         class_14.log(_loc3_);
         var _loc4_:* = _loc3_;
         if("back_btn" !== _loc4_)
         {
            class_14.log("Me Menu Settings View: unknown button: " + _loc3_);
         }
         else
         {
            dispose();
         }
      }
      
      public function saveVolume(param1:Number, param2:Number, param3:Number, param4:Boolean = true) : void
      {
         var _loc6_:Number = param2 != -1 ? param2 : _furniVolume;
         var _loc5_:Number = param1 != -1 ? param1 : _genericVolume;
         var _loc7_:Number = param3 != -1 ? param3 : _traxVolume;
         if(param4)
         {
            if(_toolbar == null)
            {
               return;
            }
            _toolbar.soundManager.furniVolume = _loc6_;
            _toolbar.soundManager.genericVolume = _loc5_;
            _toolbar.soundManager.traxVolume = _loc7_;
         }
         else
         {
            _toolbar.soundManager.previewVolume(_loc5_,_loc6_,_loc7_);
         }
      }
      
      public function updateUnseenItemCount(param1:String, param2:int) : void
      {
      }
      
      public function get uiVolumeContainer() : class_3151
      {
         return _window.findChildByName("ui_volume_container") as class_3151;
      }
      
      public function get furniVolumeContainer() : class_3151
      {
         return _window.findChildByName("furni_volume_container") as class_3151;
      }
      
      public function get traxVolumeContainer() : class_3151
      {
         return _window.findChildByName("trax_volume_container") as class_3151;
      }
      
      public function get soundsOffIconColor() : BitmapData
      {
         return _soundsOffIconColor;
      }
      
      public function get soundsOffIconWhite() : BitmapData
      {
         return _soundsOffIconWhite;
      }
      
      public function get soundsOnIconColor() : BitmapData
      {
         return _soundsOnIconColor;
      }
      
      public function get soundsOnIconWhite() : BitmapData
      {
         return _soundsOnIconWhite;
      }
      
      public function get toolbar() : HabboToolbar
      {
         return _toolbar;
      }
   }
}
