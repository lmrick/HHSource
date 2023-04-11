package com.sulake.room.renderer
{
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.class_24;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.utils.RoomGeometry;
   import flash.utils.getTimer;
   
   [SecureSWF(rename="true")]
   public class RoomRenderer implements IRoomRenderer, IRoomSpriteCanvasContainer
   {
       
      
      private var var_129:class_24;
      
      private var var_1627:class_24;
      
      private var var_1460:class_20;
      
      private var _disposed:Boolean = false;
      
      private var var_3769:String = null;
      
      public function RoomRenderer(param1:class_20)
      {
         super();
         var_129 = new class_24();
         var_1627 = new class_24();
         if(param1 != null)
         {
            var_1460 = param1;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get roomObjectVariableAccurateZ() : String
      {
         return var_3769;
      }
      
      public function set roomObjectVariableAccurateZ(param1:String) : void
      {
         var_3769 = param1;
      }
      
      public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc1_:class_3398 = null;
         if(disposed)
         {
            return;
         }
         if(var_1627 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_1627.length)
            {
               _loc1_ = var_1627.getWithIndex(_loc2_) as class_3398;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc2_++;
            }
            var_1627.dispose();
            var_1627 = null;
         }
         if(var_129 != null)
         {
            var_129.dispose();
            var_129 = null;
         }
         if(var_1460 != null)
         {
            var_1460 = null;
         }
         _disposed = true;
      }
      
      public function reset() : void
      {
         var_129.reset();
      }
      
      public function getRoomObjectIdentifier(param1:IRoomObject) : String
      {
         if(param1 != null)
         {
            return String(param1.getInstanceId());
         }
         return null;
      }
      
      public function feedRoomObject(param1:IRoomObject) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_129.add(getRoomObjectIdentifier(param1),param1);
      }
      
      public function removeRoomObject(param1:IRoomObject) : void
      {
         var _loc3_:int = 0;
         var _loc2_:class_3398 = null;
         var _loc4_:String = getRoomObjectIdentifier(param1);
         var_129.remove(_loc4_);
         _loc3_ = 0;
         while(_loc3_ < var_1627.length)
         {
            _loc2_ = var_1627.getWithIndex(_loc3_) as class_3398;
            if(_loc2_ != null)
            {
               _loc2_.roomObjectRemoved(_loc4_);
            }
            _loc3_++;
         }
      }
      
      public function getRoomObject(param1:String) : IRoomObject
      {
         return var_129.getValue(param1) as IRoomObject;
      }
      
      public function getRoomObjectWithIndex(param1:int) : IRoomObject
      {
         return var_129.getWithIndex(param1) as IRoomObject;
      }
      
      public function getRoomObjectIdWithIndex(param1:int) : String
      {
         return var_129.getKey(param1) as String;
      }
      
      public function getRoomObjectCount() : int
      {
         return var_129.length;
      }
      
      public function render() : void
      {
         var _loc3_:int = 0;
         var _loc2_:IRoomRenderingCanvas = null;
         var _loc1_:int = getTimer();
         ErrorReportStorage.addDebugData("Canvas count","null");
         _loc3_ = -1;
         while(_loc3_ >= 0)
         {
            _loc2_ = var_1627.getWithIndex(_loc3_) as IRoomRenderingCanvas;
            if(_loc2_ != null)
            {
               _loc2_.render(_loc1_);
            }
            _loc3_--;
         }
      }
      
      public function createCanvas(param1:int, param2:int, param3:int, param4:int) : IRoomRenderingCanvas
      {
         var _loc6_:RoomGeometry = null;
         var _loc5_:IRoomRenderingCanvas;
         if((_loc5_ = var_1627.getValue(String(param1)) as IRoomRenderingCanvas) != null)
         {
            _loc5_.initialize(param2,param3);
            if(_loc6_ = _loc5_.geometry as RoomGeometry)
            {
               _loc6_.scale = param4;
            }
            return _loc5_;
         }
         _loc5_ = createCanvasInstance(param1,param2,param3,param4);
         var_1627.add(String(param1),_loc5_);
         return _loc5_;
      }
      
      protected function createCanvasInstance(param1:int, param2:int, param3:int, param4:int) : IRoomRenderingCanvas
      {
         return new class_3404(this,param1,param2,param3,param4);
      }
      
      public function getCanvas(param1:int) : IRoomRenderingCanvas
      {
         return var_1627.getValue(String(param1)) as IRoomRenderingCanvas;
      }
      
      public function disposeCanvas(param1:int) : Boolean
      {
         var _loc2_:class_3398 = var_1627.remove(String(param1)) as class_3398;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
         }
         return false;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:int = 0;
         var _loc2_:class_3398 = null;
         render();
         _loc3_ = -1;
         while(_loc3_ >= 0)
         {
            _loc2_ = var_1627.getWithIndex(_loc3_) as class_3398;
            if(_loc2_ != null)
            {
               _loc2_.update();
            }
            _loc3_--;
         }
      }
   }
}
