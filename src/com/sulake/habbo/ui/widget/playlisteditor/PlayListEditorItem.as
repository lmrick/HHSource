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
   
   public class PlayListEditorItem
   {
      
      public static const ICON_STATE_NORMAL:String = "PLEI_ICON_STATE_NORMAL";
      
      public static const ICON_STATE_PLAYING:String = "PLEI_ICON_STATE_PLAYING";
      
      private static const BG_COLOR_SELECTED:uint = 14283002;
      
      private static const BG_COLOR_UNSELECTED:uint = 15856113;
       
      
      private var var_1429:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget;
      
      private var _window:class_3151;
      
      private var _removeButton:class_3258 = null;
      
      private var var_1913:ColorTransform;
      
      public function PlayListEditorItem(param1:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget, param2:String, param3:String, param4:ColorTransform)
      {
         super();
         var_1429 = param1;
         var_1913 = param4;
         createWindow();
         setIconState("PLEI_ICON_STATE_NORMAL");
         deselect();
         trackName = param2;
         trackAuthor = param3;
         diskColor = param4;
      }
      
      public function get window() : class_3127
      {
         return _window as class_3127;
      }
      
      public function get removeButton() : class_3258
      {
         return _removeButton;
      }
      
      private function createWindow() : void
      {
         var _loc3_:BitmapDataAsset = null;
         if(var_1429 == null)
         {
            return;
         }
         var _loc2_:XmlAsset = var_1429.assets.getAssetByName("playlisteditor_playlist_item") as XmlAsset;
         _window = var_1429.windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         _loc3_ = var_1429.assets.getAssetByName("icon_arrow_left") as BitmapDataAsset;
         if(_loc3_ != null)
         {
            if(_loc3_.content != null)
            {
               this.buttonRemoveBitmap = _loc3_.content as BitmapData;
            }
         }
         assignAssetByNameToElement("jb_icon_disc",_window.getChildByName("song_name_icon_bitmap") as class_3282);
         assignAssetByNameToElement("jb_icon_composer",_window.getChildByName("author_name_icon_bitmap") as class_3282);
         var _loc1_:class_3151 = _window.getChildByName("action_buttons") as class_3151;
         if(_loc1_ != null)
         {
            _loc1_ = _loc1_.getChildByName("button_border") as class_3151;
            if(_loc1_ != null)
            {
               _removeButton = _loc1_.getChildByName("button_remove_from_playlist") as class_3258;
            }
         }
      }
      
      public function select() : void
      {
         var _loc2_:class_3213 = _window.getChildByName("background") as class_3213;
         if(_loc2_ != null)
         {
            _loc2_.color = 14283002;
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
      
      public function setIconState(param1:String) : void
      {
         var _loc3_:BitmapDataAsset = null;
         var _loc2_:BitmapData = null;
         switch(param1)
         {
            case "PLEI_ICON_STATE_NORMAL":
               diskColor = var_1913;
               break;
            case "PLEI_ICON_STATE_PLAYING":
               _loc3_ = var_1429.assets.getAssetByName("icon_notes_small") as BitmapDataAsset;
               if(_loc3_ == null)
               {
                  return;
               }
               if(_loc3_.content != null)
               {
                  _loc2_ = _loc3_.content as BitmapData;
                  this.diskIconBitmap = _loc2_.clone();
                  break;
               }
               break;
         }
      }
      
      public function set diskColor(param1:ColorTransform) : void
      {
         var _loc2_:BitmapData = null;
         var _loc4_:BitmapData = null;
         var _loc3_:BitmapDataAsset = var_1429.assets.getAssetByName("icon_cd_small") as BitmapDataAsset;
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
      
      public function set trackName(param1:String) : void
      {
         var _loc2_:ITextWindow = _window.getChildByName("song_title_text") as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.text = param1;
         }
      }
      
      public function set trackAuthor(param1:String) : void
      {
         var _loc2_:ITextWindow = _window.getChildByName("song_author_text") as ITextWindow;
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
      
      private function set buttonRemoveBitmap(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:class_3151 = _window.getChildByName("action_buttons") as class_3151;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_ = _loc2_.getChildByName("button_border") as class_3151;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_ = _loc2_.getChildByName("button_remove_from_playlist") as class_3151;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:class_3282 = _loc2_.getChildByName("button_remove_from_playlist_image") as class_3282;
         if(_loc3_ != null)
         {
            _loc3_.bitmap = param1.clone();
            _loc3_.width = param1.width;
            _loc3_.height = param1.height;
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
