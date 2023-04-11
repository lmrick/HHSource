package com.sulake.habbo.sound
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.notifications.class_2082;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineObjectPlaySoundEvent;
   import com.sulake.habbo.sound.events.TraxSongLoadEvent;
   import com.sulake.habbo.sound.furni.FurniSamplePlaybackManager;
   import com.sulake.habbo.sound.music.HabboMusicController;
   import com.sulake.habbo.sound.music.TraxSampleManager;
   import com.sulake.habbo.sound.trax.TraxData;
   import com.sulake.habbo.sound.trax.TraxSequencer;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDRoomEngine;
   import flash.events.Event;
   import flash.media.Sound;
   import package_15.class_662;
   import package_174.class_1327;
   import package_19.class_500;
   import package_53.class_214;
   
   public class HabboSoundManagerFlash10 extends class_20 implements class_2089, class_41
   {
       
      
      private var _communication:class_25;
      
      private var _connection:IConnection;
      
      private var _roomEngine:IRoomEngine;
      
      private var _notifications:class_2082;
      
      private var _genericVolume:Number = 1;
      
      private var _traxVolume:Number = 1;
      
      private var _furniVolume:Number = 1;
      
      private var var_2372:class_24;
      
      private var var_2399:int = -1;
      
      private var var_1945:TraxSequencer;
      
      private var var_1711:com.sulake.habbo.sound.class_3187;
      
      private var var_2088:TraxSampleManager;
      
      private var _onDemandSamplePlaybackManager:FurniSamplePlaybackManager;
      
      private var var_3056:class_24;
      
      private var var_4098:Boolean = false;
      
      public function HabboSoundManagerFlash10(param1:class_31, param2:uint = 0, param3:class_21 = null, param4:Boolean = true)
      {
         var_2372 = new class_24();
         var_3056 = new class_24();
         super(param1,param2,param3);
         if(param4)
         {
            queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
            queueInterface(new IIDRoomEngine(),onRoomEngineReady);
            queueInterface(new IIDHabboNotifications(),onNotificationsReady);
         }
         events.addEventListener("TSLE_TRAX_LOAD_COMPLETE",onTraxLoadComplete);
         registerUpdateReceiver(this,1);
         class_14.log("Sound manager 10 init");
      }
      
      public function get musicController() : com.sulake.habbo.sound.class_3187
      {
         return var_1711;
      }
      
      public function get genericVolume() : Number
      {
         return _genericVolume;
      }
      
      public function set genericVolume(param1:Number) : void
      {
         updateVolumeSetting(param1,_furniVolume,_traxVolume);
         storeVolumeSetting();
      }
      
      public function get traxVolume() : Number
      {
         return _traxVolume;
      }
      
      public function set traxVolume(param1:Number) : void
      {
         updateVolumeSetting(_genericVolume,_furniVolume,param1);
         storeVolumeSetting();
      }
      
      public function get furniVolume() : Number
      {
         return _furniVolume;
      }
      
      public function set furniVolume(param1:Number) : void
      {
         updateVolumeSetting(_genericVolume,param1,_traxVolume);
         storeVolumeSetting();
      }
      
      public function previewVolume(param1:Number, param2:Number, param3:Number) : void
      {
         updateVolumeSetting(param1,param2,param3);
      }
      
      override public function dispose() : void
      {
         _connection = null;
         if(var_1711)
         {
            var_1711.dispose();
            var_1711 = null;
         }
         if(var_2088)
         {
            var_2088.dispose();
            var_2088 = null;
         }
         if(var_2372)
         {
            var_2372.dispose();
            var_2372 = null;
         }
         if(_onDemandSamplePlaybackManager)
         {
            _onDemandSamplePlaybackManager.dispose();
            _onDemandSamplePlaybackManager = null;
         }
         if(_communication)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(_roomEngine)
         {
            _roomEngine.events.removeEventListener("REPSE_PLAY_SOUND",onRoomEngineObjectPlaySound);
            _roomEngine.events.removeEventListener("REPSE_PLAY_SOUND_AT_PITCH",onRoomEngineObjectPlaySound);
            _roomEngine.release(new IIDRoomEngine());
            _roomEngine = null;
         }
         if(_notifications)
         {
            _notifications.release(new IIDHabboNotifications());
            _notifications = null;
         }
         super.dispose();
      }
      
      public function playSound(param1:String, param2:int = 0) : void
      {
         var _loc4_:Sound = null;
         var _loc3_:class_3153 = var_2372.getValue(param1);
         if(_loc3_ == null)
         {
            if((_loc4_ = getSoundBySoundId(param1)) != null)
            {
               _loc3_ = new HabboSoundBase(_loc4_,param2);
               var_2372.add(param1,class_3153(_loc3_));
            }
         }
         _loc3_.volume = _genericVolume;
         _loc3_.play();
      }
      
      public function playSoundAtPitch(param1:String, param2:Number) : class_3153
      {
         var _loc4_:Sound;
         if((_loc4_ = getSoundBySoundId(param1)) == null)
         {
            return null;
         }
         var _loc3_:HabboSoundWithPitch = new HabboSoundWithPitch(_loc4_,param2);
         _loc3_.volume = _genericVolume;
         _loc3_.play();
         return _loc3_;
      }
      
      public function stopSound(param1:String) : void
      {
         var _loc2_:class_3153 = var_2372.getValue(param1);
         if(_loc2_ != null)
         {
            _loc2_.stop();
         }
      }
      
      public function get loadingSongId() : int
      {
         return var_2399;
      }
      
      private function onSampleLoadError() : void
      {
         var_2399 = -1;
         var_1945 = null;
      }
      
      private function getSoundBySoundId(param1:String) : Sound
      {
         var _loc2_:* = "";
         switch(param1)
         {
            case "HBST_call_for_help":
               _loc2_ = "sound_call_for_help";
               break;
            case "HBST_guide_invitation":
               _loc2_ = "sound_guide_received_invitation";
               break;
            case "HBST_guide_request":
               _loc2_ = "sound_guide_help_requested";
               break;
            case "HBST_message_received":
               _loc2_ = "sound_console_new_message";
               break;
            case "HBST_message_sent":
               _loc2_ = "sound_console_message_sent";
               break;
            case "HBST_pixels":
               _loc2_ = "sound_catalogue_duckets";
               break;
            case "HBST_purchase":
               _loc2_ = "sound_catalogue_cash";
               break;
            case "HBST_respect":
               _loc2_ = "sound_respect_received";
               break;
            case "CAMERA_shutter":
               _loc2_ = "sound_camera_shutter";
               break;
            case "HBSTG_snowwar_get_snowball":
            case "HBSTG_snowwar_hit1":
            case "HBSTG_snowwar_hit2":
            case "HBSTG_snowwar_hit3":
            case "HBSTG_snowwar_make_snowball":
            case "HBSTG_snowwar_miss":
            case "HBSTG_snowwar_throw":
            case "HBSTG_snowwar_walk":
            case "HBSTG_ig_countdown":
            case "HBSTG_ig_winning":
            case "HBSTG_ig_losing":
               _loc2_ = param1;
               break;
            case "FURNITURE_cuckoo_clock":
               _loc2_ = param1;
               break;
            default:
               class_14.log("HabboSoundManagerFlash10: Unknown sound request: " + param1);
               return null;
         }
         return getSoundByAssetName(_loc2_);
      }
      
      private function getSoundByAssetName(param1:String) : Sound
      {
         var _loc2_:IAsset = assets.getAssetByName(param1);
         return _loc2_.content as Sound;
      }
      
      public function loadTraxSong(param1:int, param2:String) : class_3153
      {
         if(var_1945 != null)
         {
            return addTraxSongForDownload(param1,param2);
         }
         var _loc3_:TraxSequencer = createTraxInstance(param1,param2);
         if(!_loc3_.ready)
         {
            var_1945 = _loc3_;
            var_2399 = param1;
         }
         return _loc3_ as class_3153;
      }
      
      private function addTraxSongForDownload(param1:int, param2:String) : class_3153
      {
         var _loc3_:TraxSequencer = createTraxInstance(param1,param2,false);
         if(!_loc3_.ready)
         {
            var_3056.add(param1,_loc3_);
         }
         return _loc3_;
      }
      
      private function createTraxInstance(param1:int, param2:String, param3:Boolean = true) : TraxSequencer
      {
         var _loc5_:TraxData = new TraxData(param2);
         var _loc4_:TraxSequencer;
         (_loc4_ = new TraxSequencer(param1,_loc5_,var_2088.traxSamples,events)).volume = _genericVolume;
         validateSampleAvailability(_loc4_,param3);
         return _loc4_;
      }
      
      private function validateSampleAvailability(param1:TraxSequencer, param2:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc6_:TraxData;
         var _loc5_:Array = (_loc6_ = param1.traxData).getSampleIds();
         var _loc3_:Boolean = false;
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            if(var_2088.traxSamples.getValue(int(_loc5_[_loc4_])) == null)
            {
               if(param2)
               {
                  var_2088.loadSample(int(_loc5_[_loc4_]));
               }
               _loc3_ = true;
            }
            _loc4_++;
         }
         if(_loc3_)
         {
            param1.ready = false;
         }
         else
         {
            param1.ready = true;
         }
      }
      
      public function notifyPlayedSong(param1:String, param2:String) : void
      {
         if(_notifications == null)
         {
            return;
         }
         _notifications.addSongPlayingNotification(param1,param2);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IConnection = null;
         if(param2 != null)
         {
            _communication = class_25(param2);
            _loc3_ = _communication.connection;
            if(_loc3_ != null)
            {
               onConnectionReady(_loc3_);
               init();
            }
         }
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         _roomEngine = IRoomEngine(param2);
         init();
      }
      
      private function onNotificationsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         _notifications = class_2082(param2);
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            _connection = param1;
         }
         init();
      }
      
      private function init() : void
      {
         if(_connection == null || _roomEngine == null || var_1711 != null)
         {
            return;
         }
         var_1711 = new HabboMusicController(this,events,_roomEngine.events,_connection);
         var_2088 = new TraxSampleManager(this,onSampleLoadError);
         _onDemandSamplePlaybackManager = new FurniSamplePlaybackManager(this,_roomEngine.events);
         _roomEngine.events.addEventListener("REPSE_PLAY_SOUND",onRoomEngineObjectPlaySound);
         _roomEngine.events.addEventListener("REPSE_PLAY_SOUND_AT_PITCH",onRoomEngineObjectPlaySound);
         _connection.addMessageEvent(new class_214(onSoundSettingsEvent));
         _connection.send(new class_662());
      }
      
      protected function setMusicController(param1:com.sulake.habbo.sound.class_3187) : void
      {
         var_1711 = param1;
      }
      
      private function onTraxLoadComplete(param1:Event) : void
      {
         var _loc2_:TraxSongLoadEvent = param1 as TraxSongLoadEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(var_1945 == null)
         {
            return;
         }
         var_1945.ready = true;
         if(var_1711 == null)
         {
            return;
         }
         var_1711.onSongLoaded(_loc2_.id);
         var_1945 = null;
         var_2399 = -1;
      }
      
      private function storeVolumeSetting() : void
      {
         if(_connection != null)
         {
            _connection.send(new class_500(int(_traxVolume * 100),int(_furniVolume * 100),int(_genericVolume * 100)));
         }
      }
      
      private function updateVolumeSetting(param1:Number, param2:Number, param3:Number) : void
      {
         if(var_4098)
         {
            _genericVolume = 0;
            _furniVolume = 0;
            _traxVolume = 0;
            var_1711.updateVolume(0);
            _onDemandSamplePlaybackManager.updateVolume(0);
         }
         else
         {
            _genericVolume = param1;
            _furniVolume = param2;
            _traxVolume = param3;
            var_1711.updateVolume(param3);
            _onDemandSamplePlaybackManager.updateVolume(param2);
         }
      }
      
      private function onSoundSettingsEvent(param1:IMessageEvent) : void
      {
         var _loc3_:class_214 = param1 as class_214;
         var _loc2_:class_1327 = _loc3_.getParser() as class_1327;
         var _loc4_:Number;
         if((_loc4_ = _loc2_.uiVolume) == 1)
         {
            _loc4_ = 100;
         }
         updateVolumeSetting(_loc4_ / 100,_loc2_.furniVolume / 100,_loc2_.traxVolume / 100);
      }
      
      private function loadNextSong() : void
      {
         var _loc2_:int = 0;
         var _loc1_:TraxSequencer = null;
         if(var_1945 == null && false)
         {
            _loc2_ = var_3056.getKey(0);
            _loc1_ = var_3056.remove(_loc2_);
            if(_loc1_ != null && !_loc1_.disposed)
            {
               validateSampleAvailability(_loc1_,true);
               if(_loc1_.ready)
               {
                  events.dispatchEvent(new TraxSongLoadEvent("TSLE_TRAX_LOAD_COMPLETE",_loc2_));
               }
               else
               {
                  var_1945 = _loc1_;
                  var_2399 = _loc2_;
               }
            }
         }
      }
      
      private function onRoomEngineObjectPlaySound(param1:Event) : void
      {
         var _loc2_:RoomEngineObjectPlaySoundEvent = RoomEngineObjectPlaySoundEvent(param1);
         if(param1.type == "REPSE_PLAY_SOUND")
         {
            playSound(_loc2_.soundId);
         }
         if(param1.type == "REPSE_PLAY_SOUND_AT_PITCH")
         {
            playSoundAtPitch(_loc2_.soundId,_loc2_.pitch);
         }
      }
      
      public function update(param1:uint) : void
      {
         if(var_2088 != null)
         {
            var_2088.update(param1);
         }
         loadNextSong();
      }
      
      public function mute(param1:Boolean) : void
      {
         var_4098 = param1;
         updateVolumeSetting(_genericVolume,_furniVolume,_traxVolume);
      }
   }
}
