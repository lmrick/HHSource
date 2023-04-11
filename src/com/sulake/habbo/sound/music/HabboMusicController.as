package com.sulake.habbo.sound.music
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.sound.*;
   import com.sulake.habbo.sound.events.NowPlayingEvent;
   import com.sulake.habbo.sound.events.SongDiskInventoryReceivedEvent;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import com.sulake.habbo.sound.trax.TraxSequencer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import package_146.class_1082;
   import package_146.class_1191;
   import package_15.class_179;
   import package_15.class_732;
   import package_15.class_948;
   import package_93.class_1004;
   import package_93.class_1650;
   import package_93.class_987;
   
   public class HabboMusicController implements class_3187, class_13
   {
      
      public static const SKIP_POSITION_SET:int = -1;
      
      private static const MAXIMUM_NOTIFY_PRIORITY:int = 0;
       
      
      private var _soundManager:HabboSoundManagerFlash10;
      
      private var _connection:IConnection;
      
      private var name_1:IEventDispatcher;
      
      private var _roomEvents:IEventDispatcher;
      
      private var var_1767:class_24;
      
      private var var_2157:class_24;
      
      private var var_2120:Array;
      
      private var var_1874:class_3365 = null;
      
      private var _disposed:Boolean = false;
      
      private var var_1845:Array;
      
      private var var_2505:Array;
      
      private var var_1667:int = -1;
      
      private var var_3021:int = -1;
      
      private var var_3302:int = -1;
      
      private var var_2796:Timer;
      
      private var var_118:class_24;
      
      private var var_2510:Array;
      
      private var _messageEvents:Array;
      
      private var var_4177:int = -1;
      
      private var _previousNotificationTime:int = -1;
      
      public function HabboMusicController(param1:HabboSoundManagerFlash10, param2:IEventDispatcher, param3:IEventDispatcher, param4:IConnection)
      {
         var _loc5_:int = 0;
         var_1767 = new class_24();
         var_2157 = new class_24();
         var_2120 = [];
         var_1845 = [];
         var_2505 = [];
         var_118 = new class_24();
         var_2510 = [];
         _messageEvents = [];
         super();
         _soundManager = param1;
         name_1 = param2;
         _roomEvents = param3;
         _connection = param4;
         _messageEvents.push(new class_987(onSongInfoMessage));
         _messageEvents.push(new class_1004(onSongDiskInventoryMessage));
         for each(var _loc6_ in _messageEvents)
         {
            _connection.addMessageEvent(_loc6_);
         }
         _roomEvents.addEventListener("ROSM_JUKEBOX_INIT",onJukeboxInit);
         _roomEvents.addEventListener("ROSM_JUKEBOX_DISPOSE",onJukeboxDispose);
         _roomEvents.addEventListener("ROSM_SOUND_MACHINE_INIT",onSoundMachineInit);
         _roomEvents.addEventListener("ROSM_SOUND_MACHINE_DISPOSE",onSoundMachineDispose);
         var_2796 = new Timer(1000);
         var_2796.start();
         var_2796.addEventListener("timer",sendNextSongRequestMessage);
         name_1.addEventListener("SCE_TRAX_SONG_COMPLETE",onSongFinishedPlayingEvent);
         _loc5_ = 0;
         while(_loc5_ < 4)
         {
            var_1845[_loc5_] = null;
            var_2505[_loc5_] = 0;
            _loc5_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get events() : IEventDispatcher
      {
         return name_1;
      }
      
      protected function onSongFinishedPlayingEvent(param1:SoundCompleteEvent) : void
      {
         var _loc2_:int = 0;
         class_14.log("Song " + param1.id + " finished playing");
         if(getSongIdPlayingAtPriority(var_1667) == param1.id)
         {
            if(getTopRequestPriority() == var_1667 && getSongRequestCountAtPriority(var_1667) == var_3302)
            {
               resetSongStartRequest(var_1667);
            }
            _loc2_ = var_1667;
            playSongWithHighestPriority();
            if(_loc2_ >= 2)
            {
               name_1.dispatchEvent(new NowPlayingEvent("NPW_USER_STOP_SONG",_loc2_,param1.id,-1));
            }
         }
      }
      
      public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc1_:SongDataEntry = null;
         var _loc2_:class_3153 = null;
         if(!_disposed)
         {
            _soundManager = null;
            var_2120 = null;
            if(_connection)
            {
               for each(var _loc4_ in _messageEvents)
               {
                  _connection.removeMessageEvent(_loc4_);
                  _loc4_.dispose();
               }
               _messageEvents = null;
               _connection = null;
            }
            if(var_1874)
            {
               var_1874.dispose();
               var_1874 = null;
            }
            if(var_1767)
            {
               _loc3_ = 0;
               while(_loc3_ < var_1767.length)
               {
                  _loc1_ = var_1767.getWithIndex(_loc3_) as SongDataEntry;
                  _loc2_ = _loc1_.soundObject as class_3153;
                  if(_loc2_ != null)
                  {
                     _loc2_.stop();
                  }
                  _loc1_.soundObject = null;
                  _loc3_++;
               }
               var_1767.dispose();
               var_1767 = null;
            }
            if(var_2157 != null)
            {
               var_2157.dispose();
               var_2157 = null;
            }
            var_2796.stop();
            var_2796 = null;
            if(_roomEvents)
            {
               _roomEvents.removeEventListener("ROSM_JUKEBOX_INIT",onJukeboxInit);
               _roomEvents.removeEventListener("ROSM_JUKEBOX_DISPOSE",onJukeboxDispose);
               _roomEvents.removeEventListener("ROSM_SOUND_MACHINE_INIT",onSoundMachineInit);
               _roomEvents.removeEventListener("ROSM_SOUND_MACHINE_DISPOSE",onSoundMachineDispose);
            }
            if(var_118 != null)
            {
               var_118.dispose();
               var_118 = null;
            }
            _disposed = true;
         }
      }
      
      public function getRoomItemPlaylist(param1:int = -1) : class_3365
      {
         return var_1874;
      }
      
      private function addSongStartRequest(param1:int, param2:int, param3:Number, param4:Number, param5:Number, param6:Number) : Boolean
      {
         if(param1 < 0 || param1 >= 4)
         {
            return false;
         }
         var _loc7_:SongStartRequestData = new SongStartRequestData(param2,param3,param4,param5,param6);
         var_1845[param1] = _loc7_;
         var _loc8_:* = param1;
         var _loc9_:Number = NaN;
         var_2505[_loc8_] = _loc9_;
         return true;
      }
      
      private function getSongStartRequest(param1:int) : SongStartRequestData
      {
         return var_1845[param1];
      }
      
      private function getSongIdRequestedAtPriority(param1:int) : int
      {
         if(param1 < 0 || param1 >= 4)
         {
            return -1;
         }
         if(true)
         {
            return -1;
         }
         var _loc2_:SongStartRequestData = var_1845[param1];
         return _loc2_.songId;
      }
      
      private function getSongRequestCountAtPriority(param1:int) : int
      {
         if(param1 < 0 || param1 >= 4)
         {
            return -1;
         }
         return var_2505[param1];
      }
      
      private function getTopRequestPriority() : int
      {
         var _loc1_:int = 0;
         _loc1_ = -1;
         while(_loc1_ >= 0)
         {
            if(false)
            {
               return _loc1_;
            }
            _loc1_--;
         }
         return -1;
      }
      
      private function resetSongStartRequest(param1:int) : void
      {
         if(param1 >= 0 && param1 < 4)
         {
            var_1845[param1] = null;
         }
      }
      
      private function reRequestSongAtPriority(param1:int) : void
      {
         var _loc2_:* = param1;
         var _loc3_:Number = NaN;
         var_2505[_loc2_] = _loc3_;
      }
      
      private function processSongEntryForPlaying(param1:int, param2:Boolean = true) : Boolean
      {
         var _loc4_:SongDataEntry;
         if((_loc4_ = getSongDataEntry(param1)) == null)
         {
            addSongInfoRequest(param1);
            return false;
         }
         if(_loc4_.soundObject == null)
         {
            _loc4_.soundObject = _soundManager.loadTraxSong(_loc4_.id,_loc4_.songData);
         }
         var _loc3_:class_3153 = _loc4_.soundObject;
         if(!_loc3_.ready)
         {
            return false;
         }
         return true;
      }
      
      public function playSong(param1:int, param2:int, param3:Number = 0, param4:Number = 0, param5:Number = 0.5, param6:Number = 0.5) : Boolean
      {
         class_14.log("Requesting " + param1 + " for playing");
         if(!addSongStartRequest(param2,param1,param3,param4,param5,param6))
         {
            return false;
         }
         if(!processSongEntryForPlaying(param1))
         {
            return false;
         }
         if(param2 >= var_1667)
         {
            playSongObject(param2,param1);
         }
         else
         {
            class_14.log("Higher priority song blocked playing. Stored song " + param1 + " for priority " + param2);
         }
         return true;
      }
      
      private function playSongWithHighestPriority() : void
      {
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var_1667 = -1;
         var_3021 = -1;
         var_3302 = -1;
         var _loc1_:int = getTopRequestPriority();
         _loc2_ = _loc1_;
         while(_loc2_ >= 0)
         {
            _loc3_ = getSongIdRequestedAtPriority(_loc2_);
            if(_loc3_ >= 0 && playSongObject(_loc2_,_loc3_))
            {
               return;
            }
            _loc2_--;
         }
      }
      
      public function stop(param1:int) : void
      {
         var _loc2_:* = param1 == var_1667;
         var _loc3_:* = getTopRequestPriority() == param1;
         if(_loc2_)
         {
            resetSongStartRequest(param1);
            stopSongAtPriority(param1);
         }
         else
         {
            resetSongStartRequest(param1);
            if(_loc3_)
            {
               reRequestSongAtPriority(var_1667);
            }
         }
      }
      
      private function stopSongAtPriority(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:SongDataEntry = null;
         if(param1 == var_1667 && var_1667 >= 0)
         {
            _loc3_ = getSongIdPlayingAtPriority(param1);
            if(_loc3_ >= 0)
            {
               _loc2_ = getSongDataEntry(_loc3_);
               stopSongDataEntry(_loc2_);
               return true;
            }
         }
         return false;
      }
      
      private function stopSongDataEntry(param1:SongDataEntry) : void
      {
         var _loc2_:class_3153 = null;
         if(param1 != null)
         {
            class_14.log("Stopping current song " + param1.id);
            _loc2_ = param1.soundObject;
            if(_loc2_ != null)
            {
               _loc2_.stop();
            }
         }
      }
      
      private function getSongDataEntry(param1:int) : SongDataEntry
      {
         var _loc2_:SongDataEntry = null;
         if(var_1767 != null)
         {
            _loc2_ = var_1767.getValue(param1) as SongDataEntry;
         }
         return _loc2_;
      }
      
      public function updateVolume(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:SongDataEntry = null;
         _loc3_ = 0;
         while(_loc3_ < 4)
         {
            if((_loc4_ = getSongIdPlayingAtPriority(_loc3_)) >= 0)
            {
               _loc2_ = getSongDataEntry(_loc4_) as SongDataEntry;
               if(_loc2_ != null && _loc2_.soundObject != null)
               {
                  _loc2_.soundObject.volume = param1;
               }
            }
            _loc3_++;
         }
      }
      
      public function onSongLoaded(param1:int) : void
      {
         var _loc3_:int = 0;
         class_14.log("Song loaded : " + param1);
         var _loc2_:int = getTopRequestPriority();
         if(_loc2_ >= 0)
         {
            _loc3_ = getSongIdRequestedAtPriority(_loc2_);
            if(param1 == _loc3_)
            {
               playSongObject(_loc2_,param1);
            }
         }
      }
      
      public function addSongInfoRequest(param1:int) : void
      {
         requestSong(param1,true);
      }
      
      public function requestSongInfoWithoutSamples(param1:int) : void
      {
         requestSong(param1,false);
      }
      
      private function requestSong(param1:int, param2:Boolean) : void
      {
         if(var_2157.getValue(param1) == null)
         {
            var_2157.add(param1,param2);
            var_2120.push(param1);
         }
      }
      
      public function getSongInfo(param1:int) : ISongInfo
      {
         var _loc2_:SongDataEntry = getSongDataEntry(param1);
         if(_loc2_ == null)
         {
            requestSongInfoWithoutSamples(param1);
         }
         return _loc2_;
      }
      
      public function requestUserSongDisks() : void
      {
         if(_connection == null)
         {
            return;
         }
         _connection.send(new class_948());
      }
      
      public function getSongDiskInventorySize() : int
      {
         return var_118.length;
      }
      
      public function getSongDiskInventoryDiskId(param1:int) : int
      {
         if(param1 >= 0 && param1 < var_118.length)
         {
            return var_118.getKey(param1);
         }
         return -1;
      }
      
      public function getSongDiskInventorySongId(param1:int) : int
      {
         if(param1 >= 0 && param1 < var_118.length)
         {
            return var_118.getWithIndex(param1);
         }
         return -1;
      }
      
      public function getSongIdPlayingAtPriority(param1:int) : int
      {
         if(param1 != var_1667)
         {
            return -1;
         }
         return var_3021;
      }
      
      public function samplesUnloaded(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc3_:SongDataEntry = null;
         var _loc4_:TraxSequencer = null;
         var _loc2_:Array = null;
         var _loc6_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < var_1767.length)
         {
            _loc3_ = var_1767.getWithIndex(_loc5_) as SongDataEntry;
            _loc4_ = _loc3_.soundObject as TraxSequencer;
            if(_loc3_.id != var_3021 && _loc4_ != null && _loc4_.ready)
            {
               _loc2_ = _loc4_.traxData.getSampleIds();
               _loc6_ = 0;
               while(_loc6_ < param1.length)
               {
                  if(_loc2_.indexOf(param1[_loc6_]) != -1)
                  {
                     _loc3_.soundObject = null;
                     _loc4_.dispose();
                     class_14.log("Unloaded " + _loc3_.name + " by " + _loc3_.creator);
                  }
                  _loc6_++;
               }
            }
            _loc5_++;
         }
      }
      
      public function get samplesIdsInUse() : Array
      {
         var _loc5_:int = 0;
         var _loc3_:SongStartRequestData = null;
         var _loc2_:SongDataEntry = null;
         var _loc1_:TraxSequencer = null;
         var _loc4_:* = [];
         _loc5_ = 0;
         while(_loc5_ < var_1845.length)
         {
            if(false)
            {
               _loc3_ = var_1845[_loc5_];
               _loc2_ = var_1767.getValue(_loc3_.songId);
               if(_loc2_ != null)
               {
                  _loc1_ = _loc2_.soundObject as TraxSequencer;
                  if(_loc1_ != null)
                  {
                     _loc4_ = _loc4_.concat(_loc1_.traxData.getSampleIds());
                  }
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function sendNextSongRequestMessage(param1:TimerEvent) : void
      {
         if(true)
         {
            return;
         }
         if(_connection == null)
         {
            return;
         }
         _connection.send(new class_732(var_2120));
         class_14.log("Requested song info\'s : " + var_2120);
         var_2120 = [];
      }
      
      private function onSongInfoMessage(param1:IMessageEvent) : void
      {
         var _loc8_:int = 0;
         var _loc9_:class_1650 = null;
         var _loc10_:* = false;
         var _loc4_:Boolean = false;
         var _loc11_:class_3153 = null;
         var _loc12_:SongDataEntry = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:class_987 = param1 as class_987;
         var _loc2_:class_1082 = _loc3_.getParser() as class_1082;
         var _loc7_:Array = _loc2_.songs;
         _loc8_ = 0;
         while(_loc8_ < _loc7_.length)
         {
            _loc9_ = _loc7_[_loc8_];
            _loc10_ = getSongDataEntry(_loc9_.id) == null;
            _loc4_ = areSamplesRequested(_loc9_.id);
            if(_loc10_)
            {
               _loc11_ = null;
               if(_loc4_)
               {
                  _loc11_ = _soundManager.loadTraxSong(_loc9_.id,_loc9_.data);
               }
               (_loc12_ = new SongDataEntry(_loc9_.id,_loc9_.length,_loc9_.name,_loc9_.creator,_loc11_)).songData = _loc9_.data;
               var_1767.add(_loc9_.id,_loc12_);
               _loc5_ = getTopRequestPriority();
               _loc6_ = getSongIdRequestedAtPriority(_loc5_);
               if(_loc11_ != null && _loc11_.ready && _loc9_.id == _loc6_)
               {
                  playSongObject(_loc5_,_loc6_);
               }
               name_1.dispatchEvent(new SongInfoReceivedEvent("SIR_TRAX_SONG_INFO_RECEIVED",_loc9_.id));
               while(var_2510.indexOf(_loc9_.id) != -1)
               {
                  var_2510.splice(var_2510.indexOf(_loc9_.id),1);
                  if(false)
                  {
                     name_1.dispatchEvent(new SongDiskInventoryReceivedEvent("SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT"));
                  }
               }
               class_14.log("Received song info : " + _loc9_.id);
            }
            _loc8_++;
         }
      }
      
      private function playSongObject(param1:int, param2:int) : Boolean
      {
         if(param2 == -1 || param1 < 0 || param1 >= 4)
         {
            return false;
         }
         var _loc6_:Boolean = false;
         if(stopSongAtPriority(var_1667))
         {
            _loc6_ = true;
         }
         var _loc5_:SongDataEntry;
         if((_loc5_ = getSongDataEntry(param2)) == null)
         {
            class_14.log("WARNING: Unable to find song entry id " + param2 + " that was supposed to be loaded.");
            return false;
         }
         var _loc3_:class_3153 = _loc5_.soundObject;
         if(_loc3_ == null || !_loc3_.ready)
         {
            return false;
         }
         if(_loc6_)
         {
            class_14.log("Waiting previous song to stop before playing song " + param2);
            return true;
         }
         _loc3_.volume = _soundManager.traxVolume;
         var _loc9_:Number = -1;
         var _loc7_:Number = 0;
         var _loc4_:Number = 2;
         var _loc8_:Number = 1;
         var _loc10_:SongStartRequestData;
         if((_loc10_ = getSongStartRequest(param1)) != null)
         {
            _loc9_ = _loc10_.startPos;
            _loc7_ = _loc10_.playLength;
            _loc4_ = _loc10_.fadeInSeconds;
            _loc8_ = _loc10_.fadeOutSeconds;
         }
         if(_loc9_ >= _loc5_.length / 1000)
         {
            return false;
         }
         if(_loc9_ == -1)
         {
            _loc9_ = 0;
         }
         _loc3_.fadeInSeconds = _loc4_;
         _loc3_.fadeOutSeconds = _loc8_;
         _loc3_.position = _loc9_;
         _loc3_.play(_loc7_);
         var_1667 = param1;
         var_3302 = getSongRequestCountAtPriority(param1);
         var_3021 = param2;
         if(var_1667 <= 0)
         {
            notifySongPlaying(_loc5_);
         }
         if(param1 > 0)
         {
            name_1.dispatchEvent(new NowPlayingEvent("NPE_USER_PLAY_SONG",param1,_loc5_.id,-1));
         }
         class_14.log("Started playing song " + param2 + " at position " + _loc9_ + " for " + _loc7_ + " seconds (length " + _loc5_.length / 1000 + ") with priority " + param1);
         return true;
      }
      
      private function notifySongPlaying(param1:SongDataEntry) : void
      {
         var _loc3_:int = getTimer();
         if(param1.length >= 8000 && (var_4177 != param1.id || _loc3_ > _previousNotificationTime + 8000))
         {
            _soundManager.notifyPlayedSong(param1.name,param1.creator);
            var_4177 = param1.id;
            _previousNotificationTime = _loc3_;
         }
      }
      
      private function areSamplesRequested(param1:int) : Boolean
      {
         if(var_2157.getValue(param1) == null)
         {
            return false;
         }
         return var_2157.getValue(param1);
      }
      
      private function onSongDiskInventoryMessage(param1:IMessageEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:class_1004 = param1 as class_1004;
         var _loc2_:class_1191 = _loc3_.getParser() as class_1191;
         var_118.reset();
         _loc4_ = 0;
         while(_loc4_ < _loc2_.songDiskCount)
         {
            _loc5_ = _loc2_.getDiskId(_loc4_);
            _loc6_ = _loc2_.getSongId(_loc4_);
            var_118.add(_loc5_,_loc6_);
            if(var_1767.getValue(_loc6_) == null)
            {
               var_2510.push(_loc6_);
               requestSongInfoWithoutSamples(_loc6_);
            }
            _loc4_++;
         }
         if(false)
         {
            name_1.dispatchEvent(new SongDiskInventoryReceivedEvent("SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT"));
         }
      }
      
      private function onSoundMachineInit(param1:Event) : void
      {
         disposeRoomPlaylist();
         var_1874 = new SoundMachinePlayListController(_soundManager,this,name_1,_roomEvents,_connection) as class_3365;
      }
      
      private function onSoundMachineDispose(param1:Event) : void
      {
         disposeRoomPlaylist();
      }
      
      private function onJukeboxInit(param1:Event) : void
      {
         disposeRoomPlaylist();
         var_1874 = new JukeboxPlayListController(_soundManager,this,name_1,_connection) as class_3365;
         _connection.send(new class_179());
      }
      
      private function onJukeboxDispose(param1:Event) : void
      {
         disposeRoomPlaylist();
      }
      
      private function disposeRoomPlaylist() : void
      {
         if(var_1874 != null)
         {
            var_1874.dispose();
            var_1874 = null;
         }
      }
   }
}
