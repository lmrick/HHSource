package com.sulake.habbo.roomevents
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   
   public class Util
   {
       
      
      public function Util()
      {
         super();
      }
      
      public static function setProcDirectly(param1:class_3127, param2:Function) : void
      {
         param1.setParamFlag(1,true);
         param1.procedure = param2;
      }
      
      public static function getLowestPoint(param1:class_3151) : int
      {
         var _loc2_:int = 0;
         var _loc4_:class_3127 = null;
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.numChildren)
         {
            if((_loc4_ = param1.getChildAt(_loc2_)).visible)
            {
               _loc3_ = Math.max(_loc3_,_loc4_.y + _loc4_.height);
            }
            _loc2_++;
         }
         return _loc3_;
      }
      
      public static function hideChildren(param1:class_3151) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.numChildren)
         {
            param1.getChildAt(_loc2_).visible = false;
            _loc2_++;
         }
      }
      
      public static function showChildren(param1:class_3151) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.numChildren)
         {
            param1.getChildAt(_loc2_).visible = true;
            _loc2_++;
         }
      }
      
      public static function moveChildrenToColumn(param1:class_3151, param2:Array, param3:int, param4:int) : void
      {
         var _loc6_:class_3127 = null;
         for each(var _loc5_ in param2)
         {
            if((_loc6_ = param1.getChildByName(_loc5_)) != null && _loc6_.visible && _loc6_.height > 0)
            {
               _loc6_.y = param3;
               param3 += _loc6_.height + param4;
            }
         }
      }
      
      public static function moveAllChildrenToColumn(param1:class_3151, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:class_3127 = null;
         while(_loc4_ < param1.numChildren)
         {
            if((_loc5_ = param1.getChildAt(_loc4_)) != null && _loc5_.visible && _loc5_.height > 0)
            {
               _loc5_.y = param2;
               param2 += _loc5_.height + param3;
            }
            _loc4_++;
         }
      }
   }
}
