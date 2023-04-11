package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.*;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_3749:int = 0;
       
      
      private var var_247:int;
      
      private var var_271:String = "";
      
      private var var_537:Vector3d;
      
      private var var_386:Vector3d;
      
      private var var_3538:Vector3d;
      
      private var var_3475:Vector3d;
      
      private var var_2138:Array;
      
      private var var_1443:com.sulake.room.object.RoomObjectModel;
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_1878:IRoomObjectEventHandler;
      
      private var var_1454:int;
      
      private var _avatarLibraryAssetName:String;
      
      private var var_3728:int = 0;
      
      private var var_1420:Boolean = false;
      
      public function RoomObject(param1:int, param2:int, param3:String)
      {
         var _loc4_:Number = NaN;
         super();
         var_247 = param1;
         var_537 = new Vector3d();
         var_386 = new Vector3d();
         var_3538 = new Vector3d();
         var_3475 = new Vector3d();
         var_2138 = new Array(param2);
         _loc4_ = param2 - 1;
         while(_loc4_ >= 0)
         {
            var_2138[_loc4_] = 0;
            _loc4_--;
         }
         var_271 = param3;
         var_1443 = new com.sulake.room.object.RoomObjectModel();
         _visualization = null;
         var_1878 = null;
         var_1454 = 0;
         var_3728 = var_3749++;
      }
      
      public function dispose() : void
      {
         var_537 = null;
         var_386 = null;
         var_2138 = null;
         _avatarLibraryAssetName = null;
         setVisualization(null);
         setEventHandler(null);
         if(var_1443 != null)
         {
            var_1443.dispose();
            var_1443 = null;
         }
      }
      
      public function setInitialized(param1:Boolean) : void
      {
         var_1420 = param1;
      }
      
      public function isInitialized() : Boolean
      {
         return var_1420;
      }
      
      public function getId() : int
      {
         return var_247;
      }
      
      public function getInstanceId() : int
      {
         return var_3728;
      }
      
      public function getType() : String
      {
         return var_271;
      }
      
      public function getLocation() : IVector3d
      {
         var_3538.assign(var_537);
         return var_3538;
      }
      
      public function getDirection() : IVector3d
      {
         var_3475.assign(var_386);
         return var_3475;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return var_1443;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return var_1443;
      }
      
      public function getState(param1:int) : int
      {
         if(param1 >= 0 && param1 < var_2138.length)
         {
            return var_2138[param1];
         }
         return -1;
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return _visualization;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_537.x != param1.x || var_537.y != param1.y || var_537.z != param1.z)
         {
            var_537.x = param1.x;
            var_537.y = param1.y;
            var_537.z = param1.z;
            var_1454++;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_386.x != param1.x || var_386.y != param1.y || var_386.z != param1.z)
         {
            var_386.x = (param1.x % 360 + 360) % 360;
            var_386.y = (param1.y % 360 + 360) % 360;
            var_386.z = (param1.z % 360 + 360) % 360;
            var_1454++;
         }
      }
      
      public function setState(param1:int, param2:int) : Boolean
      {
         if(param2 >= 0 && param2 < var_2138.length)
         {
            if(var_2138[param2] != param1)
            {
               var_2138[param2] = param1;
               var_1454++;
            }
            return true;
         }
         return false;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != _visualization)
         {
            if(_visualization != null)
            {
               _visualization.dispose();
            }
            _visualization = param1;
            if(_visualization != null)
            {
               _visualization.object = this;
            }
         }
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == var_1878)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = var_1878;
         if(_loc2_ != null)
         {
            var_1878 = null;
            _loc2_.object = null;
         }
         var_1878 = param1;
         if(var_1878 != null)
         {
            var_1878.object = this;
         }
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return var_1878;
      }
      
      public function getUpdateID() : int
      {
         return var_1454;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return getEventHandler();
      }
      
      public function getAvatarLibraryAssetName() : String
      {
         if(!_avatarLibraryAssetName)
         {
            _avatarLibraryAssetName = "avatar_" + getId();
         }
         return _avatarLibraryAssetName;
      }
      
      public function tearDown() : void
      {
         if(var_1878)
         {
            var_1878.tearDown();
         }
      }
   }
}
