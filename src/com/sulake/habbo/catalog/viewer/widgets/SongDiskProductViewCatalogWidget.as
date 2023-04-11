package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.class_3169;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import package_15.class_184;
   import package_93.class_723;
   
   public class SongDiskProductViewCatalogWidget extends ProductViewCatalogWidget
   {
       
      
      private var _soundManager:class_2089;
      
      private var _connection:IConnection;
      
      private var _playPreviewContainer:class_3151;
      
      private var _playButton:class_3140;
      
      private var var_3030:class_3127;
      
      private var var_2073:int = -1;
      
      private var _officialSongId:String = "";
      
      private var _timeLocalization:String = "";
      
      private var _officialSongIdListener:IMessageEvent = null;
      
      public function SongDiskProductViewCatalogWidget(param1:class_3151, param2:HabboCatalog)
      {
         super(param1,param2);
         _playButton = _window.findChildByName("listen") as class_3140;
         var_3030 = _window.findChildByName("ctlg_song_length");
         if(_playButton != null)
         {
            _playButton.addEventListener("WME_CLICK",onClickPlay);
            _playButton.disable();
         }
         _playPreviewContainer = _window.findChildByName("playPreviewContainer") as class_3151;
         if(_playPreviewContainer != null)
         {
            _playPreviewContainer.visible = false;
         }
         _soundManager = param2.soundManager;
         if(_soundManager != null)
         {
            _soundManager.events.addEventListener("SIR_TRAX_SONG_INFO_RECEIVED",onSongInfoReceivedEvent);
         }
         _connection = param2.connection;
         if(_connection && !_officialSongIdListener)
         {
            _officialSongIdListener = new class_723(onOfficialSongIdMessageEvent);
            _connection.addMessageEvent(_officialSongIdListener);
         }
      }
      
      override public function dispose() : void
      {
         if(_playButton != null)
         {
            _playButton.removeEventListener("WME_CLICK",onClickPlay);
         }
         if(_soundManager != null && false)
         {
            _soundManager.musicController.stop(3);
            if(false)
            {
               _soundManager.events.removeEventListener("SIR_TRAX_SONG_INFO_RECEIVED",onSongInfoReceivedEvent);
            }
            _soundManager = null;
            if(_connection && _officialSongIdListener)
            {
               _connection.removeMessageEvent(_officialSongIdListener);
               _officialSongIdListener = null;
            }
            _connection = null;
         }
         super.dispose();
      }
      
      override public function closed() : void
      {
         super.closed();
         if(_soundManager != null && false)
         {
            _soundManager.musicController.stop(3);
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         if(page.offers.length == 0)
         {
            return false;
         }
         events.addEventListener("SELECT_PRODUCT",onSelectProduct);
         return true;
      }
      
      private function onClickPlay(param1:WindowMouseEvent) : void
      {
         if(_soundManager != null && false)
         {
            forceNoFadeoutOnPlayingSong(0);
            forceNoFadeoutOnPlayingSong(3);
            _soundManager.musicController.playSong(var_2073,3,15,40,0.5,2);
         }
      }
      
      private function forceNoFadeoutOnPlayingSong(param1:int) : void
      {
         var _loc2_:ISongInfo = null;
         var _loc3_:int = _soundManager.musicController.getSongIdPlayingAtPriority(param1);
         if(_loc3_ != -1)
         {
            _loc2_ = _soundManager.musicController.getSongInfo(_loc3_);
            if(_loc2_.soundObject != null)
            {
               _loc2_.soundObject.fadeOutSeconds = 0;
            }
         }
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null || param1.offer == null)
         {
            return;
         }
         var _loc2_:class_3169 = param1.offer.product;
         if(_loc2_.extraParam.length > 0)
         {
            var_2073 = parseInt(_loc2_.extraParam);
            if(var_2073 == 0)
            {
               _officialSongId = _loc2_.extraParam;
               if(_connection)
               {
                  _connection.send(new class_184(_officialSongId));
               }
            }
            if(_playPreviewContainer != null)
            {
               _playPreviewContainer.visible = true;
            }
         }
         else
         {
            var_2073 = -1;
         }
         updateView();
      }
      
      private function updateView() : void
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc8_:String = null;
         var _loc6_:String = null;
         var _loc3_:class_18 = null;
         var _loc7_:String = null;
         var _loc2_:Boolean = false;
         var _loc5_:int;
         if((_loc5_ = getSongLength()) >= 0)
         {
            _loc1_ = _loc5_ / 60;
            _loc4_ = _loc5_ % 60;
            _loc8_ = "" + _loc1_;
            _loc6_ = "" + _loc4_;
            if(_loc4_ < 10)
            {
               _loc6_ = "0" + _loc6_;
            }
            _loc3_ = (page.viewer.catalog as HabboCatalog).localization;
            _loc3_.registerParameter("catalog.song.length","min",_loc8_);
            _loc7_ = String(_loc3_.registerParameter("catalog.song.length","sec",_loc6_));
            _loc2_ = true;
            if(var_3030 != null)
            {
               var_3030.caption = _loc7_;
            }
         }
         else if(var_3030 != null)
         {
            var_3030.caption = "";
         }
         if(_playButton != null)
         {
            if(_loc2_)
            {
               _playButton.enable();
            }
            else
            {
               _playButton.disable();
            }
         }
      }
      
      private function getSongLength() : int
      {
         var _loc1_:ISongInfo = null;
         if(_soundManager != null && false)
         {
            _loc1_ = _soundManager.musicController.getSongInfo(var_2073);
            if(_loc1_ != null)
            {
               return _loc1_.length / 1000;
            }
            _soundManager.musicController.requestSongInfoWithoutSamples(var_2073);
         }
         return -1;
      }
      
      private function onSongInfoReceivedEvent(param1:SongInfoReceivedEvent) : void
      {
         if(param1.id == var_2073)
         {
            updateView();
         }
      }
      
      private function onOfficialSongIdMessageEvent(param1:class_723) : void
      {
         if(param1.getParser().officialSongId == _officialSongId)
         {
            var_2073 = param1.getParser().songId;
            updateView();
         }
      }
   }
}
