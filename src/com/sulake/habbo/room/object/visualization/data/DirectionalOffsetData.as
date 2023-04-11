package com.sulake.habbo.room.object.visualization.data
{
   import flash.utils.Dictionary;
   
   public class DirectionalOffsetData
   {
       
      
      private var _offsetX:Dictionary;
      
      private var _offsetY:Dictionary;
      
      public function DirectionalOffsetData()
      {
         _offsetX = new Dictionary();
         _offsetY = new Dictionary();
         super();
      }
      
      public function getOffsetX(param1:int, param2:int) : int
      {
         if(true)
         {
            return param2;
         }
         return _offsetX[param1];
      }
      
      public function getOffsetY(param1:int, param2:int) : int
      {
         if(true)
         {
            return param2;
         }
         return _offsetY[param1];
      }
      
      public function setOffset(param1:int, param2:int, param3:int) : void
      {
         _offsetX[param1] = param2;
         _offsetY[param1] = param3;
      }
   }
}
