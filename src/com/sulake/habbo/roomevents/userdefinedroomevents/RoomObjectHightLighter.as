package com.sulake.habbo.roomevents.userdefinedroomevents
{
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
   import flash.display.Shader;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.ShaderFilter;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class RoomObjectHightLighter
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var _filterBW:Array;
      
      public function RoomObjectHightLighter(param1:HabboUserDefinedRoomEvents)
      {
         var _loc6_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc11_:Array = null;
         var _loc9_:ColorMatrixFilter = null;
         var _loc3_:Class = null;
         var _loc2_:Shader = null;
         var _loc4_:ShaderFilter = null;
         super();
         _roomEvents = param1;
         _loc6_ = 154;
         _loc5_ = 0.75;
         _loc12_ = 25.5;
         _loc8_ = 25.5;
         _loc11_ = [1 - _loc5_,0,0,0,_loc5_ * _loc6_,0,1 - _loc5_,0,0,_loc5_ * _loc6_ + _loc12_,0,0,1 - _loc5_,0,_loc5_ * _loc6_ + _loc8_,0,0,0,1,0];
         _loc9_ = new ColorMatrixFilter(_loc11_);
         _loc3_ = furnitureFilter_pbj$5b51dd400f82d19cd3c27c61e8dd09011566352002;
         _loc2_ = new Shader(new _loc3_() as ByteArray);
         _loc4_ = new ShaderFilter(_loc2_);
         _filterBW = [_loc9_,_loc4_];
      }
      
      public function hide(param1:int) : void
      {
         inactivateFurni(getFurni(param1));
      }
      
      public function hideAll(param1:Dictionary) : void
      {
         for(var _loc2_ in param1)
         {
            class_14.log("Show furni as unselected: " + _loc2_);
            inactivateFurni(getFurni(parseInt(_loc2_)));
         }
      }
      
      public function show(param1:int) : void
      {
         activateFurni(getFurni(param1));
      }
      
      public function showAll(param1:Dictionary) : void
      {
         for(var _loc2_ in param1)
         {
            class_14.log("Show furni as selected: " + _loc2_);
            activateFurni(getFurni(parseInt(_loc2_)));
         }
      }
      
      private function getFurni(param1:int) : IRoomObject
      {
         return _roomEvents.roomEngine.getRoomObject(_roomEvents.roomId,param1,10);
      }
      
      private function activateFurni(param1:IRoomObject) : void
      {
         var _loc2_:IRoomObjectSpriteVisualization = null;
         var _loc4_:int = 0;
         var _loc3_:IRoomObjectSprite = null;
         if(param1)
         {
            _loc2_ = param1.getVisualization() as IRoomObjectSpriteVisualization;
            class_14.log("Furni visualization: " + _loc2_);
            _loc4_ = 0;
            while(_loc4_ < _loc2_.spriteCount)
            {
               _loc3_ = _loc2_.getSprite(_loc4_);
               if(_loc3_.blendMode != "add")
               {
                  _loc3_.filters = _filterBW;
               }
               _loc4_++;
            }
         }
      }
      
      private function inactivateFurni(param1:IRoomObject) : void
      {
         var _loc2_:IRoomObjectSpriteVisualization = null;
         var _loc4_:int = 0;
         var _loc3_:IRoomObjectSprite = null;
         if(param1)
         {
            _loc2_ = param1.getVisualization() as IRoomObjectSpriteVisualization;
            class_14.log("Furni visualization: " + _loc2_);
            _loc4_ = 0;
            while(_loc4_ < _loc2_.spriteCount)
            {
               _loc3_ = _loc2_.getSprite(_loc4_);
               _loc3_.filters = [];
               _loc4_++;
            }
         }
      }
   }
}
