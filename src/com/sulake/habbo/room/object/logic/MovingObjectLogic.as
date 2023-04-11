package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const DEFAULT_UPDATE_INTERVAL:int = 500;
      
      private static var helper_vector:Vector3d = new Vector3d();
       
      
      private var var_1771:Vector3d;
      
      private var var_537:Vector3d;
      
      private var _liftAmount:Number = 0;
      
      private var _lastUpdateTime:int = 0;
      
      private var _changeTime:int;
      
      private var var_2675:int = 500;
      
      public function MovingObjectLogic()
      {
         var_1771 = new Vector3d();
         var_537 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return _lastUpdateTime;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_537 = null;
         var_1771 = null;
      }
      
      override public function set object(param1:IRoomObjectController) : void
      {
         super.object = param1;
         if(param1 != null)
         {
            var_537.assign(param1.getLocation());
         }
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         var_2675 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:IVector3d = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ != null && _loc2_.skipPositionUpdate)
         {
            return;
         }
         if(param1.loc != null)
         {
            var_537.assign(param1.loc);
         }
         if(param1.loc != null)
         {
            var_1771.x = 0;
            var_1771.y = 0;
            var_1771.z = 0;
         }
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               _loc3_ = _loc2_.targetLoc;
               moveUpdateInterval = isNaN(_loc2_.animationTime) ? 500 : _loc2_.animationTime;
               _changeTime = _lastUpdateTime;
               var_1771.assign(_loc3_);
               var_1771.sub(var_537);
            }
         }
      }
      
      protected function getLocationOffset() : IVector3d
      {
         return null;
      }
      
      override public function update(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:IVector3d = getLocationOffset();
         var _loc4_:IRoomObjectModelController;
         if((_loc4_ = object.getModelController()) != null)
         {
            if(_loc2_ != null)
            {
               if(_liftAmount != _loc2_.z)
               {
                  _liftAmount = _loc2_.z;
                  _loc4_.setNumber("furniture_lift_amount",_liftAmount);
               }
            }
            else if(_liftAmount != 0)
            {
               _liftAmount = 0;
               _loc4_.setNumber("furniture_lift_amount",_liftAmount);
            }
         }
         if(_loc2_ != null)
         {
            _loc3_ = param1 - _changeTime;
            if(_loc3_ == var_2675 >> 1)
            {
               _loc3_++;
            }
            if(_loc3_ > var_2675)
            {
               _loc3_ = var_2675;
            }
            if(false)
            {
               helper_vector.assign(var_1771);
               helper_vector.mul(_loc3_ / var_2675);
               helper_vector.add(var_537);
            }
            else
            {
               helper_vector.assign(var_537);
            }
            if(_loc2_ != null)
            {
               helper_vector.add(_loc2_);
            }
            if(object != null)
            {
               object.setLocation(helper_vector);
            }
            if(_loc3_ == var_2675)
            {
               var_1771.x = 0;
               var_1771.y = 0;
               var_1771.z = 0;
            }
         }
         _lastUpdateTime = param1;
      }
   }
}
