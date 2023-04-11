package com.sulake.habbo.sound.furni
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.room.events.RoomEngineObjectSamplePlaybackEvent;
   import com.sulake.habbo.sound.HabboSoundManagerFlash10;
   import com.sulake.habbo.sound.HabboSoundWithPitch;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   
   public class FurniSamplePlaybackManager implements class_13
   {
       
      
      private var _soundManager:HabboSoundManagerFlash10;
      
      private var _roomEvents:IEventDispatcher;
      
      private var _disposed:Boolean = false;
      
      private var var_1751:class_24;
      
      private var var_2098:class_24;
      
      private var var_2174:class_24;
      
      private var _volume:Number = 1;
      
      public function FurniSamplePlaybackManager(param1:HabboSoundManagerFlash10, param2:IEventDispatcher)
      {
         var_1751 = new class_24();
         var_2098 = new class_24();
         var_2174 = new class_24();
         super();
         _soundManager = param1;
         _roomEvents = param2;
         _roomEvents.addEventListener("REOSPE_ROOM_OBJECT_INITIALIZED",onRoomObjectInitializedEvent);
         _roomEvents.addEventListener("REOSPE_ROOM_OBJECT_DISPOSED",onRoomObjectDisposedEvent);
         _roomEvents.addEventListener("REOSPE_PLAY_SAMPLE",onRoomObjectPlaySampleEvent);
         _roomEvents.addEventListener("REOSPE_CHANGE_PITCH",onRoomObjectChangeSamplePitchEvent);
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_roomEvents)
            {
               _roomEvents.removeEventListener("REOSPE_ROOM_OBJECT_INITIALIZED",onRoomObjectInitializedEvent);
               _roomEvents.removeEventListener("REOSPE_ROOM_OBJECT_DISPOSED",onRoomObjectDisposedEvent);
               _roomEvents.removeEventListener("REOSPE_PLAY_SAMPLE",onRoomObjectPlaySampleEvent);
               _roomEvents.removeEventListener("REOSPE_CHANGE_PITCH",onRoomObjectChangeSamplePitchEvent);
               _roomEvents = null;
            }
            if(var_1751)
            {
               var_1751.dispose();
               var_1751 = null;
            }
            if(var_2098)
            {
               var_2098.dispose();
               var_2098 = null;
            }
            if(var_2174)
            {
               var_2174.dispose();
               var_2174 = null;
            }
            _soundManager = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function updateVolume(param1:Number) : void
      {
         _volume = param1;
         for each(var _loc2_ in var_1751.getValues())
         {
            _loc2_.volume = _volume;
         }
      }
      
      private function onRoomObjectInitializedEvent(param1:RoomEngineObjectSamplePlaybackEvent) : void
      {
         if(param1.sampleId != -1)
         {
            addSampleForFurni(param1.objectId,param1.sampleId);
            if(var_2174.hasKey(param1.objectId))
            {
               var_2174.remove(param1.objectId);
            }
            var_2174.add(param1.objectId,param1.pitch);
         }
      }
      
      private function onRoomObjectDisposedEvent(param1:RoomEngineObjectSamplePlaybackEvent) : void
      {
         removeSampleForFurni(param1.objectId);
      }
      
      private function onRoomObjectPlaySampleEvent(param1:RoomEngineObjectSamplePlaybackEvent) : void
      {
         if(var_1751.getValue(param1.objectId) != null)
         {
            playSample(param1.objectId);
         }
      }
      
      private function onRoomObjectChangeSamplePitchEvent(param1:RoomEngineObjectSamplePlaybackEvent) : void
      {
         if(var_1751.getValue(param1.objectId) != null)
         {
            changeSamplePitch(param1.objectId,param1.pitch);
         }
      }
      
      private function addSampleForFurni(param1:int, param2:int) : void
      {
         if(var_1751.getValue(param1) == null && var_2098.getValues().indexOf(param2) == -1)
         {
            loadSample(param2,param1);
         }
      }
      
      private function removeSampleForFurni(param1:int) : void
      {
         var _loc2_:HabboSoundWithPitch = var_1751.getValue(param1);
         if(_loc2_ != null)
         {
            _soundManager.removeUpdateReceiver(_loc2_);
            _loc2_.dispose();
            var_1751.remove(param1);
         }
      }
      
      private function playSample(param1:int) : void
      {
         var _loc2_:HabboSoundWithPitch = var_1751.getValue(param1);
         if(_loc2_ != null)
         {
            _loc2_.stop();
            _loc2_.play();
         }
      }
      
      private function changeSamplePitch(param1:int, param2:Number) : void
      {
         var _loc3_:HabboSoundWithPitch = var_1751.getValue(param1);
         if(_loc3_ != null)
         {
            _loc3_.setPitch(param2);
         }
      }
      
      private function loadSample(param1:int, param2:int) : void
      {
         var _loc5_:String = (_loc5_ = (_loc5_ = _soundManager.getProperty("flash.dynamic.download.url")) + _soundManager.getProperty("flash.dynamic.download.samples.template")).replace(/%typeid%/,param1.toString());
         var _loc3_:URLRequest = new URLRequest(_loc5_);
         var _loc4_:Sound;
         (_loc4_ = new Sound()).addEventListener("complete",onSampleLoadComplete);
         _loc4_.addEventListener("ioError",ioErrorHandler);
         _loc4_.load(_loc3_);
         var_2098.add(_loc4_,param2);
      }
      
      private function onSampleLoadComplete(param1:Event) : void
      {
         if(disposed)
         {
            return;
         }
         var _loc4_:Sound;
         if((_loc4_ = param1.target as Sound) == null || var_2098.getValue(_loc4_) == null)
         {
            return;
         }
         var _loc3_:int = var_2098.getValue(_loc4_);
         var _loc2_:HabboSoundWithPitch = new HabboSoundWithPitch(_loc4_,var_2174.getValue(_loc3_));
         _soundManager.registerUpdateReceiver(_loc2_,0);
         _loc2_.volume = _volume;
         var_1751.add(_loc3_,_loc2_);
         var_2098.remove(_loc4_);
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         class_14.log("Error loading sound " + param1.target + " text " + param1.text);
      }
   }
}
