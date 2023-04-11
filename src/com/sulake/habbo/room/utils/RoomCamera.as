package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const MOVE_SPEED_DENOMINATOR:Number = 12;
       
      
      private var var_882:int = -1;
      
      private var var_3812:int = -2;
      
      private var var_1609:Vector3d = null;
      
      private var var_2860:Number = 0;
      
      private var var_3027:Number = 0;
      
      private var var_3432:Boolean = false;
      
      private var var_1570:Vector3d = null;
      
      private var var_3629:Vector3d;
      
      private var var_3843:Boolean = false;
      
      private var var_4057:Boolean = false;
      
      private var var_4160:Boolean = false;
      
      private var var_4030:Boolean = false;
      
      private var var_4236:int = 0;
      
      private var var_3955:int = 0;
      
      private var var_757:int = 0;
      
      private var var_4042:int = 0;
      
      private var var_3842:int = 0;
      
      private var var_3173:int = -1;
      
      private var var_3204:Boolean = false;
      
      private var _followDuration:int;
      
      public function RoomCamera()
      {
         var_3629 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return var_1570;
      }
      
      public function get targetId() : int
      {
         return var_882;
      }
      
      public function get targetCategory() : int
      {
         return var_3812;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return var_3629;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_3843;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_4057;
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_4160;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_4030;
      }
      
      public function get screenWd() : int
      {
         return var_4236;
      }
      
      public function get screenHt() : int
      {
         return var_3955;
      }
      
      public function get scale() : int
      {
         return var_757;
      }
      
      public function get roomWd() : int
      {
         return var_4042;
      }
      
      public function get roomHt() : int
      {
         return var_3842;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_3173;
      }
      
      public function get isMoving() : Boolean
      {
         if(var_1609 != null && var_1570 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         var_882 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         var_3629.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_3812 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_3843 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_4057 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_4160 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_4030 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_4236 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_3955 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(var_757 != param1)
         {
            var_757 = param1;
            var_3204 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         var_4042 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_3842 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_3173 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:Vector3d = null;
         if(var_1609 == null)
         {
            var_1609 = new Vector3d();
         }
         if(var_1609.x != param1.x || var_1609.y != param1.y || var_1609.z != param1.z)
         {
            var_1609.assign(param1);
            _loc2_ = Vector3d.dif(var_1609,var_1570);
            var_2860 = _loc2_.length;
            var_3432 = true;
         }
      }
      
      public function dispose() : void
      {
         var_1609 = null;
         var_1570 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_1570 != null)
         {
            return;
         }
         var_1570 = new Vector3d();
         var_1570.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(var_1570 == null)
         {
            var_1570 = new Vector3d();
         }
         var_1570.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc4_:Vector3d = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc7_:Number = NaN;
         if(_followDuration > 0 && var_1609 != null && var_1570 != null)
         {
            if(var_3204)
            {
               var_3204 = false;
               var_1570 = var_1609;
               var_1609 = null;
               return;
            }
            if((_loc4_ = Vector3d.dif(var_1609,var_1570)).length > var_2860)
            {
               var_2860 = _loc4_.length;
            }
            if(_loc4_.length <= param2)
            {
               var_1570 = var_1609;
               var_1609 = null;
               var_3027 = 0;
            }
            else
            {
               _loc5_ = Math.sin(3.141592653589793 * _loc4_.length / var_2860);
               _loc6_ = param2 * 0.5;
               _loc3_ = var_2860 / 12;
               _loc7_ = _loc6_ + (_loc3_ - _loc6_) * _loc5_;
               if(var_3432)
               {
                  if(_loc7_ < var_3027)
                  {
                     if((_loc7_ = var_3027) > _loc4_.length)
                     {
                        _loc7_ = _loc4_.length;
                     }
                  }
                  else
                  {
                     var_3432 = false;
                  }
               }
               var_3027 = _loc7_;
               _loc4_.div(_loc4_.length);
               _loc4_.mul(_loc7_);
               var_1570 = Vector3d.sum(var_1570,_loc4_);
            }
         }
      }
      
      public function reset() : void
      {
         var_3173 = -1;
      }
      
      public function activateFollowing(param1:int) : void
      {
         _followDuration = param1;
      }
   }
}
