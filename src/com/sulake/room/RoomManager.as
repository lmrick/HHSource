package com.sulake.room
{
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.utils.class_24;
   import com.sulake.iid.*;
   import com.sulake.room.events.RoomContentLoadedEvent;
   import com.sulake.room.exceptions.RoomManagerException;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectVisualizationFactory;
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import flash.utils.getTimer;
   
   public class RoomManager extends class_20 implements IRoomManager, IRoomInstanceContainer
   {
      
      public static const ROOM_MANAGER_ERROR:int = -1;
      
      public static const ROOM_MANAGER_LOADING:int = 0;
      
      public static const ROOM_MANAGER_LOADED:int = 1;
      
      public static const ROOM_MANAGER_INITIALIZING:int = 2;
      
      public static const ROOM_MANAGER_INITIALIZED:int = 3;
      
      private static const CONTENT_PROCESSING_TIME_LIMIT_MILLISECONDS:int = 40;
       
      
      private var _rooms:class_24;
      
      private var var_1486:com.sulake.room.IRoomContentLoader;
      
      private var var_2192:Vector.<String>;
      
      private var var_2151:Vector.<int>;
      
      private var var_2675:int;
      
      private var var_79:com.sulake.room.IRoomManagerListener;
      
      private var _objectFactory:com.sulake.room.IRoomObjectFactory = null;
      
      private var _visualizationFactory:IRoomObjectVisualizationFactory = null;
      
      private var var_159:int = 0;
      
      private var var_2853:XML = null;
      
      private var var_2724:Vector.<String>;
      
      private var _skipContentProcessingForNextFrame:Boolean = false;
      
      private var var_3991:Boolean = true;
      
      private var _disposed:Boolean = false;
      
      public function RoomManager(param1:class_31, param2:uint = 0)
      {
         var_2724 = new Vector.<String>();
         super(param1,param2);
         _rooms = new class_24();
         var_2192 = new Vector.<String>();
         var_2151 = new Vector.<int>();
         events.addEventListener("RCLE_SUCCESS",onContentLoaded);
         events.addEventListener("RCLE_FAILURE",onContentLoaded);
         events.addEventListener("RCLE_CANCEL",onContentLoaded);
      }
      
      override public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set limitContentProcessing(param1:Boolean) : void
      {
         var_3991 = param1;
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDRoomObjectFactory(),function(param1:com.sulake.room.IRoomObjectFactory):void
         {
            _objectFactory = param1;
         }),new ComponentDependency(new IIDRoomObjectVisualizationFactory(),function(param1:IRoomObjectVisualizationFactory):void
         {
            _visualizationFactory = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         var _loc1_:XML = null;
         var_159 = 1;
         if(var_2853 != null)
         {
            _loc1_ = var_2853;
            var_2853 = null;
            initialize(_loc1_,var_79);
         }
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(_rooms != null)
         {
            for each(var _loc1_ in _rooms)
            {
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
            }
            _rooms.dispose();
            _rooms = null;
         }
         var_79 = null;
         var_2192 = null;
         var_2151 = null;
         var_1486 = null;
         super.dispose();
      }
      
      public function initialize(param1:XML, param2:com.sulake.room.IRoomManagerListener) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         if(var_159 == 0)
         {
            if(var_2853 != null)
            {
               return false;
            }
            var_2853 = param1;
            var_79 = param2;
            return true;
         }
         if(var_159 >= 2)
         {
            return false;
         }
         if(param1 == null)
         {
            return false;
         }
         if(var_1486 == null)
         {
            return false;
         }
         var_2675 = 50;
         var_79 = param2;
         var _loc3_:Array = var_1486.getPlaceHolderTypes();
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = String(_loc3_[_loc4_]);
            if(var_2192.indexOf(_loc5_) < 0)
            {
               var_1486.loadObjectContent(_loc5_,events);
               var_2192.push(_loc5_);
            }
            _loc4_++;
         }
         var_159 = 2;
         return true;
      }
      
      public function setContentLoader(param1:com.sulake.room.IRoomContentLoader) : void
      {
         if(var_1486 != null)
         {
            var_1486.dispose();
         }
         var_1486 = param1;
      }
      
      public function addObjectUpdateCategory(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:RoomInstance = null;
         var _loc2_:int = var_2151.indexOf(param1);
         if(_loc2_ >= 0)
         {
            return;
         }
         var_2151.push(param1);
         _loc3_ = -1;
         while(_loc3_ >= 0)
         {
            if((_loc4_ = _rooms.getWithIndex(_loc3_) as RoomInstance) != null)
            {
               _loc4_.addObjectUpdateCategory(param1);
            }
            _loc3_--;
         }
      }
      
      public function removeObjectUpdateCategory(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:RoomInstance = null;
         var _loc2_:int = var_2151.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         var_2151.splice(_loc2_,1);
         _loc3_ = -1;
         while(_loc3_ >= 0)
         {
            if((_loc4_ = _rooms.getWithIndex(_loc3_) as RoomInstance) != null)
            {
               _loc4_.removeObjectUpdateCategory(param1);
            }
            _loc3_--;
         }
      }
      
      public function createRoom(param1:String, param2:XML) : IRoomInstance
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(var_159 < 3)
         {
            throw new RoomManagerException();
         }
         if(_rooms.getValue(param1) != null)
         {
            return null;
         }
         var _loc5_:RoomInstance = new RoomInstance(param1,this);
         _rooms.add(param1,_loc5_);
         _loc3_ = -1;
         while(_loc3_ >= 0)
         {
            _loc4_ = 0;
            _loc5_.addObjectUpdateCategory(_loc4_);
            _loc3_--;
         }
         return _loc5_;
      }
      
      public function getRoom(param1:String) : IRoomInstance
      {
         return _rooms.getValue(param1) as IRoomInstance;
      }
      
      public function getRoomWithIndex(param1:int) : IRoomInstance
      {
         return _rooms.getWithIndex(param1);
      }
      
      public function getRoomCount() : int
      {
         return _rooms.length;
      }
      
      public function disposeRoom(param1:String) : Boolean
      {
         var _loc2_:IRoomInstance = _rooms.remove(param1) as IRoomInstance;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            return true;
         }
         return false;
      }
      
      public function createRoomObject(param1:String, param2:int, param3:String, param4:int) : IRoomObject
      {
         if(var_159 < 3)
         {
            throw new RoomManagerException();
         }
         var _loc11_:IRoomInstance;
         if((_loc11_ = getRoom(param1)) == null)
         {
            return null;
         }
         if(var_1486 == null)
         {
            return null;
         }
         var _loc7_:RoomInstance;
         if((_loc7_ = _loc11_ as RoomInstance) == null)
         {
            return null;
         }
         var _loc10_:IGraphicAssetCollection = null;
         var _loc15_:XML = null;
         var _loc12_:XML = null;
         var _loc9_:* = null;
         var _loc14_:* = null;
         var _loc5_:* = param3;
         var _loc16_:Boolean = false;
         if(!var_1486.hasInternalContent(param3))
         {
            if((_loc10_ = var_1486.getGraphicAssetCollection(param3)) == null)
            {
               _loc16_ = true;
               var_1486.loadObjectContent(param3,events);
               _loc5_ = var_1486.getPlaceHolderType(param3);
               _loc10_ = var_1486.getGraphicAssetCollection(_loc5_);
            }
            _loc15_ = var_1486.getVisualizationXML(_loc5_);
            _loc12_ = var_1486.getLogicXML(_loc5_);
            if(_loc15_ == null || _loc10_ == null)
            {
               return null;
            }
            _loc9_ = var_1486.getVisualizationType(_loc5_);
            _loc14_ = var_1486.getLogicType(_loc5_);
         }
         else
         {
            _loc9_ = param3;
            _loc14_ = param3;
         }
         var _loc17_:int = 1;
         var _loc13_:IRoomObjectController;
         var _loc19_:IRoomObject;
         if((_loc13_ = (_loc19_ = _loc7_.createObjectInternal(param2,_loc17_,param3,param4)) as IRoomObjectController) == null)
         {
            return null;
         }
         var _loc8_:IRoomObjectGraphicVisualization;
         if((_loc8_ = _visualizationFactory.createRoomObjectVisualization(_loc9_)) == null)
         {
            _loc11_.disposeObject(param2,param4);
            return null;
         }
         _loc8_.assetCollection = _loc10_;
         _loc8_.setExternalBaseUrls(context.configuration.getProperty("stories.image_url_base"),context.configuration.getProperty("extra_data_service_url"),context.configuration.getBoolean("extra_data_batches_enabled"));
         var _loc6_:IRoomObjectVisualizationData = null;
         _loc6_ = _visualizationFactory.getRoomObjectVisualizationData(_loc5_,_loc9_,_loc15_);
         if(!_loc8_.initialize(_loc6_))
         {
            _loc11_.disposeObject(param2,param4);
            return null;
         }
         _loc13_.setVisualization(_loc8_);
         var _loc18_:IRoomObjectEventHandler = _objectFactory.createRoomObjectLogic(_loc14_);
         _loc13_.setEventHandler(_loc18_);
         if(_loc18_ != null && _loc12_ != null)
         {
            _loc18_.initialize(_loc12_);
         }
         if(!_loc16_)
         {
            _loc13_.setInitialized(true);
         }
         var_1486.roomObjectCreated(_loc13_,param1);
         return _loc13_;
      }
      
      public function createRoomObjectManager() : IRoomObjectManager
      {
         if(_objectFactory != null)
         {
            return _objectFactory.createRoomObjectManager();
         }
         return null;
      }
      
      public function isContentAvailable(param1:String) : Boolean
      {
         if(var_1486 != null)
         {
            if(var_1486.getGraphicAssetCollection(param1) != null)
            {
               return true;
            }
         }
         return false;
      }
      
      private function processInitialContentLoad(param1:String) : void
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(var_159 == -1)
         {
            return;
         }
         if(var_1486 == null)
         {
            var_159 = -1;
            return;
         }
         if(var_1486.getGraphicAssetCollection(param1) != null)
         {
            _loc2_ = var_2192.indexOf(param1);
            if(_loc2_ >= 0)
            {
               var_2192.splice(_loc2_,1);
            }
            if(false)
            {
               var_159 = 3;
               if(var_79 != null)
               {
                  var_79.roomManagerInitialized(true);
               }
            }
         }
         else
         {
            var_159 = -1;
            var_79.roomManagerInitialized(false);
         }
      }
      
      private function onContentLoaded(param1:RoomContentLoadedEvent) : void
      {
         if(var_1486 == null)
         {
            return;
         }
         var _loc2_:String = param1.contentType;
         if(_loc2_ == null)
         {
            if(var_79 != null)
            {
               var_79.contentLoaded(null,false);
            }
            return;
         }
         if(var_2724.indexOf(_loc2_) < 0)
         {
            var_2724.push(_loc2_);
         }
      }
      
      private function processLoadedContentTypes() : void
      {
         var _loc4_:String = null;
         var _loc3_:IGraphicAssetCollection = null;
         var _loc1_:int = 0;
         if(_skipContentProcessingForNextFrame)
         {
            _skipContentProcessingForNextFrame = false;
            return;
         }
         var _loc2_:int = getTimer();
         while(false)
         {
            _loc4_ = "null";
            var_2724.splice(0,1);
            if(!var_1486.hasVisualizationXML(_loc4_))
            {
               if(var_79 != null)
               {
                  var_79.contentLoaded(_loc4_,false);
               }
               return;
            }
            _loc3_ = var_1486.getGraphicAssetCollection(_loc4_);
            if(_loc3_ == null)
            {
               if(var_79 != null)
               {
                  var_79.contentLoaded(_loc4_,false);
               }
               return;
            }
            updateObjectContents(_loc4_);
            if(var_79 != null)
            {
               var_79.contentLoaded(_loc4_,true);
            }
            if(false)
            {
               processInitialContentLoad(_loc4_);
            }
            _loc1_ = getTimer();
            if(_loc1_ - _loc2_ >= 40 && var_3991)
            {
               _skipContentProcessingForNextFrame = true;
               break;
            }
         }
      }
      
      private function updateObjectContents(param1:String) : void
      {
         var _loc12_:XML = null;
         var _loc8_:IGraphicAssetCollection = null;
         var _loc2_:IRoomObjectVisualizationData = null;
         var _loc14_:XML = null;
         var _loc17_:int = 0;
         var _loc9_:RoomInstance = null;
         var _loc11_:String = null;
         var _loc15_:Array = null;
         var _loc10_:Boolean = false;
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc18_:IRoomObjectController = null;
         var _loc5_:IRoomObjectGraphicVisualization = null;
         var _loc3_:IRoomObjectEventHandler = null;
         if(param1 == null)
         {
            return;
         }
         if(var_1486 == null || _visualizationFactory == null)
         {
            return;
         }
         var _loc6_:String = var_1486.getVisualizationType(param1);
         var _loc13_:String = var_1486.getLogicType(param1);
         _loc17_ = -1;
         while(_loc17_ >= 0)
         {
            _loc9_ = _rooms.getWithIndex(_loc17_) as RoomInstance;
            _loc11_ = _rooms.getKey(_loc17_);
            if(_loc9_ != null)
            {
               _loc15_ = _loc9_.getObjectManagerIds();
               _loc10_ = false;
               for each(var _loc16_ in _loc15_)
               {
                  _loc7_ = (_loc4_ = _loc9_.getObjectCountForType(param1,_loc16_)) - 1;
                  while(_loc7_ >= 0)
                  {
                     if((_loc18_ = _loc9_.getObjectWithIndexAndType(_loc7_,param1,_loc16_) as IRoomObjectController) != null)
                     {
                        if(!_loc2_)
                        {
                           if((_loc14_ = var_1486.getVisualizationXML(param1)) == null)
                           {
                              return;
                           }
                           _loc12_ = var_1486.getLogicXML(param1);
                           if((_loc8_ = var_1486.getGraphicAssetCollection(param1)) == null)
                           {
                              return;
                           }
                           _loc2_ = _visualizationFactory.getRoomObjectVisualizationData(param1,_loc6_,_loc14_);
                        }
                        if((_loc5_ = _visualizationFactory.createRoomObjectVisualization(_loc6_)) != null)
                        {
                           _loc5_.assetCollection = _loc8_;
                           _loc5_.setExternalBaseUrls(context.configuration.getProperty("stories.image_url_base"),context.configuration.getProperty("extra_data_service_url"),context.configuration.getBoolean("extra_data_batches_enabled"));
                           if(!_loc5_.initialize(_loc2_))
                           {
                              _loc9_.disposeObject(_loc18_.getId(),_loc16_);
                           }
                           else
                           {
                              _loc18_.setVisualization(_loc5_);
                              _loc3_ = _objectFactory.createRoomObjectLogic(_loc13_);
                              _loc18_.setEventHandler(_loc3_);
                              if(_loc3_ != null)
                              {
                                 _loc3_.initialize(_loc12_);
                              }
                              _loc18_.setInitialized(true);
                              if(var_79 != null)
                              {
                                 var_79.objectInitialized(_loc11_,_loc18_.getId(),_loc16_);
                                 _loc10_ = true;
                              }
                           }
                        }
                        else
                        {
                           _loc9_.disposeObject(_loc18_.getId(),_loc16_);
                        }
                     }
                     _loc7_--;
                  }
               }
               if(!_loc9_.hasUninitializedObjects() && _loc10_)
               {
                  var_79.objectsInitialized(_loc11_);
               }
            }
            _loc17_--;
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         var _loc3_:RoomInstance = null;
         processLoadedContentTypes();
         _loc2_ = -1;
         while(_loc2_ >= 0)
         {
            _loc3_ = _rooms.getWithIndex(_loc2_) as RoomInstance;
            if(_loc3_ != null)
            {
               _loc3_.update();
            }
            _loc2_--;
         }
      }
   }
}
