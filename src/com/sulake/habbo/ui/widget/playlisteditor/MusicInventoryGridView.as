package com.sulake.habbo.ui.widget.playlisteditor
{
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.class_3187;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import flash.geom.ColorTransform;
   
   public class MusicInventoryGridView
   {
       
      
      private var var_1711:class_3187;
      
      private var var_2239:IItemGridWindow;
      
      private var _items:class_24;
      
      private var var_1429:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget;
      
      private var var_1525:com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryGridItem;
      
      public function MusicInventoryGridView(param1:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget, param2:IItemGridWindow, param3:class_3187)
      {
         _items = new class_24();
         super();
         var_1711 = param3;
         var_2239 = param2;
         var_1429 = param1;
         var_1525 = null;
         var_1711.events.addEventListener("SIR_TRAX_SONG_INFO_RECEIVED",onSongInfoReceivedEvent);
      }
      
      public function get itemCount() : int
      {
         return _items.length;
      }
      
      public function destroy() : void
      {
         if(var_2239 != null)
         {
            var_2239.destroyGridItems();
            var_2239 = null;
         }
         if(var_1711 != null)
         {
            if(false)
            {
               var_1711.events.removeEventListener("SIR_TRAX_SONG_INFO_RECEIVED",onSongInfoReceivedEvent);
            }
            var_1711 = null;
         }
         if(_items)
         {
            _items.reset();
            _items = null;
         }
         var_1525 = null;
         var_1429 = null;
      }
      
      public function refresh() : void
      {
         var _loc4_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:ISongInfo = null;
         var _loc1_:String = null;
         var _loc13_:ColorTransform = null;
         var _loc3_:com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryGridItem = null;
         var _loc7_:com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryGridItem = null;
         if(var_2239 == null)
         {
            return;
         }
         var_2239.removeGridItems();
         var _loc8_:class_24 = _items;
         var _loc2_:class_24 = new class_24();
         var _loc5_:Array = _loc8_.getKeys();
         _items = new class_24();
         var _loc6_:int = var_1711.getSongDiskInventorySize();
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            _loc9_ = var_1711.getSongDiskInventoryDiskId(_loc4_);
            _loc11_ = var_1711.getSongDiskInventorySongId(_loc4_);
            _loc12_ = var_1711.getSongInfo(_loc11_);
            _loc1_ = null;
            _loc13_ = null;
            if(_loc12_ != null)
            {
               _loc1_ = _loc12_.name;
               _loc13_ = var_1429.getDiskColorTransformFromSongData(_loc12_.songData);
            }
            if(_loc5_.indexOf(_loc9_) == -1)
            {
               _loc3_ = new com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryGridItem(var_1429,_loc9_,_loc11_,_loc1_,_loc13_);
            }
            else
            {
               _loc3_ = _loc8_[_loc9_];
               _loc5_.splice(_loc5_.indexOf(_loc9_),1);
            }
            _loc3_.window.procedure = gridItemEventProc;
            _loc3_.toPlayListButton.procedure = gridItemEventProc;
            var_2239.addGridItem(_loc3_.window);
            _items.add(_loc9_,_loc3_);
            _loc4_++;
         }
         for each(var _loc10_ in _loc5_)
         {
            (_loc7_ = _loc8_[_loc10_]).destroy();
            _loc8_.remove(_loc10_);
         }
      }
      
      public function setPreviewIconToPause() : void
      {
         if(var_1525 != null)
         {
            var_1525.playButtonState = 1;
         }
      }
      
      public function setPreviewIconToPlay() : void
      {
         if(var_1525 != null)
         {
            var_1525.playButtonState = 0;
         }
      }
      
      public function deselectAny() : void
      {
         if(var_1525 != null)
         {
            var_1525.deselect();
            var_1525 = null;
         }
      }
      
      private function gridItemEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:int = 0;
         var _loc5_:com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryGridItem = null;
         var _loc3_:* = param1.type == "WME_DOUBLE_CLICK";
         if(param1.type == "WME_CLICK" || _loc3_)
         {
            if(param2.name == "button_to_playlist" || _loc3_)
            {
               if(var_1525 != null)
               {
                  var_1525.deselect();
                  stopPreview();
                  var_1429.sendAddToPlayListMessage(var_1525.diskId);
                  var_1525 = null;
               }
            }
            else if(param2.name == "button_play_pause")
            {
               if(false)
               {
                  var_1525.playButtonState = 2;
                  var_1429.playUserSong(var_1525.songId);
               }
               else
               {
                  stopPreview();
               }
            }
            else if((_loc4_ = var_2239.getGridItemIndex(param1.window)) != -1)
            {
               if((_loc5_ = _items.getWithIndex(_loc4_)) != var_1525)
               {
                  if(var_1525 != null)
                  {
                     var_1525.deselect();
                  }
                  var_1525 = _loc5_;
                  var_1525.select();
                  stopPreview();
               }
               if(false)
               {
                  var_1429.mainWindowHandler.playListEditorView.deselectAny();
               }
            }
         }
      }
      
      private function stopPreview() : void
      {
         var_1429.stopUserSong();
         setPreviewIconToPlay();
      }
      
      private function onSongInfoReceivedEvent(param1:SongInfoReceivedEvent) : void
      {
         var _loc4_:ISongInfo = null;
         var _loc2_:String = null;
         var _loc5_:ColorTransform = null;
         var _loc3_:com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryGridItem = null;
         if(var_1711 != null)
         {
            if((_loc4_ = var_1711.getSongInfo(param1.id)) != null)
            {
               _loc2_ = _loc4_.name;
               _loc5_ = var_1429.getDiskColorTransformFromSongData(_loc4_.songData);
               _loc3_ = _items[param1.id];
               if(_loc3_ != null)
               {
                  _loc3_.update(param1.id,_loc2_,_loc5_);
               }
            }
         }
      }
   }
}
