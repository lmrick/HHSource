package com.sulake.habbo.ui.widget.playlisteditor
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MusicInventoryStatusView
   {
      
      public static const BUY_MORE:String = "MISV_BUY_MORE";
      
      public static const PREVIEW_PLAYING:String = "MISV_PREVIEW_PLAYING";
       
      
      private var _container:class_3151;
      
      private var var_1977:class_24;
      
      private var var_1429:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget;
      
      private var var_1473:String;
      
      private var var_3604:ITextWindow;
      
      private var var_3564:ITextWindow;
      
      public function MusicInventoryStatusView(param1:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget, param2:class_3151)
      {
         var_1977 = new class_24();
         super();
         _container = param2;
         var_1429 = param1;
         createWindows();
         hide();
      }
      
      public function destroy() : void
      {
         for each(var _loc1_ in var_1977.getValues())
         {
            _loc1_.destroy();
         }
         var_1977 = null;
      }
      
      public function show() : void
      {
         _container.visible = true;
      }
      
      public function hide() : void
      {
         _container.visible = false;
      }
      
      public function selectView(param1:String) : void
      {
         _container.removeChildAt(0);
         _container.addChildAt(var_1977[param1] as class_3151,0);
         var_1473 = param1;
      }
      
      public function set songName(param1:String) : void
      {
         if(var_3604 == null)
         {
            return;
         }
         var_3604.text = param1;
      }
      
      public function set authorName(param1:String) : void
      {
         if(var_3564 == null)
         {
            return;
         }
         var_3564.text = param1;
      }
      
      public function setPreviewPlayingBackgroundImage(param1:BitmapData, param2:Boolean = true) : void
      {
         blitBackgroundImage("MISV_PREVIEW_PLAYING","preview_play_background_image",param1);
         if(param2 && param1 != null)
         {
            param1.dispose();
         }
      }
      
      public function setGetMoreMusicBackgroundImage(param1:BitmapData, param2:Boolean = true) : void
      {
         blitBackgroundImage("MISV_BUY_MORE","get_more_music_background_image",param1);
         if(param2 && param1 != null)
         {
            param1.dispose();
         }
      }
      
      private function createWindows() : void
      {
         var _loc3_:class_3151 = null;
         var _loc2_:XmlAsset = null;
         var _loc1_:class_3140 = null;
         var _loc4_:class_3140 = null;
         _loc2_ = var_1429.assets.getAssetByName("playlisteditor_inventory_subwindow_play_preview") as XmlAsset;
         _loc3_ = var_1429.windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
         if(_loc3_ != null)
         {
            var_1977.add("MISV_PREVIEW_PLAYING",_loc3_);
            var_3604 = _loc3_.getChildByName("preview_play_track_name") as ITextWindow;
            var_3564 = _loc3_.getChildByName("preview_play_author_name") as ITextWindow;
            _loc1_ = _loc3_.getChildByName("stop_preview_button") as class_3140;
            _loc1_.addEventListener("WME_CLICK",onStopPreviewClicked);
            setPreviewPlayingBackgroundImage(var_1429.getImageGalleryAssetBitmap("background_preview_playing"));
            assignAssetByNameToElement("jb_icon_disc",_loc3_.getChildByName("song_name_icon_bitmap") as class_3282);
            assignAssetByNameToElement("jb_icon_composer",_loc3_.getChildByName("author_name_icon_bitmap") as class_3282);
         }
         _loc2_ = var_1429.assets.getAssetByName("playlisteditor_inventory_subwindow_get_more_music") as XmlAsset;
         _loc3_ = var_1429.windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
         if(_loc3_ != null)
         {
            var_1977.add("MISV_BUY_MORE",_loc3_);
            (_loc4_ = _loc3_.getChildByName("open_catalog_button") as class_3140).addEventListener("WME_CLICK",onOpenCatalogButtonClicked);
            setGetMoreMusicBackgroundImage(var_1429.getImageGalleryAssetBitmap("background_get_more_music"));
         }
      }
      
      private function blitBackgroundImage(param1:String, param2:String, param3:BitmapData) : void
      {
         var _loc5_:BitmapData = null;
         var _loc6_:class_3151;
         if((_loc6_ = var_1977[param1] as class_3151) == null)
         {
            return;
         }
         var _loc4_:class_3282;
         if((_loc4_ = _loc6_.getChildByName(param2) as class_3282) == null)
         {
            return;
         }
         if(param3 != null)
         {
            (_loc5_ = new BitmapData(_loc4_.width,_loc4_.height,false,4294967295)).copyPixels(param3,param3.rect,new Point(0,0));
            _loc4_.bitmap = _loc5_;
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
      
      private function onOpenCatalogButtonClicked(param1:WindowMouseEvent) : void
      {
         var_1429.openSongDiskShopCataloguePage();
      }
      
      private function onStopPreviewClicked(param1:WindowMouseEvent) : void
      {
         var_1429.stopUserSong();
      }
   }
}
