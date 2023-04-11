package com.sulake.habbo.ui.widget.playlisteditor
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.components.class_3258;
   import com.sulake.core.window.components.class_3282;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   
   public class MusicInventoryGridItem
   {
      
      public static const const_855:int = 0;
      
      public static const const_534:int = 1;
      
      public static const BUTTON_STATE_DOWNLOAD:int = 2;
      
      private static const BG_COLOR_SELECTED:uint = 14612159;
      
      private static const BG_COLOR_UNSELECTED:uint = 15856113;
       
      
      private var var_1429:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget;
      
      private var _window:class_3151 = null;
      
      private var var_3780:int;
      
      private var var_519:int;
      
      private var _toPlayListButton:class_3258 = null;
      
      private var var_3811:int;
      
      public function MusicInventoryGridItem(param1:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget, param2:int, param3:int, param4:String, param5:ColorTransform)
      {
         super();
         var_1429 = param1;
         var_3780 = param2;
         var_519 = param3;
         createWindow();
         deselect();
         if(param4 != null && param5 != null)
         {
            trackName = param4;
            diskColor = param5;
         }
      }
      
      public function get window() : class_3127
      {
         return _window as class_3127;
      }
      
      public function get diskId() : int
      {
         return var_3780;
      }
      
      public function get songId() : int
      {
         return var_519;
      }
      
      public function get toPlayListButton() : class_3258
      {
         return _toPlayListButton;
      }
      
      public function get playButtonState() : int
      {
         return var_3811;
      }
      
      public function update(param1:int, param2:String, param3:ColorTransform) : void
      {
         if(param1 == var_519)
         {
            trackName = param2;
            diskColor = param3;
         }
      }
      
      public function destroy() : void
      {
         if(_window)
         {
            _window.destroy();
         }
      }
      
      private function createWindow() : void
      {
         var _loc3_:BitmapDataAsset = null;
         if(var_1429 == null)
         {
            return;
         }
         var _loc2_:XmlAsset = var_1429.assets.getAssetByName("playlisteditor_music_inventory_item") as XmlAsset;
         _window = var_1429.windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var _loc1_:class_3151 = _window.getChildByName("action_buttons") as class_3151;
         if(_loc1_ != null)
         {
            _toPlayListButton = _loc1_.getChildByName("button_to_playlist") as class_3258;
         }
         assignAssetByNameToElement("title_fader",_window.getChildByName("title_fader_bitmap") as class_3282);
         _loc3_ = var_1429.assets.getAssetByName("icon_arrow") as BitmapDataAsset;
         if(_loc3_ != null)
         {
            if(_loc3_.content != null)
            {
               this.buttonToPlaylistBitmap = _loc3_.content as BitmapData;
            }
         }
         this.playButtonState = 0;
      }
      
      public function select() : void
      {
         var _loc2_:class_3213 = _window.getChildByName("background") as class_3213;
         if(_loc2_ != null)
         {
            _loc2_.color = 14612159;
         }
         var _loc3_:class_3151 = _window.getChildByName("action_buttons") as class_3151;
         if(_loc3_ != null)
         {
            _loc3_.visible = true;
         }
         var _loc1_:class_3213 = _window.getChildByName("selected") as class_3213;
         if(_loc1_ != null)
         {
            _loc1_.visible = true;
         }
      }
      
      public function deselect() : void
      {
         var _loc2_:class_3213 = _window.getChildByName("background") as class_3213;
         if(_loc2_ != null)
         {
            _loc2_.color = 15856113;
         }
         var _loc3_:class_3151 = _window.getChildByName("action_buttons") as class_3151;
         if(_loc3_ != null)
         {
            _loc3_.visible = false;
         }
         var _loc1_:class_3213 = _window.getChildByName("selected") as class_3213;
         if(_loc1_ != null)
         {
            _loc1_.visible = false;
         }
      }
      
      public function set diskColor(param1:ColorTransform) : void
      {
         var _loc2_:BitmapData = null;
         var _loc4_:BitmapData = null;
         var _loc3_:BitmapDataAsset = var_1429.assets.getAssetByName("icon_cd_big") as BitmapDataAsset;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.content != null)
         {
            _loc2_ = _loc3_.content as BitmapData;
            if((_loc4_ = _loc2_.clone()) != null)
            {
               _loc4_.colorTransform(_loc2_.rect,param1);
               this.diskIconBitmap = _loc4_;
            }
         }
      }
      
      public function set playButtonState(param1:int) : void
      {
         var _loc2_:BitmapDataAsset = null;
         if(param1 == 0)
         {
            _loc2_ = var_1429.assets.getAssetByName("icon_play") as BitmapDataAsset;
         }
         else if(param1 == 1)
         {
            _loc2_ = var_1429.assets.getAssetByName("icon_pause") as BitmapDataAsset;
         }
         else if(param1 == 2)
         {
            _loc2_ = var_1429.assets.getAssetByName("icon_download") as BitmapDataAsset;
         }
         if(_loc2_ != null)
         {
            if(_loc2_.content != null)
            {
               this.buttonPlayPauseBitmap = _loc2_.content as BitmapData;
            }
         }
         var_3811 = param1;
      }
      
      public function set trackName(param1:String) : void
      {
         var _loc2_:ITextWindow = _window.getChildByName("song_title_text") as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.text = param1;
         }
      }
      
      private function set diskIconBitmap(param1:BitmapData) : void
      {
         var _loc2_:class_3282 = _window.getChildByName("disk_image") as class_3282;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = param1;
         }
      }
      
      private function set buttonToPlaylistBitmap(param1:BitmapData) : void
      {
         assignBitmapDataToButton("button_to_playlist","image_button_to_playlist",param1);
      }
      
      private function set buttonPlayPauseBitmap(param1:BitmapData) : void
      {
         assignBitmapDataToButton("button_play_pause","image_button_play_pause",param1);
      }
      
      private function assignBitmapDataToButton(param1:String, param2:String, param3:BitmapData) : void
      {
         if(param3 == null)
         {
            return;
         }
         var _loc4_:class_3151;
         if((_loc4_ = _window.getChildByName("action_buttons") as class_3151) == null)
         {
            return;
         }
         if((_loc4_ = _loc4_.getChildByName(param1) as class_3151) == null)
         {
            return;
         }
         var _loc5_:class_3282;
         if((_loc5_ = _loc4_.getChildByName(param2) as class_3282) != null)
         {
            _loc5_.bitmap = param3.clone();
            _loc5_.width = param3.width;
            _loc5_.height = param3.height;
         }
      }
      
      private function assignAssetByNameToElement(param1:String, param2:class_3282) : void
      {
         var _loc3_:BitmapData = null;
         var _loc4_:BitmapDataAsset;
         if((_loc4_ = var_1429.assets.getAssetByName(param1) as BitmapDataAsset) != null)
         {
            if(param2 != null && _loc4_.content != null)
            {
               _loc3_ = _loc4_.content as BitmapData;
               param2.bitmap = _loc3_.clone();
            }
         }
      }
   }
}
