package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.ui.widget.events.RoomWidgetSongUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandJukeboxView extends InfoStandFurniView
   {
       
      
      private var var_519:int = -1;
      
      private var _songName:String = "";
      
      private var var_3762:String = "";
      
      public function InfoStandJukeboxView(param1:InfoStandWidget, param2:String, param3:IHabboCatalog)
      {
         super(param1,param2,param3);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override protected function createWindow(param1:String) : void
      {
         var _loc2_:class_3127 = null;
         var _loc7_:int = 0;
         var _loc5_:BitmapData = null;
         var _loc10_:BitmapDataAsset = null;
         var _loc4_:XmlAsset = var_1429.assets.getAssetByName("jukebox_view") as XmlAsset;
         _window = var_1429.windowManager.buildFromXML(_loc4_.content as XML) as IItemListWindow;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var_1438 = _window.getListItemByName("info_border") as class_3213;
         _buttons = _window.getListItemByName("button_list") as IItemListWindow;
         if(var_1438 != null)
         {
            var_1496 = var_1438.findChildByName("infostand_element_list") as IItemListWindow;
         }
         _window.name = param1;
         var_1429.mainContainer.addChild(_window);
         var _loc3_:class_3127 = var_1438.findChildByTag("close");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener("WME_CLICK",onClose);
         }
         if(_buttons != null)
         {
            _loc7_ = 0;
            while(_loc7_ < _buttons.numListItems)
            {
               _loc2_ = _buttons.getListItemAt(_loc7_);
               _loc2_.addEventListener("WME_CLICK",onButtonClicked);
               _loc7_++;
            }
         }
         _catalogButton = var_1438.findChildByTag("catalog");
         if(_catalogButton != null)
         {
            _catalogButton.addEventListener("WME_CLICK",onCatalogButtonClicked);
         }
         _rentButton = var_1438.findChildByName("rent_button");
         if(_rentButton != null)
         {
            _rentButton.addEventListener("WME_CLICK",onRentButtonClicked);
         }
         _extendButton = var_1438.findChildByName("extend_button");
         if(_extendButton != null)
         {
            _extendButton.addEventListener("WME_CLICK",onExtendButtonClicked);
         }
         _buyoutButton = var_1438.findChildByName("buyout_button");
         if(_buyoutButton != null)
         {
            _buyoutButton.addEventListener("WME_CLICK",onBuyoutButtonClicked);
         }
         var _loc6_:class_3282;
         if((_loc6_ = var_1438.findChildByName("icon_disc") as class_3282) != null)
         {
            _loc5_ = (_loc10_ = var_1429.assets.getAssetByName("jb_icon_disc") as BitmapDataAsset).content as BitmapData;
            _loc6_.bitmap = _loc5_.clone();
         }
         var _loc9_:class_3282;
         if((_loc9_ = var_1438.findChildByName("icon_composer") as class_3282) != null)
         {
            _loc5_ = (_loc10_ = var_1429.assets.getAssetByName("jb_icon_composer") as BitmapDataAsset).content as BitmapData;
            _loc9_.bitmap = _loc5_.clone();
         }
         var _loc8_:IRegionWindow;
         if((_loc8_ = var_1496.getListItemByName("owner_region") as IRegionWindow) != null)
         {
            _loc8_.addEventListener("WME_CLICK",onOwnerRegion);
            _loc8_.addEventListener("WME_OVER",onOwnerRegion);
            _loc8_.addEventListener("WME_OUT",onOwnerRegion);
         }
      }
      
      private function set nowPlayingTrackName(param1:String) : void
      {
         var _loc2_:class_3151 = var_1496.getListItemByName("trackname_container") as class_3151;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:ITextWindow = _loc2_.getChildByName("track_name_text") as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.text = param1;
         _loc3_.visible = true;
         _loc3_.height = _loc3_.textHeight + 5;
      }
      
      private function set nowPlayingAuthorName(param1:String) : void
      {
         var _loc2_:class_3151 = var_1496.getListItemByName("creatorname_container") as class_3151;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:ITextWindow = _loc2_.getChildByName("track_creator_text") as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.text = param1;
         _loc3_.visible = true;
         _loc3_.height = _loc3_.textHeight + 5;
      }
      
      public function updateSongInfo(param1:RoomWidgetSongUpdateEvent) : void
      {
         if(param1.type == "RWSUE_PLAYING_CHANGED")
         {
            var_519 = param1.songId;
         }
         if(param1.songId == var_519)
         {
            _songName = param1.songName;
            var_3762 = param1.songAuthor;
            updateNowPlaying(var_519 >= 0);
         }
      }
      
      private function updateNowPlaying(param1:Boolean) : void
      {
         var _loc2_:String = null;
         var _loc3_:ITextWindow = var_1496.getListItemByName("now_playing_text") as ITextWindow;
         if(_loc3_ != null)
         {
            if(param1)
            {
               _loc2_ = String(var_1429.localizations.getLocalization("infostand.jukebox.text.now.playing"));
            }
            else
            {
               _loc2_ = String(var_1429.localizations.getLocalization("infostand.jukebox.text.not.playing"));
            }
            _loc3_.text = _loc2_;
         }
         if(param1)
         {
            nowPlayingTrackName = _songName;
            nowPlayingAuthorName = var_3762;
         }
         else
         {
            nowPlayingTrackName = "";
            nowPlayingAuthorName = "";
         }
         updateWindow();
      }
   }
}
