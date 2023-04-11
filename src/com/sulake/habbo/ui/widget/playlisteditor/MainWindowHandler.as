package com.sulake.habbo.ui.widget.playlisteditor
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.class_3187;
   import com.sulake.habbo.sound.class_3365;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorNowPlayingEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MainWindowHandler
   {
      
      private static const SHOW_BUY_MORE_MUSIC_DISK_COUNT:int = 6;
      
      private static const MY_MUSIC_SHOW_SCROLLBAR_ITEM_COUNT_LIMIT:int = 9;
      
      private static const PLAYLIST_SHOW_SCROLLBAR_ITEM_COUNT_LIMIT:int = 5;
       
      
      private var var_1429:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget;
      
      private var var_1711:class_3187;
      
      private var var_1439:class_3151;
      
      private var var_2734:class_3213;
      
      private var var_2763:class_3213;
      
      private var var_2047:com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryGridView;
      
      private var var_2414:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorItemListView;
      
      private var var_1701:com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryStatusView;
      
      private var var_1814:com.sulake.habbo.ui.widget.playlisteditor.PlayListStatusView;
      
      private var var_3729:IScrollbarWindow;
      
      private var var_3608:IScrollbarWindow;
      
      public function MainWindowHandler(param1:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget, param2:class_3187)
      {
         var _loc3_:BitmapData = null;
         super();
         var_1429 = param1;
         var_1711 = param2;
         var _loc5_:* = ["title_mymusic","title_playlist","background_preview_playing","background_get_more_music","background_add_songs"];
         for each(var _loc4_ in _loc5_)
         {
            _loc3_ = var_1429.getImageGalleryAssetBitmap(_loc4_);
            if(_loc3_ != null)
            {
               _loc3_.dispose();
            }
            else
            {
               var_1429.retrieveWidgetImage(_loc4_);
            }
         }
         createWindow();
         var_2047 = new com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryGridView(param1,getMusicInventoryGrid(),param2);
         var_2414 = new com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorItemListView(param1,getPlayListEditorItemList());
         var_1701 = new com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryStatusView(param1,getMusicInventoryStatusContainer());
         var_1814 = new com.sulake.habbo.ui.widget.playlisteditor.PlayListStatusView(param1,getPlayListStatusContainer());
         refreshLoadableAsset();
      }
      
      public function get window() : class_3127
      {
         return var_1439;
      }
      
      public function get musicInventoryView() : com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryGridView
      {
         return var_2047;
      }
      
      public function get playListEditorView() : com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorItemListView
      {
         return var_2414;
      }
      
      public function destroy() : void
      {
         if(var_1711)
         {
            var_1711.stop(2);
            var_1711 = null;
         }
         if(var_2047)
         {
            var_2047.destroy();
            var_2047 = null;
         }
         if(var_2414)
         {
            var_2414.destroy();
            var_2414 = null;
         }
         if(var_1814)
         {
            var_1814.destroy();
            var_1814 = null;
         }
         if(var_1701)
         {
            var_1701.destroy();
            var_1701 = null;
         }
         var_1439.destroy();
         var_1439 = null;
      }
      
      public function hide() : void
      {
         var_1439.visible = false;
         if(var_1429 != null)
         {
            var_1429.stopUserSong();
         }
      }
      
      public function show() : void
      {
         var_1711.requestUserSongDisks();
         var _loc1_:class_3365 = var_1711.getRoomItemPlaylist();
         if(_loc1_ != null)
         {
            _loc1_.requestPlayList();
            selectPlayListStatusViewByFurniPlayListState();
         }
         var_1439.visible = true;
      }
      
      public function refreshLoadableAsset(param1:String = "") : void
      {
         if(param1 == "" || param1 == "title_mymusic")
         {
            assignWindowBitmapByAsset(var_2734,"music_inventory_splash_image","title_mymusic");
         }
         if(param1 == "" || param1 == "title_playlist")
         {
            assignWindowBitmapByAsset(var_2763,"playlist_editor_splash_image","title_playlist");
         }
         if(param1 == "" || param1 == "background_preview_playing")
         {
            var_1701.setPreviewPlayingBackgroundImage(var_1429.getImageGalleryAssetBitmap("background_preview_playing"));
         }
         if(param1 == "" || param1 == "background_get_more_music")
         {
            var_1701.setGetMoreMusicBackgroundImage(var_1429.getImageGalleryAssetBitmap("background_get_more_music"));
         }
         if(param1 == "" || param1 == "background_add_songs")
         {
            var_1814.addSongsBackgroundImage = var_1429.getImageGalleryAssetBitmap("background_add_songs");
         }
      }
      
      private function assignWindowBitmapByAsset(param1:class_3151, param2:String, param3:String) : void
      {
         var _loc4_:BitmapData = null;
         var _loc5_:class_3282;
         if((_loc5_ = param1.getChildByName(param2) as class_3282) != null)
         {
            if((_loc4_ = var_1429.getImageGalleryAssetBitmap(param3)) != null)
            {
               _loc5_.bitmap = _loc4_;
               _loc5_.width = _loc4_.width;
               _loc5_.height = _loc4_.height;
            }
         }
      }
      
      private function createWindow() : void
      {
         if(var_1429 == null)
         {
            return;
         }
         var _loc2_:XmlAsset = var_1429.assets.getAssetByName("playlisteditor_main_window") as XmlAsset;
         var_1439 = var_1429.windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
         if(var_1439 == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var_1439.position = new Point(80,0);
         var _loc3_:class_3151 = var_1439.getChildByName("content_area") as class_3151;
         if(_loc3_ == null)
         {
            throw new Error("Window is missing \'content_area\' element");
         }
         var_2734 = _loc3_.getChildByName("my_music_border") as class_3213;
         var_2763 = _loc3_.getChildByName("playlist_border") as class_3213;
         if(var_2734 == null)
         {
            throw new Error("Window content area is missing \'my_music_border\' window element");
         }
         if(var_2763 == null)
         {
            throw new Error("Window content area is missing \'playlist_border\' window element");
         }
         var_3729 = var_2734.getChildByName("music_inventory_scrollbar") as IScrollbarWindow;
         var_3608 = var_2763.getChildByName("playlist_scrollbar") as IScrollbarWindow;
         if(var_3729 == null)
         {
            throw new Error("Window content area is missing \'music_inventory_scrollbar\' window element");
         }
         if(var_3608 == null)
         {
            throw new Error("Window content area is missing \'playlist_scrollbar\' window element");
         }
         var _loc1_:class_3127 = var_1439.findChildByTag("close");
         if(_loc1_ != null)
         {
            _loc1_.addEventListener("WME_CLICK",onClose);
         }
      }
      
      private function getMusicInventoryGrid() : IItemGridWindow
      {
         return var_2734.getChildByName("music_inventory_itemgrid") as IItemGridWindow;
      }
      
      private function getPlayListEditorItemList() : IItemListWindow
      {
         return var_2763.getChildByName("playlist_editor_itemlist") as IItemListWindow;
      }
      
      private function getMusicInventoryStatusContainer() : class_3151
      {
         return var_2734.getChildByName("preview_play_container") as class_3151;
      }
      
      private function getPlayListStatusContainer() : class_3151
      {
         return var_2763.getChildByName("now_playing_container") as class_3151;
      }
      
      private function selectPlayListStatusViewByFurniPlayListState() : void
      {
         var _loc1_:class_3365 = var_1711.getRoomItemPlaylist();
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.isPlaying)
         {
            var_1814.selectView("PLSV_NOW_PLAYING");
         }
         else if(_loc1_.length > 0)
         {
            var_1814.selectView("PLSV_START_PLAYBACK");
         }
         else
         {
            var_1814.selectView("PLSV_ADD_SONGS");
         }
      }
      
      private function selectMusicStatusViewByMusicState() : void
      {
         if(isPreviewPlaying())
         {
            var_1701.show();
            var_1701.selectView("MISV_PREVIEW_PLAYING");
         }
         else if(var_1711.getSongDiskInventorySize() <= 6)
         {
            var_1701.show();
            var_1701.selectView("MISV_BUY_MORE");
         }
         else
         {
            var_1701.hide();
         }
      }
      
      private function updatePlaylistEditorView() : void
      {
         var _loc4_:int = 0;
         var _loc5_:ISongInfo = null;
         var _loc2_:class_3365 = var_1711.getRoomItemPlaylist();
         var _loc3_:* = [];
         var _loc1_:int = -1;
         if(_loc2_ != null)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               if((_loc5_ = _loc2_.getEntry(_loc4_)) != null)
               {
                  _loc3_.push(_loc5_);
               }
               _loc4_++;
            }
            _loc1_ = _loc2_.playPosition;
         }
         var_2414.refresh(_loc3_,_loc1_);
      }
      
      public function onPlayListUpdated() : void
      {
         var _loc3_:ISongInfo = null;
         updatePlaylistEditorView();
         selectPlayListStatusViewByFurniPlayListState();
         var _loc1_:class_3365 = var_1711.getRoomItemPlaylist();
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:int = _loc1_.nowPlayingSongId;
         if(_loc2_ != -1)
         {
            _loc3_ = var_1711.getSongInfo(_loc2_);
            var_1814.nowPlayingTrackName = _loc3_.name;
            var_1814.nowPlayingAuthorName = _loc3_.creator;
         }
         var_3608.visible = _loc1_.length > 5;
      }
      
      public function onSongDiskInventoryReceived() : void
      {
         var_2047.refresh();
         selectMusicStatusViewByMusicState();
         var_3729.visible = false;
      }
      
      public function onNowPlayingChanged(param1:RoomWidgetPlayListEditorNowPlayingEvent) : void
      {
         var _loc3_:ISongInfo = null;
         var _loc2_:ISongInfo = null;
         switch(param1.type)
         {
            case "RWPLENPE_SONG_CHANGED":
               selectPlayListStatusViewByFurniPlayListState();
               var_2414.setItemIndexPlaying(param1.position);
               if(param1.id != -1)
               {
                  _loc3_ = var_1711.getSongInfo(param1.id);
                  var_1814.nowPlayingTrackName = _loc3_ != null ? _loc3_.name : "";
                  var_1814.nowPlayingAuthorName = _loc3_ != null ? _loc3_.creator : "";
                  break;
               }
               break;
            case "RWPLENPE_USER_PLAY_SONG":
               var_2047.setPreviewIconToPause();
               _loc2_ = var_1711.getSongInfo(param1.id);
               var_1701.songName = _loc2_ != null ? _loc2_.name : "";
               var_1701.songName = _loc2_ != null ? _loc2_.name : "";
               var_1701.authorName = _loc2_ != null ? _loc2_.creator : "";
               selectMusicStatusViewByMusicState();
               break;
            case "RWPLENPW_USER_STOP_SONG":
               var_2047.setPreviewIconToPlay();
               selectMusicStatusViewByMusicState();
         }
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         hide();
      }
      
      private function isPreviewPlaying() : Boolean
      {
         return var_1711.getSongIdPlayingAtPriority(2) != -1;
      }
   }
}
