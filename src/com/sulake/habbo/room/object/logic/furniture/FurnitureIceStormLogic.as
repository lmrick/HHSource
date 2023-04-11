package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.object.data.class_1610;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class FurnitureIceStormLogic extends FurnitureMultiStateLogic
   {
       
      
      private var _nextState:int = 0;
      
      private var _nextStateExtra:Number = 0;
      
      private var _nextStateTimeStamp:int = 0;
      
      public function FurnitureIceStormLogic()
      {
         super();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc2_ != null)
         {
            handleDataUpdateMessage(_loc2_);
            return;
         }
         super.processUpdateMessage(param1);
      }
      
      private function handleDataUpdateMessage(param1:RoomObjectDataUpdateMessage) : void
      {
         var _loc3_:class_1610 = null;
         var _loc4_:int = param1.state / 1000;
         var _loc2_:int = param1.state % 1000;
         if(_loc2_ == 0)
         {
            _nextStateTimeStamp = 0;
            _loc3_ = new class_1610();
            _loc3_.setString(String(_loc4_));
            param1 = new RoomObjectDataUpdateMessage(_loc4_,_loc3_,param1.extra);
            super.processUpdateMessage(param1);
         }
         else
         {
            _nextState = _loc4_;
            _nextStateExtra = param1.extra;
            _nextStateTimeStamp = lastUpdateTime + _loc2_;
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:class_1610 = null;
         var _loc3_:RoomObjectDataUpdateMessage = null;
         if(_nextStateTimeStamp > 0 && param1 >= _nextStateTimeStamp)
         {
            _nextStateTimeStamp = 0;
            _loc2_ = new class_1610();
            _loc2_.setString(String(_nextState));
            _loc3_ = new RoomObjectDataUpdateMessage(_nextState,_loc2_,_nextStateExtra);
            super.processUpdateMessage(_loc3_);
         }
         super.update(param1);
      }
   }
}
