package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectSamplePlaybackEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   
   public class FurnitureSoundBlockLogic extends FurnitureMultiStateLogic
   {
      
      private static const const_864:int = 12;
      
      private static const const_1189:int = -12;
      
      private static const STATE_UNINITIALIZED:int = -1;
       
      
      private var _state:int = -1;
      
      private var _sampleId:int = -1;
      
      private var _noPitch:Boolean = false;
      
      private var _lastLocZ:Number = 0;
      
      public function FurnitureSoundBlockLogic()
      {
         super();
      }
      
      override public function dispose() : void
      {
         if(_state != -1)
         {
            eventDispatcher.dispatchEvent(new RoomObjectSamplePlaybackEvent("ROPSPE_ROOM_OBJECT_DISPOSED",object,_sampleId));
         }
         super.dispose();
      }
      
      override public function getEventTypes() : Array
      {
         var _loc1_:* = ["ROPSPE_PLAY_SAMPLE","ROPSPE_ROOM_OBJECT_DISPOSED","ROPSPE_ROOM_OBJECT_INITIALIZED"];
         return getAllEventTypes(super.getEventTypes(),_loc1_);
      }
      
      override public function initialize(param1:XML) : void
      {
         super.initialize(param1);
         if(param1 == null)
         {
            return;
         }
         var _loc2_:XMLList = param1.sound;
         if(_loc2_.length() == 0)
         {
            return;
         }
         var _loc3_:XMLList = param1.sound.sample;
         if(_loc3_.length() == 0)
         {
            return;
         }
         _sampleId = int(_loc3_.@id);
         _noPitch = _loc3_.@nopitch == "true";
         object.getModelController().setNumber("furniture_soundblock_relative_animation_speed",1);
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         super.processUpdateMessage(param1);
         var _loc2_:IVector3d = object.getLocation();
         var _loc3_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc3_ != null)
         {
            if(_state == -1 && object.getModelController().getNumber("furniture_real_room_object") == 1)
            {
               _lastLocZ = _loc2_.z;
               eventDispatcher.dispatchEvent(new RoomObjectSamplePlaybackEvent("ROPSPE_ROOM_OBJECT_INITIALIZED",object,_sampleId,getPitchForHeight(_loc2_.z)));
            }
            if(_state != -1 && _loc2_ != null)
            {
               if(_lastLocZ != _loc2_.z)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectSamplePlaybackEvent("ROPSPE_CHANGE_PITCH",object,_sampleId,getPitchForHeight(_loc2_.z)));
                  _lastLocZ = _loc2_.z;
               }
            }
            if(_state != -1 && _loc3_.state != _state && _loc2_ != null)
            {
               playSoundAt(_loc2_.z);
            }
            _state = _loc3_.state;
         }
      }
      
      private function playSoundAt(param1:Number) : void
      {
         var _loc2_:Number = getPitchForHeight(param1);
         object.getModelController().setNumber("furniture_soundblock_relative_animation_speed",_loc2_);
         eventDispatcher.dispatchEvent(new RoomObjectSamplePlaybackEvent("ROPSPE_PLAY_SAMPLE",object,_sampleId,_loc2_));
      }
      
      private function getPitchForHeight(param1:Number) : Number
      {
         var _loc2_:int = param1 * 2;
         if(_loc2_ > 12)
         {
            _loc2_ = Math.min(0,-12 + (_loc2_ - 12 - 1));
         }
         return _noPitch ? 1 : Math.pow(2,_loc2_ / 12);
      }
   }
}
