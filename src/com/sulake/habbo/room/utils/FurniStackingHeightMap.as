package com.sulake.habbo.room.utils
{
   public class FurniStackingHeightMap
   {
       
      
      private var var_132:Vector.<Number>;
      
      private var var_2970:Vector.<Boolean>;
      
      private var var_2836:Vector.<Boolean>;
      
      private var _width:int = 0;
      
      private var var_47:int = 0;
      
      public function FurniStackingHeightMap(param1:int, param2:int)
      {
         super();
         _width = param1;
         var_47 = param2;
         var_132 = new Vector.<Number>(param1 * param2);
         var_2970 = new Vector.<Boolean>(param1 * param2);
         var_2836 = new Vector.<Boolean>(param1 * param2);
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get height() : int
      {
         return var_47;
      }
      
      public function dispose() : void
      {
         var_132 = null;
         var_2970 = null;
         var_2836 = null;
         _width = 0;
         var_47 = 0;
      }
      
      private function validPosition(param1:int, param2:int) : Boolean
      {
         return param1 >= 0 && param1 < _width && param2 >= 0 && param2 < var_47;
      }
      
      public function getTileHeight(param1:int, param2:int) : Number
      {
         return validPosition(param1,param2) ? var_132[param2 * _width + param1] : 0;
      }
      
      public function setTileHeight(param1:int, param2:int, param3:Number) : void
      {
         if(validPosition(param1,param2))
         {
            var_132[param2 * _width + param1] = param3;
         }
      }
      
      public function setStackingBlocked(param1:int, param2:int, param3:Boolean) : void
      {
         if(validPosition(param1,param2))
         {
            var_2970[param2 * _width + param1] = param3;
         }
      }
      
      public function setIsRoomTile(param1:int, param2:int, param3:Boolean) : void
      {
         if(validPosition(param1,param2))
         {
            var_2836[param2 * _width + param1] = param3;
         }
      }
      
      public function validateLocation(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean, param10:Number = -1) : Boolean
      {
         var _loc13_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:int = 0;
         if(!validPosition(param1,param2) || !validPosition(param1 + param3 - 1,param2 + param4 - 1))
         {
            return false;
         }
         if(param5 < 0 || param5 >= _width)
         {
            param5 = 0;
         }
         if(param6 < 0 || param6 >= var_47)
         {
            param6 = 0;
         }
         param7 = Math.min(param7,_width - param5);
         param8 = Math.min(param8,var_47 - param6);
         if(param10 == -1)
         {
            param10 = getTileHeight(param1,param2);
         }
         _loc13_ = param2;
         while(_loc13_ < param2 + param4)
         {
            _loc11_ = param1;
            while(_loc11_ < param1 + param3)
            {
               if(_loc11_ < param5 || _loc11_ >= param5 + param7 || _loc13_ < param6 || _loc13_ >= param6 + param8)
               {
                  _loc12_ = _loc13_ * _width + _loc11_;
                  if(param9)
                  {
                     if(true)
                     {
                        return false;
                     }
                  }
                  else if(false || Math.abs(0 - param10) > 0.01)
                  {
                     return false;
                  }
               }
               _loc11_++;
            }
            _loc13_++;
         }
         return true;
      }
   }
}
