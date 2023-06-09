package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   
   public interface IRoomObjectController extends IRoomObject
   {
       
      
      function dispose() : void;
      
      function setInitialized(param1:Boolean) : void;
      
      function setLocation(param1:IVector3d) : void;
      
      function setDirection(param1:IVector3d) : void;
      
      function setVisualization(param1:IRoomObjectVisualization) : void;
      
      function setState(param1:int, param2:int) : Boolean;
      
      function setEventHandler(param1:IRoomObjectEventHandler) : void;
      
      function getEventHandler() : IRoomObjectEventHandler;
      
      function getModelController() : IRoomObjectModelController;
   }
}
