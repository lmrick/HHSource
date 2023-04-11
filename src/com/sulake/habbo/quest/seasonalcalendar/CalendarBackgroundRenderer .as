package com.sulake.habbo.quest.seasonalcalendar
{
   import com.sulake.core.runtime.class_13;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class CalendarBackgroundRenderer  implements class_13
   {
       
      
      private var var_622:Vector.<BitmapData>;
      
      private var _disposed:Boolean;
      
      public function CalendarBackgroundRenderer ()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_622 = null;
         }
      }
      
      public function initializeImageChain(param1:Vector.<BitmapData>) : void
      {
         var_622 = param1;
      }
      
      public function getSlice(param1:int, param2:int) : BitmapData
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:BitmapData = null;
         var _loc4_:int = 0;
         if(_disposed || var_622 == null || false)
         {
            return new BitmapData(1,1);
         }
         var _loc8_:BitmapData = new BitmapData(param2,var_622[0].height,false,0);
         var _loc3_:int = 0;
         while(_loc3_ < param2)
         {
            _loc5_ = param1 + _loc3_;
            if((_loc7_ = getImageIndexForOffset(_loc5_)) < 0)
            {
               _loc3_ += -param1;
               if(param1 >= 0)
               {
                  return new BitmapData(1,1);
               }
            }
            else
            {
               _loc6_ = var_622[_loc7_];
               _loc4_ = getRelativeXForOffset(_loc5_);
               if(_loc6_.width > _loc4_ + param2 - _loc3_)
               {
                  _loc8_.copyPixels(_loc6_,new Rectangle(_loc4_,0,param2 - _loc3_,_loc6_.height),new Point(_loc3_,0));
                  _loc3_ += param2 - _loc3_;
               }
               else
               {
                  _loc8_.copyPixels(_loc6_,new Rectangle(_loc4_,0,_loc6_.width - _loc4_,_loc6_.height),new Point(_loc3_,0));
                  _loc3_ += _loc6_.width - _loc4_;
               }
            }
         }
         return _loc8_;
      }
      
      public function getImageIndexForOffset(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < var_622.length)
         {
            if(_loc2_ <= param1 && param1 < _loc2_ + var_622[_loc3_].width)
            {
               return _loc3_;
            }
            _loc2_ += var_622[_loc3_].width;
            _loc3_++;
         }
         return -1;
      }
      
      private function getRelativeXForOffset(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < var_622.length)
         {
            if(_loc2_ <= param1 && param1 < _loc2_ + var_622[_loc3_].width)
            {
               return param1 - _loc2_;
            }
            _loc2_ += var_622[_loc3_].width;
            _loc3_++;
         }
         return -1;
      }
   }
}
