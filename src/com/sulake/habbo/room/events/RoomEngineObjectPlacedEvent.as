package com.sulake.habbo.room.events
{
   public class RoomEngineObjectPlacedEvent extends RoomEngineObjectEvent
   {
       
      
      private var _wallLocation:String = "";
      
      private var var_29:Number = 0;
      
      private var var_28:Number = 0;
      
      private var var_30:Number = 0;
      
      private var _direction:int = 0;
      
      private var _placedInRoom:Boolean = false;
      
      private var _placedOnFloor:Boolean = false;
      
      private var _placedOnWall:Boolean = false;
      
      private var var_4123:String = null;
      
      public function RoomEngineObjectPlacedEvent(param1:String, param2:int, param3:int, param4:int, param5:String, param6:Number, param7:Number, param8:Number, param9:int, param10:Boolean, param11:Boolean, param12:Boolean, param13:String, param14:Boolean = false, param15:Boolean = false)
      {
         super(param1,param2,param3,param4,param14,param15);
         _wallLocation = param5;
         var_29 = param6;
         var_28 = param7;
         var_30 = param8;
         _direction = param9;
         _placedInRoom = param10;
         _placedOnFloor = param11;
         _placedOnWall = param12;
         var_4123 = param13;
      }
      
      public function get wallLocation() : String
      {
         return _wallLocation;
      }
      
      public function get x() : Number
      {
         return var_29;
      }
      
      public function get y() : Number
      {
         return var_28;
      }
      
      public function get z() : Number
      {
         return var_30;
      }
      
      public function get direction() : int
      {
         return _direction;
      }
      
      public function get placedInRoom() : Boolean
      {
         return _placedInRoom;
      }
      
      public function get placedOnFloor() : Boolean
      {
         return _placedOnFloor;
      }
      
      public function get placedOnWall() : Boolean
      {
         return _placedOnWall;
      }
      
      public function get instanceData() : String
      {
         return var_4123;
      }
   }
}
