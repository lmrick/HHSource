package com.sulake.habbo.sound.music
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.sound.HabboSoundManagerFlash10;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.class_3187;
   import com.sulake.habbo.sound.class_3365;
   import com.sulake.habbo.sound.events.NowPlayingEvent;
   import com.sulake.habbo.sound.events.PlayListStatusEvent;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.IEventDispatcher;
   import package_146.class_1296;
   import package_146.class_1316;
   import package_15.class_631;
   import package_93.class_1001;
   import package_93.class_626;
   import package_93.class_750;
   
   public class JukeboxPlayListController implements class_3365
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_420:Boolean = false;
      
      private var var_83:Array;
      
      private var var_1711:class_3187;
      
      private var name_1:IEventDispatcher;
      
      private var _connection:IConnection;
      
      private var _soundManager:HabboSoundManagerFlash10;
      
      private var var_1789:int = -1;
      
      private var _missingSongInfo:Array;
      
      private var _messageEvents:Array;
      
      private var _playPosition:int = -1;
      
      public function JukeboxPlayListController(param1:HabboSoundManagerFlash10, param2:HabboMusicController, param3:IEventDispatcher, param4:IConnection)
      {
         var_83 = [];
         _missingSongInfo = [];
         super();
         _soundManager = param1;
         var_1711 = param2;
         name_1 = param3;
         _connection = param4;
         _messageEvents = [];
         _messageEvents.push(new class_626(onNowPlayingMessage));
         _messageEvents.push(new class_1001(onJukeboxSongDisksMessage));
         _messageEvents.push(new class_750(onJukeboxPlayListFullMessage));
         for each(var _loc5_ in _messageEvents)
         {
            _connection.addMessageEvent(_loc5_);
         }
         name_1.addEventListener("SCE_TRAX_SONG_COMPLETE",onSongFinishedPlayingEvent);
         var_1711.events.addEventListener("SIR_TRAX_SONG_INFO_RECEIVED",onSongInfoReceivedEvent);
      }
      
      public function get priority() : int
      {
         return 0;
      }
      
      public function get nowPlayingSongId() : int
      {
         return var_1789;
      }
      
      public function get playPosition() : int
      {
         return _playPosition;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get isPlaying() : Boolean
      {
         return var_420;
      }
      
      public function get length() : int
      {
         if(var_83 == null)
         {
            return 0;
         }
         return var_83.length;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            stopPlaying();
            if(false)
            {
               var_1711.events.removeEventListener("SIR_TRAX_SONG_INFO_RECEIVED",onSongInfoReceivedEvent);
            }
            var_1711 = null;
            _soundManager = null;
            if(_connection)
            {
               for each(var _loc1_ in _messageEvents)
               {
                  _connection.removeMessageEvent(_loc1_);
                  _loc1_.dispose();
               }
               _messageEvents = null;
               _connection = null;
            }
            if(name_1)
            {
               name_1.removeEventListener("SCE_TRAX_SONG_COMPLETE",onSongFinishedPlayingEvent);
               name_1 = null;
            }
            _disposed = true;
         }
      }
      
      public function stopPlaying() : void
      {
         var_1711.stop(priority);
         var_1789 = -1;
         _playPosition = -1;
         var_420 = false;
      }
      
      public function requestPlayList() : void
      {
         if(_connection == null)
         {
            return;
         }
         _connection.send(new class_631());
      }
      
      public function getEntry(param1:int) : ISongInfo
      {
         if(param1 < 0 || param1 >= var_83.length)
         {
            return null;
         }
         return var_83[param1];
      }
      
      protected function onSongFinishedPlayingEvent(param1:SoundCompleteEvent) : void
      {
      }
      
      private function onNowPlayingMessage(param1:IMessageEvent) : void
      {
         var _loc3_:class_626 = param1 as class_626;
         var _loc2_:class_1296 = _loc3_.getParser() as class_1296;
         class_14.log("Received Now Playing message with: " + _loc2_.currentSongId + ", " + _loc2_.nextSongId + ", " + _loc2_.syncCount);
         var_420 = _loc2_.currentSongId != -1;
         if(_loc2_.currentSongId >= 0)
         {
            var_1711.playSong(_loc2_.currentSongId,0,_loc2_.syncCount / 1000,0,1,1);
            var_1789 = _loc2_.currentSongId;
         }
         else
         {
            stopPlaying();
         }
         if(_loc2_.nextSongId >= 0)
         {
            var_1711.addSongInfoRequest(_loc2_.nextSongId);
         }
         _playPosition = _loc2_.currentPosition;
         _soundManager.events.dispatchEvent(new NowPlayingEvent("NPE_SONG_CHANGED",0,_loc2_.currentSongId,_loc2_.currentPosition));
      }
      
      private function onJukeboxSongDisksMessage(param1:IMessageEvent) : void
      {
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:SongDataEntry = null;
         var _loc5_:class_1001;
         var _loc2_:class_1316 = (_loc5_ = param1 as class_1001).getParser() as class_1316;
         class_14.log("Received Jukebox song disks (=playlist) message, length of playlist: " + _loc2_.songDisks.length);
         var_83 = [];
         _loc4_ = 0;
         while(_loc4_ < _loc2_.songDisks.length)
         {
            _loc7_ = _loc2_.songDisks.getWithIndex(_loc4_);
            _loc6_ = _loc2_.songDisks.getKey(_loc4_);
            _loc3_ = var_1711.getSongInfo(_loc7_) as SongDataEntry;
            if(_loc3_ == null)
            {
               _loc3_ = new SongDataEntry(_loc7_,-1,null,null,null);
               if(_missingSongInfo.indexOf(_loc7_) < 0)
               {
                  _missingSongInfo.push(_loc7_);
                  var_1711.requestSongInfoWithoutSamples(_loc7_);
               }
            }
            _loc3_.diskId = _loc6_;
            var_83.push(_loc3_);
            _loc4_++;
         }
         if(false)
         {
            name_1.dispatchEvent(new PlayListStatusEvent("PLUE_PLAY_LIST_UPDATED"));
         }
      }
      
      private function onJukeboxPlayListFullMessage(param1:IMessageEvent) : void
      {
         class_14.log("Received jukebox playlist full message.");
         name_1.dispatchEvent(new PlayListStatusEvent("PLUE_PLAY_LIST_FULL"));
      }
      
      private function onSongInfoReceivedEvent(param1:SongInfoReceivedEvent) : void
      {
         var _loc4_:int = 0;
         var _loc2_:ISongInfo = null;
         var _loc6_:int = 0;
         var _loc3_:SongDataEntry = null;
         _loc4_ = 0;
         while(_loc4_ < length)
         {
            _loc2_ = var_83[_loc4_];
            if(_loc2_.id == param1.id)
            {
               _loc6_ = _loc2_.diskId;
               _loc3_ = var_1711.getSongInfo(param1.id) as SongDataEntry;
               if(_loc3_ != null)
               {
                  _loc3_.diskId = _loc6_;
                  var_83[_loc4_] = _loc3_;
                  break;
               }
               break;
            }
            _loc4_++;
         }
         var _loc5_:int;
         if((_loc5_ = _missingSongInfo.indexOf(param1.id)) >= 0)
         {
            _missingSongInfo.splice(_loc5_,1);
         }
         if(false)
         {
            name_1.dispatchEvent(new PlayListStatusEvent("PLUE_PLAY_LIST_UPDATED"));
         }
      }
   }
}
