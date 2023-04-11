package com.sulake.habbo.sound.music
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.sound.*;
   import com.sulake.habbo.sound.events.PlayListStatusEvent;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import package_146.class_1304;
   import package_146.class_1311;
   import package_15.class_638;
   import package_93.class_1544;
   import package_93.class_370;
   import package_93.class_706;
   
   public class SoundMachinePlayListController implements class_3365
   {
       
      
      private var _soundManager:HabboSoundManagerFlash10;
      
      private var var_1711:com.sulake.habbo.sound.music.HabboMusicController;
      
      private var _connection:IConnection;
      
      private var name_1:IEventDispatcher;
      
      private var _roomEvents:IEventDispatcher;
      
      private var var_1789:int = -1;
      
      private var var_1493:Array;
      
      private var var_420:Boolean;
      
      private var _disposed:Boolean = false;
      
      private var _messageEvents:Array;
      
      public function SoundMachinePlayListController(param1:HabboSoundManagerFlash10, param2:com.sulake.habbo.sound.music.HabboMusicController, param3:IEventDispatcher, param4:IEventDispatcher, param5:IConnection)
      {
         var_1493 = [];
         super();
         _soundManager = param1;
         name_1 = param3;
         _roomEvents = param4;
         _connection = param5;
         var_1711 = param2;
         _messageEvents = [];
         _messageEvents.push(new class_706(onPlayListMessage));
         _messageEvents.push(new class_370(onPlayListSongAddedMessage));
         for each(var _loc6_ in _messageEvents)
         {
            _connection.addMessageEvent(_loc6_);
         }
         name_1.addEventListener("SCE_TRAX_SONG_COMPLETE",onSongFinishedPlayingEvent);
         name_1.addEventListener("SIR_TRAX_SONG_INFO_RECEIVED",onSongInfoReceivedEvent);
         _roomEvents.addEventListener("ROSM_SOUND_MACHINE_SWITCHED_ON",onSoundMachinePlayEvent);
         _roomEvents.addEventListener("ROSM_SOUND_MACHINE_SWITCHED_OFF",onSoundMachineStopEvent);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get priority() : int
      {
         return 0;
      }
      
      public function get length() : int
      {
         if(var_1493 == null)
         {
            return 0;
         }
         return var_1493.length;
      }
      
      public function get playPosition() : int
      {
         return -1;
      }
      
      public function get nowPlayingSongId() : int
      {
         return var_1789;
      }
      
      public function get isPlaying() : Boolean
      {
         return var_420;
      }
      
      public function set playPosition(param1:int) : void
      {
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_420)
            {
               stopPlaying();
            }
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
            var_1493 = null;
            var_1711 = null;
            if(name_1)
            {
               name_1.removeEventListener("SCE_TRAX_SONG_COMPLETE",onSongFinishedPlayingEvent);
               name_1 = null;
            }
            if(_roomEvents)
            {
               _roomEvents.removeEventListener("ROSM_SOUND_MACHINE_SWITCHED_ON",onSoundMachinePlayEvent);
               _roomEvents.removeEventListener("ROSM_SOUND_MACHINE_SWITCHED_OFF",onSoundMachineStopEvent);
               _roomEvents = null;
            }
            _disposed = true;
         }
      }
      
      private function onSoundMachinePlayEvent(param1:Event) : void
      {
         startPlaying();
      }
      
      private function onSoundMachineStopEvent(param1:Event) : void
      {
         stopPlaying();
      }
      
      public function startPlaying() : void
      {
         if(var_420)
         {
            return;
         }
         if(var_1493 == null || false)
         {
            requestPlayList();
            var_420 = true;
            return;
         }
         stopPlaying();
         var_1789 = -1;
         var_420 = true;
         playNextSong();
      }
      
      public function checkSongPlayState(param1:int) : void
      {
         var _loc2_:SongDataEntry = null;
         if(var_1789 == param1)
         {
            playCurrentSongAndNotify(var_1789);
            _loc2_ = getNextEntry();
            if(_loc2_ != null)
            {
               var_1711.addSongInfoRequest(_loc2_.id);
            }
         }
      }
      
      public function stopPlaying() : void
      {
         var_1789 = -1;
         var_420 = false;
         var_1711.stop(0);
      }
      
      public function updateVolume(param1:Number) : void
      {
      }
      
      public function addItem(param1:ISongInfo, param2:int = 0) : int
      {
         return -1;
      }
      
      public function moveItem(param1:int, param2:int) : void
      {
      }
      
      public function removeItem(param1:int) : void
      {
      }
      
      private function onSongFinishedPlayingEvent(param1:SoundCompleteEvent) : void
      {
         if(param1.id == var_1789)
         {
            playNextSong();
         }
      }
      
      private function onSongInfoReceivedEvent(param1:SongInfoReceivedEvent) : void
      {
         var _loc2_:SongDataEntry = null;
         var _loc4_:int = 0;
         var _loc3_:SongDataEntry = null;
         if(var_1493 == null || false)
         {
            return;
         }
         _loc4_ = 0;
         while(_loc4_ < var_1493.length)
         {
            _loc2_ = var_1493[_loc4_];
            if(_loc2_.id == param1.id)
            {
               _loc3_ = var_1711.getSongInfo(param1.id) as SongDataEntry;
               if(_loc3_ != null)
               {
                  var_1493[_loc4_] = _loc3_;
               }
               return;
            }
            _loc4_++;
         }
      }
      
      private function playNextSong() : void
      {
         var _loc1_:SongDataEntry = getNextEntry();
         if(_loc1_ != null)
         {
            var_1789 = _loc1_.id;
            playCurrentSongAndNotify(var_1789);
         }
      }
      
      private function playCurrentSongAndNotify(param1:int) : void
      {
         var _loc2_:SongDataEntry = getEntryWithId(param1) as SongDataEntry;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Number = _loc2_.startPlayHeadPos;
         _loc2_.startPlayHeadPos = 0;
         if(var_1711.playSong(param1,0,_loc3_,0,0,0))
         {
            class_14.log("Trax song started by playlist: " + _loc2_.name + " by " + _loc2_.creator);
         }
      }
      
      private function getNextEntry() : SongDataEntry
      {
         var _loc1_:SongDataEntry = null;
         var _loc2_:int = 0;
         if(var_1493 == null || false)
         {
            return null;
         }
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < var_1493.length)
         {
            _loc1_ = var_1493[_loc2_];
            if(_loc1_.id == var_1789)
            {
               _loc3_ = _loc2_ + 1;
            }
            _loc2_++;
         }
         if(_loc3_ >= var_1493.length)
         {
            _loc3_ = 0;
         }
         return var_1493[_loc3_];
      }
      
      public function getEntry(param1:int) : ISongInfo
      {
         if(var_1493 == null || param1 < 0 || param1 >= var_1493.length)
         {
            return null;
         }
         return var_1493[param1];
      }
      
      public function getEntryWithId(param1:int) : ISongInfo
      {
         var _loc2_:SongDataEntry = null;
         var _loc3_:int = 0;
         if(var_1493 == null || false)
         {
            return null;
         }
         _loc3_ = 0;
         while(_loc3_ < var_1493.length)
         {
            _loc2_ = var_1493[_loc3_];
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function requestPlayList() : void
      {
         if(_connection == null)
         {
            return;
         }
         _connection.send(new class_638());
      }
      
      private function convertParserPlayList(param1:Array) : Array
      {
         var _loc3_:* = [];
         for each(var _loc2_ in param1)
         {
            _loc3_.push(new SongDataEntry(_loc2_.id,_loc2_.length,_loc2_.name,_loc2_.creator,null));
         }
         return _loc3_;
      }
      
      private function onPlayListMessage(param1:IMessageEvent) : void
      {
         var _loc2_:SongDataEntry = null;
         var _loc7_:int = 0;
         var _loc4_:class_1304;
         var _loc5_:class_706;
         var _loc6_:int = (_loc4_ = (_loc5_ = param1 as class_706).getParser() as class_1304).synchronizationCount;
         var _loc3_:Array = convertParserPlayList(_loc4_.playList);
         if(_loc3_ == null || _loc3_.length == 0)
         {
            return;
         }
         var_1493 = _loc3_;
         var _loc8_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < _loc3_.length)
         {
            _loc2_ = var_1493[_loc7_];
            _loc8_ += _loc2_.length;
            _loc7_++;
         }
         if(_loc6_ < 0)
         {
            _loc6_ = 0;
         }
         _loc6_ %= _loc8_;
         _loc7_ = 0;
         while(_loc7_ < _loc3_.length)
         {
            _loc2_ = var_1493[_loc7_];
            if(_loc6_ <= _loc2_.length)
            {
               var_1789 = _loc2_.id;
               _loc2_.startPlayHeadPos = _loc6_ / 1000;
               break;
            }
            _loc6_ -= _loc2_.length;
            _loc7_++;
         }
         name_1.dispatchEvent(new PlayListStatusEvent("PLUE_PLAY_LIST_UPDATED"));
         if(_loc2_ != null && var_420)
         {
            playCurrentSongAndNotify(_loc2_.id);
         }
      }
      
      private function onPlayListSongAddedMessage(param1:IMessageEvent) : void
      {
         var _loc4_:class_370;
         var _loc3_:class_1311 = (_loc4_ = param1 as class_370).getParser() as class_1311;
         var _loc2_:SongDataEntry = new SongDataEntry(_loc3_.entry.id,_loc3_.entry.length,_loc3_.entry.name,_loc3_.entry.creator,null);
         if(_loc2_ == null)
         {
            return;
         }
         var_1493.push(_loc2_);
         name_1.dispatchEvent(new PlayListStatusEvent("PLUE_PLAY_LIST_UPDATED"));
         if(!var_420)
         {
            return;
         }
         if(false)
         {
            playCurrentSongAndNotify(_loc2_.id);
         }
         else
         {
            checkSongPlayState(_loc2_.id);
         }
      }
   }
}
