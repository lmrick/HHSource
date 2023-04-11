package com.sulake.habbo.room
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.communication.messages.parser.help.class_1374;
   import com.sulake.habbo.room.events.RoomEngineZoomEvent;
   import com.sulake.habbo.room.object.RoomObjectUserTypes;
   import com.sulake.habbo.room.object.RoomPlaneParser;
   import com.sulake.habbo.room.object.data.class_1610;
   import com.sulake.habbo.room.utils.class_3155;
   import com.sulake.habbo.room.utils.class_3196;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.room.IRoomInstance;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.RoomRotatingEffect;
   import com.sulake.room.utils.RoomShakingEffect;
   import com.sulake.room.utils.Vector3d;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import package_10.class_410;
   import package_10.class_834;
   import package_10.class_847;
   import package_12.class_132;
   import package_12.class_305;
   import package_12.class_393;
   import package_12.class_818;
   import package_12.class_863;
   import package_12.class_934;
   import package_13.class_610;
   import package_13.class_817;
   import package_133.class_1188;
   import package_134.class_1228;
   import package_134.class_1287;
   import package_136.class_1313;
   import package_136.class_1415;
   import package_141.class_1071;
   import package_141.class_1102;
   import package_141.class_1210;
   import package_141.class_1303;
   import package_141.class_1517;
   import package_141.class_1521;
   import package_150.class_1134;
   import package_150.class_1216;
   import package_150.class_1416;
   import package_152.class_1508;
   import package_154.class_1103;
   import package_154.class_1140;
   import package_154.class_1146;
   import package_154.class_1151;
   import package_154.class_1200;
   import package_154.class_1222;
   import package_154.class_1237;
   import package_154.class_1243;
   import package_154.class_1246;
   import package_154.class_1250;
   import package_154.class_1258;
   import package_154.class_1278;
   import package_154.class_1283;
   import package_154.class_1294;
   import package_154.class_1326;
   import package_154.class_1344;
   import package_154.class_1349;
   import package_154.class_1379;
   import package_154.class_1381;
   import package_154.class_1429;
   import package_154.class_1432;
   import package_154.class_1449;
   import package_154.class_1471;
   import package_154.class_1525;
   import package_154.class_1582;
   import package_154.class_1648;
   import package_164.class_1261;
   import package_164.class_1397;
   import package_17.class_1039;
   import package_17.class_147;
   import package_17.class_1562;
   import package_17.class_1584;
   import package_17.class_1600;
   import package_17.class_1601;
   import package_17.class_1611;
   import package_17.class_1640;
   import package_17.class_1652;
   import package_17.class_194;
   import package_17.class_246;
   import package_17.class_314;
   import package_17.class_323;
   import package_17.class_325;
   import package_17.class_327;
   import package_17.class_390;
   import package_17.class_415;
   import package_17.class_464;
   import package_17.class_469;
   import package_17.class_532;
   import package_17.class_607;
   import package_17.class_619;
   import package_17.class_624;
   import package_17.class_635;
   import package_17.class_654;
   import package_17.class_711;
   import package_17.class_733;
   import package_17.class_734;
   import package_17.class_888;
   import package_17.class_890;
   import package_17.class_905;
   import package_17.class_939;
   import package_25.class_1043;
   import package_25.class_603;
   import package_39.class_1012;
   import package_39.class_180;
   import package_39.class_361;
   import package_39.class_447;
   import package_4.class_144;
   import package_4.class_171;
   import package_4.class_660;
   import package_41.class_512;
   import package_41.class_576;
   import package_5.class_518;
   import package_58.class_913;
   import package_6.class_530;
   
   public class RoomMessageHandler
   {
      
      public static const const_650:int = 0;
      
      public static const EFFECT_ROOM_SHAKE:int = 1;
      
      public static const const_1105:int = 2;
      
      public static const EFFECT_ROOM_DISCO:int = 3;
       
      
      private var _connection:IConnection = null;
      
      private var var_1431:com.sulake.habbo.room.class_1677 = null;
      
      private var var_1529:RoomPlaneParser = null;
      
      private var var_2116:class_913 = null;
      
      private var var_3621:int = -1;
      
      private var _initialConnection:Boolean = true;
      
      private var var_4341:int = -1000000000;
      
      private var var_1433:int = 0;
      
      private var var_3023:Object;
      
      private var var_2656:int = -1;
      
      private var var_2665:int = -1;
      
      public function class_3145(param1:com.sulake.habbo.room.class_1677)
      {
         var_3023 = {};
         super();
         var_1431 = param1;
         var_1529 = new RoomPlaneParser();
         _initialConnection = true;
      }
      
      public function dispose() : void
      {
         _connection = null;
         var_1431 = null;
         if(var_1529 != null)
         {
            var_1529.dispose();
            var_1529 = null;
         }
         var_2116 = null;
      }
      
      public function setCurrentRoom(param1:int) : void
      {
         if(var_1433 != 0)
         {
            if(var_1431 != null)
            {
               var_1431.disposeRoom(var_1433);
            }
         }
         var_1433 = param1;
         var_2116 = null;
      }
      
      public function resetCurrentRoom() : void
      {
         var_1433 = 0;
         var_2116 = null;
      }
      
      private function getRoomId(param1:int) : int
      {
         return var_1433;
      }
      
      public function set connection(param1:IConnection) : void
      {
         if(_connection != null)
         {
            return;
         }
         if(param1 != null)
         {
            _connection = param1;
            param1.addMessageEvent(new class_530(onOwnUserEvent));
            param1.addMessageEvent(new class_847(onRoomReady));
            param1.addMessageEvent(new class_1039(onRoomProperty));
            param1.addMessageEvent(new class_913(onEntryTileData));
            param1.addMessageEvent(new class_733(onFloorHeightMap));
            param1.addMessageEvent(new class_246(onHeightMap));
            param1.addMessageEvent(new class_607(onHeightMapUpdate));
            param1.addMessageEvent(new class_905(onRoomVisualizationSettings));
            param1.addMessageEvent(new class_415(onFurnitureAliases));
            param1.addMessageEvent(new class_619(onObjects));
            param1.addMessageEvent(new class_323(onObjectAdd));
            param1.addMessageEvent(new class_654(onObjectUpdate));
            param1.addMessageEvent(new class_314(onObjectDataUpdate));
            param1.addMessageEvent(new class_464(onObjectsDataUpdate));
            param1.addMessageEvent(new class_194(onObjectRemove));
            param1.addMessageEvent(new class_890(onItems));
            param1.addMessageEvent(new class_888(onItemAdd));
            param1.addMessageEvent(new class_624(onItemRemove));
            param1.addMessageEvent(new class_147(onItemUpdate));
            param1.addMessageEvent(new class_635(onItemDataUpdate));
            param1.addMessageEvent(new class_532(onUsers));
            param1.addMessageEvent(new class_939(onUserUpdate));
            param1.addMessageEvent(new class_469(onUserRemove));
            param1.addMessageEvent(new class_327(onUserChange));
            param1.addMessageEvent(new class_818(onExpression));
            param1.addMessageEvent(new class_305(onDance));
            param1.addMessageEvent(new class_863(onAvatarEffect));
            param1.addMessageEvent(new class_132(onAvatarSleep));
            param1.addMessageEvent(new class_393(onCarryObject));
            param1.addMessageEvent(new class_934(onUseObject));
            param1.addMessageEvent(new class_734(onSlideUpdate));
            param1.addMessageEvent(new class_390(onWiredFurniMove));
            param1.addMessageEvent(new class_711(onWiredUserMove));
            param1.addMessageEvent(new class_180(onChat));
            param1.addMessageEvent(new class_361(onChat));
            param1.addMessageEvent(new class_447(onChat));
            param1.addMessageEvent(new class_1012(onTypingStatus));
            param1.addMessageEvent(new class_1043(onDiceValue));
            param1.addMessageEvent(new class_603(onOneWayDoorStatus));
            param1.addMessageEvent(new class_512(onPetExperience));
            param1.addMessageEvent(new class_834(onPlayingGame));
            param1.addMessageEvent(new class_410(onGamePlayerNumberValue));
            param1.addMessageEvent(new class_576(onPetFigureUpdate));
            param1.addMessageEvent(new class_518(onIgnoreResult));
            param1.addMessageEvent(new class_171(onGuideSessionStarted));
            param1.addMessageEvent(new class_660(onGuideSessionEnded));
            param1.addMessageEvent(new class_144(onGuideSessionError));
            param1.addMessageEvent(new class_325(onSpecialRoomEvent));
         }
      }
      
      private function onOwnUserEvent(param1:IMessageEvent) : void
      {
         var _loc2_:class_530 = param1 as class_530;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:class_1188 = _loc2_.getParser();
         if(_loc3_ != null)
         {
            var_3621 = _loc3_.id;
         }
      }
      
      private function onRoomReady(param1:IMessageEvent) : void
      {
         var _loc4_:class_847;
         if((_loc4_ = param1 as class_847) == null || _loc4_.getParser() == null || param1.connection == null)
         {
            return;
         }
         var _loc2_:class_1134 = _loc4_.getParser();
         if(var_1433 != _loc2_.roomId)
         {
            setCurrentRoom(_loc2_.roomId);
         }
         var _loc3_:String = _loc2_.roomType;
         if(var_1431 != null)
         {
            var_1431.setWorldType(_loc2_.roomId,_loc3_);
         }
         if(_initialConnection)
         {
            param1.connection.send(new class_610());
            _initialConnection = false;
         }
         else
         {
            param1.connection.send(new class_817());
         }
      }
      
      private function onFurnitureAliases(param1:IMessageEvent) : void
      {
         var _loc5_:class_415 = null;
         var _loc2_:class_1449 = null;
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:String = null;
         var _loc7_:String = null;
         if(var_1431 != null)
         {
            if((_loc5_ = param1 as class_415) == null || _loc5_.getParser() == null)
            {
               return;
            }
            _loc2_ = _loc5_.getParser();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.aliasCount;
               _loc6_ = 0;
               while(_loc6_ < _loc3_)
               {
                  _loc4_ = _loc2_.getName(_loc6_);
                  _loc7_ = _loc2_.getAlias(_loc6_);
                  var_1431.setRoomObjectAlias(_loc4_,_loc7_);
                  _loc6_++;
               }
            }
         }
         param1.connection.send(new class_817());
      }
      
      private function onHeightMap(param1:IMessageEvent) : void
      {
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         var _loc11_:Number = NaN;
         var _loc4_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc6_:class_246;
         if((_loc6_ = param1 as class_246) == null || _loc6_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc3_:class_1326 = _loc6_.getParser();
         var _loc10_:int = _loc3_.width;
         var _loc9_:int = _loc3_.height;
         var _loc5_:class_3196 = new class_3196(_loc10_,_loc9_);
         _loc8_ = 0;
         while(_loc8_ < _loc9_)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc10_)
            {
               _loc11_ = _loc3_.getTileHeight(_loc7_,_loc8_);
               _loc4_ = _loc3_.getStackingBlocked(_loc7_,_loc8_);
               _loc2_ = _loc3_.isRoomTile(_loc7_,_loc8_);
               _loc5_.setTileHeight(_loc7_,_loc8_,_loc11_);
               _loc5_.setStackingBlocked(_loc7_,_loc8_,_loc4_);
               _loc5_.setIsRoomTile(_loc7_,_loc8_,_loc2_);
               _loc7_++;
            }
            _loc8_++;
         }
         var_1431.setFurniStackingHeightMap(var_1433,_loc5_);
      }
      
      private function onHeightMapUpdate(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:class_607;
         if((_loc4_ = param1 as class_607) == null || _loc4_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc2_:class_1258 = _loc4_.getParser();
         var _loc3_:class_3196 = var_1431.getFurniStackingHeightMap(var_1433);
         if(_loc3_ == null)
         {
            return;
         }
         while(_loc2_.next())
         {
            _loc5_ = _loc2_.x;
            _loc6_ = _loc2_.y;
            _loc3_.setTileHeight(_loc5_,_loc6_,_loc2_.tileHeight);
            _loc3_.setStackingBlocked(_loc5_,_loc6_,_loc2_.isStackingBlocked);
            _loc3_.setIsRoomTile(_loc5_,_loc6_,_loc2_.isRoomTile);
         }
         var_1431.refreshTileObjectMap(var_1433,"RoomMessageHandler.onHeightMapUpdate()");
      }
      
      private function onRoomVisualizationSettings(param1:IMessageEvent) : void
      {
         var _loc2_:class_905 = param1 as class_905;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:class_1222 = _loc2_.getParser();
         var _loc7_:* = !_loc3_.wallsHidden;
         var _loc4_:Number = _loc3_.wallThicknessMultiplier;
         var _loc6_:Number = _loc3_.floorThicknessMultiplier;
         if(var_1431 != null)
         {
            var_1431.updateObjectRoomVisibilities(var_1433,_loc7_,true);
            var_1431.updateObjectRoomPlaneThicknesses(var_1433,_loc4_,_loc6_);
         }
      }
      
      private function onRoomProperty(param1:IMessageEvent) : void
      {
         var _loc6_:class_1039;
         if((_loc6_ = param1 as class_1039) == null || _loc6_.getParser() == null)
         {
            return;
         }
         var _loc2_:class_1349 = _loc6_.getParser();
         var _loc4_:String = _loc2_.floorType;
         var _loc5_:String = _loc2_.wallType;
         var _loc3_:String = _loc2_.landscapeType;
         if(var_1431 != null)
         {
            var_1431.updateObjectRoom(var_1433,_loc4_,_loc5_,_loc3_);
         }
      }
      
      private function onEntryTileData(param1:class_913) : void
      {
         var_2116 = param1;
      }
      
      private function onFloorHeightMap(param1:IMessageEvent) : void
      {
         var _loc16_:int = 0;
         var _loc15_:int = 0;
         var _loc19_:int = 0;
         var _loc9_:int = 0;
         var _loc8_:int = 0;
         var _loc13_:class_733;
         if((_loc13_ = param1 as class_733) == null || _loc13_.getParser() == null)
         {
            return;
         }
         var _loc11_:class_1381 = _loc13_.getParser();
         if(var_1431 == null)
         {
            return;
         }
         var _loc17_:class_3155;
         if((_loc17_ = var_1431.getLegacyGeometry(var_1433)) == null)
         {
            return;
         }
         var_1529.reset();
         var _loc14_:int = _loc11_.width;
         var _loc18_:int = _loc11_.height;
         var_1529.initializeTileMap(_loc14_,_loc18_);
         var _loc5_:Number = -1;
         var _loc6_:Number = -1;
         var _loc2_:Number = 0;
         var _loc10_:Number = 0;
         var _loc3_:class_1508 = null;
         if(var_2116 != null)
         {
            _loc3_ = var_2116.getParser();
         }
         var _loc12_:class_3196;
         if((_loc12_ = var_1431.getFurniStackingHeightMap(var_1433)) == null)
         {
            return;
         }
         _loc16_ = 0;
         while(_loc16_ < _loc18_)
         {
            _loc15_ = 0;
            while(_loc15_ < _loc14_)
            {
               _loc19_ = _loc11_.getTileHeight(_loc15_,_loc16_);
               if((_loc16_ > 0 && _loc16_ < _loc18_ - 1 || _loc15_ > 0 && _loc15_ < _loc14_ - 1) && _loc19_ != -110 && (_loc3_ == null || _loc15_ == _loc3_.x && _loc16_ == _loc3_.y))
               {
                  if(_loc11_.getTileHeight(_loc15_,_loc16_ - 1) == -110 && _loc11_.getTileHeight(_loc15_ - 1,_loc16_) == -110 && _loc11_.getTileHeight(_loc15_,_loc16_ + 1) == -110)
                  {
                     _loc5_ = _loc15_ + 0.5;
                     _loc6_ = _loc16_;
                     _loc2_ = _loc19_;
                     _loc10_ = 90;
                  }
                  if(_loc11_.getTileHeight(_loc15_,_loc16_ - 1) == -110 && _loc11_.getTileHeight(_loc15_ - 1,_loc16_) == -110 && _loc11_.getTileHeight(_loc15_ + 1,_loc16_) == -110)
                  {
                     _loc5_ = _loc15_;
                     _loc6_ = _loc16_ + 0.5;
                     _loc2_ = _loc19_;
                     _loc10_ = 180;
                  }
               }
               var_1529.setTileHeight(_loc15_,_loc16_,_loc19_);
               _loc15_++;
            }
            _loc16_++;
         }
         var_1529.setTileHeight(Math.floor(_loc5_),Math.floor(_loc6_),_loc2_);
         var_1529.initializeFromTileData(_loc13_.getParser().fixedWallsHeight);
         var_1529.setTileHeight(Math.floor(_loc5_),Math.floor(_loc6_),_loc2_ + var_1529.wallHeight);
         _loc17_.scale = _loc11_.scale;
         _loc17_.initialize(_loc14_,_loc18_,var_1529.floorHeight);
         _loc9_ = _loc11_.height - 1;
         while(_loc9_ >= 0)
         {
            _loc8_ = _loc11_.width - 1;
            while(_loc8_ >= 0)
            {
               _loc17_.setTileHeight(_loc8_,_loc9_,var_1529.getTileHeight(_loc8_,_loc9_));
               _loc8_--;
            }
            _loc9_--;
         }
         var _loc7_:XML = var_1529.getXML();
         var _loc4_:XML = <doors><door x={_loc5_} y={_loc6_} z={_loc2_} dir={_loc10_}/></doors>;
         _loc7_.appendChild(_loc4_);
         var_1431.initializeRoom(var_1433,_loc7_);
         if(false)
         {
            addActiveObject(var_1433,var_3023.objectData);
            var_3023.objectData = null;
         }
         else
         {
            var_3023.floorReady = true;
         }
      }
      
      private function onObjects(param1:IMessageEvent) : void
      {
         var _loc6_:int = 0;
         var _loc4_:class_1652 = null;
         var _loc3_:class_619 = param1 as class_619;
         if(_loc3_ == null || _loc3_.getParser() == null)
         {
            return;
         }
         var _loc2_:class_1344 = _loc3_.getParser();
         var _loc5_:int = _loc2_.getObjectCount();
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = _loc2_.getObject(_loc6_);
            addActiveObject(var_1433,_loc4_);
            _loc6_++;
         }
      }
      
      private function onObjectAdd(param1:IMessageEvent) : void
      {
         var _loc2_:class_323 = param1 as class_323;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:class_1103 = _loc2_.getParser();
         var _loc4_:class_1652 = _loc3_.data;
         addActiveObject(var_1433,_loc4_);
      }
      
      private function onObjectUpdate(param1:IMessageEvent) : void
      {
         var _loc2_:IVector3d = null;
         var _loc6_:IVector3d = null;
         var _loc3_:class_654 = param1 as class_654;
         if(_loc3_ == null || _loc3_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc5_:class_1652;
         var _loc4_:class_1294;
         if((_loc5_ = (_loc4_ = _loc3_.getParser()).data) != null)
         {
            _loc2_ = new Vector3d(_loc5_.x,_loc5_.y,_loc5_.z);
            _loc6_ = new Vector3d(_loc5_.dir);
            var_1431.updateObjectFurniture(var_1433,_loc5_.id,_loc2_,_loc6_,_loc5_.state,_loc5_.data,_loc5_.extra);
            var_1431.updateObjectFurnitureHeight(var_1433,_loc5_.id,_loc5_.sizeZ);
            var_1431.updateObjectFurnitureExpiryTime(var_1433,_loc5_.id,_loc5_.expiryTime);
         }
      }
      
      private function onObjectDataUpdate(param1:IMessageEvent) : void
      {
         var _loc4_:class_314;
         if((_loc4_ = param1 as class_314) == null || _loc4_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc2_:class_1283 = _loc4_.getParser();
         var _loc5_:int = _loc2_.id;
         var _loc6_:int = _loc2_.state;
         var _loc3_:IStuffData = _loc2_.data;
         var_1431.updateObjectFurniture(var_1433,_loc5_,null,null,_loc6_,_loc3_);
      }
      
      private function onObjectsDataUpdate(param1:IMessageEvent) : void
      {
         var _loc6_:int = 0;
         var _loc5_:class_1611 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:IStuffData = null;
         var _loc4_:class_464;
         if((_loc4_ = param1 as class_464) == null || _loc4_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc2_:class_1146 = _loc4_.getParser();
         _loc6_ = 0;
         while(_loc6_ < _loc2_.objectCount)
         {
            if((_loc5_ = _loc2_.getObjectData(_loc6_)) != null)
            {
               _loc7_ = _loc5_.id;
               _loc8_ = _loc5_.state;
               _loc3_ = _loc5_.data;
               var_1431.updateObjectFurniture(var_1433,_loc7_,null,null,_loc8_,_loc3_);
            }
            _loc6_++;
         }
      }
      
      private function onObjectRemove(param1:IMessageEvent) : void
      {
         var parser:class_1200;
         var id:int;
         var delay:int;
         var event:IMessageEvent = param1;
         var objectRemoveEvent:class_194 = event as class_194;
         if(objectRemoveEvent == null || objectRemoveEvent.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         parser = objectRemoveEvent.getParser();
         id = 0;
         delay = 0;
         if(delay > 0)
         {
            setTimeout(function():void
            {
               var_1431.disposeObjectFurniture(var_1433,id,parser.isExpired ? -1 : parser.pickerId,true);
            },delay);
         }
         else
         {
            var_1431.disposeObjectFurniture(var_1433,id,parser.isExpired ? -1 : parser.pickerId,true);
         }
      }
      
      private function addActiveObject(param1:int, param2:class_1652) : void
      {
         if(param2 == null || var_1431 == null)
         {
            return;
         }
         var _loc3_:IVector3d = new Vector3d(param2.x,param2.y,param2.z);
         var _loc4_:IVector3d = new Vector3d(param2.dir);
         if(param2.staticClass != null)
         {
            var_1431.addObjectFurnitureByName(param1,param2.id,param2.staticClass,_loc3_,_loc4_,param2.state,param2.data,param2.extra);
         }
         else
         {
            var_1431.addObjectFurniture(param1,param2.id,param2.type,_loc3_,_loc4_,param2.state,param2.data,param2.extra,param2.expiryTime,param2.usagePolicy,param2.ownerId,param2.ownerName,true,true,param2.sizeZ);
         }
      }
      
      private function onItems(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc3_:class_1600 = null;
         var _loc6_:class_890;
         if((_loc6_ = param1 as class_890) == null || _loc6_.getParser() == null)
         {
            return;
         }
         var _loc2_:class_1471 = _loc6_.getParser();
         var _loc4_:int = _loc2_.getItemCount();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = _loc2_.getItem(_loc5_);
            addWallItem(var_1433,_loc3_);
            _loc5_++;
         }
      }
      
      private function onItemAdd(param1:IMessageEvent) : void
      {
         var _loc2_:class_888 = param1 as class_888;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:class_1525 = _loc2_.getParser();
         var _loc4_:class_1600;
         if((_loc4_ = _loc3_.data) != null)
         {
            addWallItem(var_1433,_loc4_);
         }
      }
      
      private function onItemRemove(param1:IMessageEvent) : void
      {
         var _loc3_:class_624 = param1 as class_624;
         if(_loc3_ == null || _loc3_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc2_:class_1140 = _loc3_.getParser();
         var_1431.disposeObjectWallItem(var_1433,_loc2_.itemId,_loc2_.pickerId);
      }
      
      private function onItemUpdate(param1:IMessageEvent) : void
      {
         var _loc2_:IVector3d = null;
         var _loc5_:IVector3d = null;
         var _loc6_:class_147;
         if((_loc6_ = param1 as class_147) == null || _loc6_.getParser() == null)
         {
            return;
         }
         var _loc3_:class_1237 = _loc6_.getParser();
         var _loc7_:class_3155 = var_1431.getLegacyGeometry(var_1433);
         if(var_1431 == null || _loc7_ == null)
         {
            return;
         }
         var _loc4_:class_1600;
         if((_loc4_ = _loc3_.data) != null)
         {
            _loc2_ = _loc7_.getLocation(_loc4_.wallX,_loc4_.wallY,_loc4_.localX,_loc4_.localY,_loc4_.dir);
            _loc5_ = new Vector3d(_loc7_.getDirection(_loc4_.dir));
            var_1431.updateObjectWallItem(var_1433,_loc4_.id,_loc2_,_loc5_,_loc4_.state,_loc4_.data);
            var_1431.updateObjectWallItemExpiryTime(var_1433,_loc4_.id,_loc4_.secondsToExpiration);
         }
      }
      
      private function onItemDataUpdate(param1:IMessageEvent) : void
      {
         var _loc3_:class_635 = param1 as class_635;
         if(_loc3_ == null || _loc3_.getParser() == null)
         {
            return;
         }
         var _loc2_:class_1432 = _loc3_.getParser();
         var_1431.updateObjectWallItemData(var_1433,_loc2_.id,_loc2_.itemData);
      }
      
      private function addWallItem(param1:int, param2:class_1600) : void
      {
         if(param2 == null || var_1431 == null)
         {
            return;
         }
         var _loc5_:class_3155;
         if((_loc5_ = var_1431.getLegacyGeometry(param1)) == null)
         {
            return;
         }
         var _loc3_:IVector3d = null;
         if(!param2.isOldFormat)
         {
            _loc3_ = _loc5_.getLocation(param2.wallX,param2.wallY,param2.localX,param2.localY,param2.dir);
         }
         else
         {
            _loc3_ = _loc5_.getLocationOldFormat(param2.y,param2.z,param2.dir);
         }
         var _loc4_:IVector3d = new Vector3d(_loc5_.getDirection(param2.dir));
         var_1431.addObjectWallItem(param1,param2.id,param2.type,_loc3_,_loc4_,param2.state,param2.data,param2.usagePolicy,param2.ownerId,param2.ownerName,param2.secondsToExpiration);
      }
      
      private function onUsers(param1:IMessageEvent) : void
      {
         var _loc4_:int = 0;
         var _loc7_:class_1562 = null;
         var _loc2_:IVector3d = null;
         var _loc6_:IVector3d = null;
         var _loc5_:int = 0;
         var _loc8_:class_532;
         if((_loc8_ = param1 as class_532) == null || _loc8_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc3_:class_1250 = _loc8_.getParser();
         _loc4_ = 0;
         while(_loc4_ < _loc3_.getUserCount())
         {
            if((_loc7_ = _loc3_.getUser(_loc4_)) != null)
            {
               _loc2_ = new Vector3d(_loc7_.x,_loc7_.y,_loc7_.z);
               _loc6_ = new Vector3d(_loc7_.dir);
               _loc5_ = _loc7_.userType;
               var_1431.addObjectUser(var_1433,_loc7_.roomIndex,_loc2_,_loc6_,_loc7_.dir,_loc5_,_loc7_.figure);
               if(_loc7_.webID == var_3621)
               {
                  var_1431.setOwnUserId(var_1433,_loc7_.roomIndex);
                  var_1431.updateObjectUserOwnUserAvatar(var_1433,_loc7_.roomIndex);
               }
               var_1431.updateObjectUserFigure(var_1433,_loc7_.roomIndex,_loc7_.figure,_loc7_.sex,_loc7_.subType,_loc7_.isRiding);
               if(RoomObjectUserTypes.getName(_loc5_) == "pet")
               {
                  if(var_1431.getPetTypeId(_loc7_.figure) == 16)
                  {
                     var_1431.updateObjectUserPosture(var_1433,_loc7_.roomIndex,_loc7_.petPosture);
                  }
               }
               if(var_1431.configuration.getBoolean("avatar.ignored.bubble.enabled"))
               {
                  var_1431.updateObjectUserAction(var_1433,_loc7_.roomIndex,"figure_is_muted",Number(var_1431.sessionDataManager.isIgnored(_loc7_.name)));
               }
            }
            _loc4_++;
         }
         updateGuideMarker();
      }
      
      private function onUserUpdate(param1:IMessageEvent) : void
      {
         var _loc10_:int = 0;
         var _loc6_:class_1640 = null;
         var _loc16_:Number = NaN;
         var _loc3_:IVector3d = null;
         var _loc11_:IVector3d = null;
         var _loc13_:IVector3d = null;
         var _loc18_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:String = null;
         var _loc7_:String = null;
         var _loc5_:Boolean = false;
         var _loc15_:Boolean = false;
         var _loc2_:* = 0;
         var _loc4_:class_939;
         if((_loc4_ = param1 as class_939) == null || _loc4_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc14_:class_1243 = _loc4_.getParser();
         var _loc12_:IRoomInstance;
         if((_loc12_ = var_1431.getRoom(var_1433)) == null)
         {
            return;
         }
         var _loc19_:Number = _loc12_.getNumber("room_z_scale");
         _loc10_ = 0;
         while(_loc10_ < _loc14_.userUpdateCount)
         {
            if((_loc6_ = _loc14_.getUserUpdateData(_loc10_)) != null)
            {
               _loc16_ = _loc6_.localZ;
               if(_loc19_ != 0)
               {
                  _loc16_ /= _loc19_;
               }
               _loc3_ = new Vector3d(_loc6_.x,_loc6_.y,_loc6_.z + _loc16_);
               _loc11_ = new Vector3d(_loc6_.dir);
               _loc13_ = null;
               if(_loc6_.isMoving)
               {
                  _loc13_ = new Vector3d(_loc6_.targetX,_loc6_.targetY,_loc6_.targetZ);
               }
               var_1431.updateObjectUser(var_1433,_loc6_.id,_loc3_,_loc13_,_loc6_.canStandUp,_loc16_,_loc11_,_loc6_.dirHead,NaN,_loc6_.skipPositionUpdate);
               _loc18_ = true;
               _loc8_ = false;
               _loc9_ = "std";
               _loc7_ = "";
               var_1431.updateObjectUserFlatControl(var_1433,_loc6_.id,null);
               _loc5_ = false;
               _loc15_ = false;
               _loc2_ = _loc6_.actions.length;
               for each(var _loc17_ in _loc6_.actions)
               {
                  switch(_loc17_.actionType)
                  {
                     case "flatctrl":
                        var_1431.updateObjectUserFlatControl(var_1433,_loc6_.id,_loc17_.actionParameter);
                        break;
                     case "sign":
                        if(_loc2_ == 1)
                        {
                           _loc18_ = false;
                        }
                        var_1431.updateObjectUserAction(var_1433,_loc6_.id,"figure_sign",int(_loc17_.actionParameter));
                        break;
                     case "gst":
                        if(_loc2_ == 1)
                        {
                           _loc18_ = false;
                        }
                        var_1431.updateObjectPetGesture(var_1433,_loc6_.id,_loc17_.actionParameter);
                        break;
                     case "wav":
                     case "mv":
                        _loc15_ = true;
                        _loc8_ = true;
                        break;
                     case "swim":
                        _loc5_ = true;
                        _loc8_ = true;
                        _loc9_ = _loc17_.actionType;
                        _loc7_ = _loc17_.actionParameter;
                        break;
                     case "wf":
                        break;
                     case "trd":
                        break;
                     default:
                        _loc8_ = true;
                        _loc9_ = _loc17_.actionType;
                        _loc7_ = _loc17_.actionParameter;
                        break;
                  }
                  _loc9_ = _loc17_.actionType;
                  _loc7_ = _loc17_.actionParameter;
               }
               if(!_loc15_ && _loc5_)
               {
                  _loc8_ = true;
                  _loc9_ = "float";
               }
               if(_loc8_)
               {
                  var_1431.updateObjectUserPosture(var_1433,_loc6_.id,_loc9_,_loc7_);
               }
               else if(_loc18_)
               {
                  var_1431.updateObjectUserPosture(var_1433,_loc6_.id,"std","");
               }
            }
            _loc10_++;
         }
         updateGuideMarker();
      }
      
      private function onUserRemove(param1:IMessageEvent) : void
      {
         var _loc3_:class_469 = param1 as class_469;
         if(_loc3_ == null || _loc3_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc2_:class_1151 = _loc3_.getParser();
         var_1431.disposeObjectUser(var_1433,_loc2_.id);
         updateGuideMarker();
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:class_327 = param1 as class_327;
         if(_loc2_ == null)
         {
            return;
         }
         var_1431.updateObjectUserFigure(var_1433,_loc2_.id,_loc2_.figure,_loc2_.sex);
      }
      
      private function onPetFigureUpdate(param1:IMessageEvent) : void
      {
         var _loc3_:class_576 = param1 as class_576;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1228 = _loc3_.getParser();
         var_1431.updateObjectUserFigure(var_1433,_loc2_.roomIndex,_loc2_.figureData.figureString,"","",_loc2_.isRiding);
      }
      
      private function onExpression(param1:IMessageEvent) : void
      {
         var _loc2_:class_818 = param1 as class_818;
         if(_loc2_ == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc3_:class_1102 = _loc2_.getParser();
         if(_loc3_ == null)
         {
            return;
         }
         var_1431.updateObjectUserAction(var_1433,_loc3_.userId,"figure_expression",_loc3_.expressionType);
      }
      
      private function onDance(param1:IMessageEvent) : void
      {
         var _loc2_:class_305 = param1 as class_305;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc3_:class_1071 = _loc2_.getParser();
         var_1431.updateObjectUserAction(var_1433,_loc3_.userId,"figure_dance",_loc3_.danceStyle);
      }
      
      private function onAvatarEffect(param1:IMessageEvent) : void
      {
         var _loc3_:class_863 = param1 as class_863;
         if(_loc3_ == null || _loc3_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc2_:class_1517 = _loc3_.getParser();
         var_1431.updateObjectUserEffect(var_1433,_loc2_.userId,_loc2_.effectId,_loc2_.delayMilliSeconds);
      }
      
      private function onAvatarSleep(param1:IMessageEvent) : void
      {
         var _loc4_:class_132;
         if((_loc4_ = param1 as class_132) == null || _loc4_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc3_:class_1303 = _loc4_.getParser();
         var _loc2_:int = 1;
         if(!_loc3_.sleeping)
         {
            _loc2_ = 0;
         }
         var_1431.updateObjectUserAction(var_1433,_loc3_.userId,"figure_sleep",_loc2_);
      }
      
      private function onCarryObject(param1:IMessageEvent) : void
      {
         var _loc2_:class_1210 = null;
         if(var_1431 == null)
         {
            return;
         }
         if(param1 is class_393)
         {
            _loc2_ = (param1 as class_393).getParser();
            var_1431.updateObjectUserAction(var_1433,_loc2_.userId,"figure_carry_object",_loc2_.itemType);
         }
      }
      
      private function onUseObject(param1:IMessageEvent) : void
      {
         var _loc2_:class_1521 = null;
         if(var_1431 == null)
         {
            return;
         }
         if(param1 is class_934)
         {
            _loc2_ = (param1 as class_934).getParser();
            var_1431.updateObjectUserAction(var_1433,_loc2_.userId,"figure_use_object",_loc2_.itemType);
         }
      }
      
      private function onSlideUpdate(param1:IMessageEvent) : void
      {
         var _loc3_:class_1429 = null;
         var _loc6_:Array = null;
         var _loc4_:int = 0;
         var _loc2_:class_1584 = null;
         var _loc5_:class_1584 = null;
         if(var_1431 == null)
         {
            return;
         }
         if(param1 is class_734)
         {
            _loc3_ = (param1 as class_734).getParser();
            var_1431.updateObjectFurniture(var_1433,_loc3_.id,null,null,1,null);
            var_1431.updateObjectFurniture(var_1433,_loc3_.id,null,null,2,null);
            _loc6_ = _loc3_.objectList;
            _loc4_ = 0;
            while(_loc4_ < _loc6_.length)
            {
               _loc2_ = _loc6_[_loc4_];
               if(_loc2_ != null)
               {
                  var_1431.updateObjectFurnitureLocation(var_1433,_loc2_.id,_loc2_.loc,_loc2_.target);
               }
               _loc4_++;
            }
            if(_loc3_.avatar != null)
            {
               _loc5_ = _loc3_.avatar;
               var_1431.updateObjectUser(var_1433,_loc5_.id,_loc5_.loc,_loc5_.target);
               setUserMovePosture(_loc5_.id,_loc5_.moveType);
            }
         }
      }
      
      private function onWiredFurniMove(param1:IMessageEvent) : void
      {
         var _loc2_:class_1278 = null;
         var _loc3_:class_1582 = null;
         if(var_1431 == null)
         {
            return;
         }
         if(param1 is class_390)
         {
            _loc2_ = (param1 as class_390).getParser();
            _loc3_ = _loc2_.furniMove;
            var_1431.updateObjectFurnitureLocation(var_1433,_loc3_.furniId,_loc3_.source,_loc3_.target,_loc2_.animationTime);
         }
      }
      
      private function onWiredUserMove(param1:IMessageEvent) : void
      {
         var _loc3_:class_1379 = null;
         var _loc5_:class_1648 = null;
         var _loc6_:* = false;
         var _loc4_:IRoomObject = null;
         var _loc2_:IRoomInstance = null;
         var _loc7_:IRoomObjectModel = null;
         if(var_1431 == null)
         {
            return;
         }
         if(param1 is class_711)
         {
            _loc3_ = (param1 as class_711).getParser();
            _loc5_ = _loc3_.userMove;
            _loc6_ = false;
            if(_loc5_.moveType == "sld")
            {
               _loc2_ = var_1431.getRoom(var_1433);
               if(_loc2_)
               {
                  if((_loc4_ = _loc2_.getObject(_loc5_.userIndex,100)) != null)
                  {
                     _loc6_ = (_loc7_ = _loc4_.getModel()).getNumber("figure_can_stand_up") > 0;
                  }
               }
            }
            var_1431.updateObjectUser(var_1433,_loc5_.userIndex,_loc5_.source,_loc5_.target,_loc6_,0,null,NaN,_loc3_.animationTime);
            setUserMovePosture(_loc5_.userIndex,_loc5_.moveType);
         }
      }
      
      private function setUserMovePosture(param1:int, param2:String) : void
      {
         var _loc5_:IRoomObject = null;
         var _loc6_:String = null;
         var _loc7_:IRoomObjectModel = null;
         var _loc4_:String = null;
         var _loc3_:IRoomInstance = var_1431.getRoom(var_1433);
         if(_loc3_)
         {
            _loc5_ = _loc3_.getObject(param1,100);
         }
         if(_loc5_ != null && _loc5_.getType() != "monsterplant")
         {
            _loc7_ = _loc5_.getModel();
            switch(param2)
            {
               case "mv":
                  _loc6_ = "mv";
                  break;
               case "sld":
                  _loc6_ = (_loc4_ = String(_loc7_.getString("figure_posture"))) == "mv" ? "std" : _loc4_;
            }
            var_1431.updateObjectUserPosture(var_1433,param1,_loc6_);
         }
      }
      
      private function onChat(param1:IMessageEvent) : void
      {
         var _loc2_:class_1261 = null;
         if(var_1431 == null)
         {
            return;
         }
         var _loc3_:IRoomSession = var_1431.roomSessionManager.getSession(var_1433);
         if(param1 is class_180)
         {
            _loc2_ = (param1 as class_180).getParser();
         }
         else if(param1 is class_361)
         {
            _loc2_ = (param1 as class_361).getParser();
            if(_loc2_ && _loc3_ && _loc2_.userId == _loc3_.ownUserRoomId)
            {
               return;
            }
         }
         else if(param1 is class_447)
         {
            _loc2_ = (param1 as class_447).getParser();
         }
         if(_loc2_ == null)
         {
            return;
         }
         var_1431.updateObjectUserGesture(var_1433,_loc2_.userId,_loc2_.gesture);
         var_1431.updateObjectUserAction(var_1433,_loc2_.userId,"figure_talk",Math.ceil(_loc2_.text.length / 10));
      }
      
      private function onTypingStatus(param1:IMessageEvent) : void
      {
         var _loc2_:class_1012 = param1 as class_1012;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:class_1397 = _loc2_.getParser();
         var _loc4_:int = 1;
         if(!_loc3_.isTyping)
         {
            _loc4_ = 0;
         }
         var_1431.updateObjectUserAction(var_1433,_loc3_.userId,"figure_is_typing",_loc4_);
      }
      
      private function onPetExperience(param1:class_512) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:class_1287 = param1.getParser();
         var_1431.updateObjectUserAction(var_1433,_loc2_.petRoomIndex,"figure_gained_experience",_loc2_.gainedExperience);
      }
      
      private function onDiceValue(param1:IMessageEvent) : void
      {
         var _loc5_:class_1043;
         if((_loc5_ = param1 as class_1043) == null || _loc5_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc2_:class_1415 = _loc5_.getParser();
         var _loc4_:int = _loc2_.id;
         var _loc6_:int = _loc2_.value;
         var _loc3_:IStuffData = new class_1610();
         var_1431.updateObjectFurniture(var_1433,_loc4_,null,null,_loc6_,_loc3_);
      }
      
      private function onOneWayDoorStatus(param1:IMessageEvent) : void
      {
         var _loc2_:class_603 = param1 as class_603;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         if(var_1431 == null)
         {
            return;
         }
         var _loc3_:class_1313 = _loc2_.getParser();
         var _loc5_:int = _loc3_.id;
         var _loc6_:int = _loc3_.status;
         var _loc4_:IStuffData = new class_1610();
         var_1431.updateObjectFurniture(var_1433,_loc5_,null,null,_loc6_,_loc4_);
      }
      
      private function onPlayingGame(param1:class_834) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:class_1216 = param1.getParser();
         var _loc2_:Boolean = _loc3_.isPlaying;
         var_1431.setIsPlayingGame(var_1433,_loc2_);
      }
      
      private function onGamePlayerNumberValue(param1:IMessageEvent) : void
      {
         var _loc2_:class_1416 = null;
         var _loc3_:int = 0;
         if(var_1431 == null)
         {
            return;
         }
         if(param1 is class_410)
         {
            _loc2_ = (param1 as class_410).getParser();
            _loc3_ = getRoomId(0);
            var_1431.updateObjectUserAction(_loc3_,_loc2_.userId,"figure_number_value",_loc2_.value);
         }
      }
      
      private function onIgnoreResult(param1:IMessageEvent) : void
      {
         if(!var_1431.configuration.getBoolean("avatar.ignored.bubble.enabled"))
         {
            return;
         }
         var _loc2_:class_518 = param1 as class_518;
         var _loc3_:class_3259 = var_1431.roomSessionManager.getSession(var_1433).userDataManager.getUserDataByName(_loc2_.name);
         if(_loc3_ != null)
         {
            switch(_loc2_.result - 1)
            {
               case 0:
               case 1:
                  var_1431.updateObjectUserAction(var_1433,_loc3_.roomObjectId,"figure_is_muted",1);
                  break;
               case 2:
                  var_1431.updateObjectUserAction(var_1433,_loc3_.roomObjectId,"figure_is_muted",0);
            }
         }
      }
      
      private function onGuideSessionStarted(param1:IMessageEvent) : void
      {
         var _loc2_:class_1374 = param1.parser as class_1374;
         var_2656 = _loc2_.guideUserId;
         var_2665 = _loc2_.requesterUserId;
         updateGuideMarker();
      }
      
      private function onGuideSessionEnded(param1:IMessageEvent) : void
      {
         removeGuideMarker();
      }
      
      private function onGuideSessionError(param1:IMessageEvent) : void
      {
         removeGuideMarker();
      }
      
      public function onSpecialRoomEvent(param1:IMessageEvent) : void
      {
         var arrayIndex:int;
         var discoColours:Array;
         var discoTimer:Timer;
         var event:IMessageEvent = param1;
         var eventParser:class_1246 = event.parser as class_1246;
         switch(0)
         {
            case 0:
               RoomRotatingEffect.init(250,5000);
               RoomRotatingEffect.turnVisualizationOn();
               break;
            case 1:
               RoomShakingEffect.init(250,5000);
               RoomShakingEffect.turnVisualizationOn();
               break;
            case 2:
               var_1431.roomSessionManager.events.dispatchEvent(new RoomEngineZoomEvent(var_1433,-1,true));
               break;
            case 3:
               arrayIndex = 0;
               discoColours = [29371,16731195,16764980,10092288,29371,16731195,16764980,10092288,0];
               discoTimer = new Timer(1000,NaN);
               discoTimer.addEventListener("timer",function(param1:TimerEvent):void
               {
                  if(arrayIndex == discoColours.length)
                  {
                     var_1431.updateObjectRoomColor(var_1433,discoColours[arrayIndex++],176,true);
                  }
                  else
                  {
                     var_1431.updateObjectRoomColor(var_1433,discoColours[arrayIndex++],176,false);
                  }
               });
               discoTimer.start();
         }
      }
      
      private function updateGuideMarker() : void
      {
         var _loc1_:int = var_1431.sessionDataManager.userId;
         setUserGuideStatus(var_2656,var_2665 == _loc1_ ? 1 : 0);
         setUserGuideStatus(var_2665,var_2656 == _loc1_ ? 2 : 0);
      }
      
      private function removeGuideMarker() : void
      {
         setUserGuideStatus(var_2656,0);
         setUserGuideStatus(var_2665,0);
         var_2656 = -1;
         var_2665 = -1;
      }
      
      private function setUserGuideStatus(param1:int, param2:int) : void
      {
         if(!var_1431 || true)
         {
            return;
         }
         var _loc4_:IRoomSession;
         if((_loc4_ = var_1431.roomSessionManager.getSession(var_1433)) == null)
         {
            return;
         }
         var _loc3_:class_3259 = _loc4_.userDataManager.getUserDataByType(param1,1);
         if(_loc3_ != null)
         {
            var_1431.updateObjectUserAction(var_1433,_loc3_.roomObjectId,"figure_guide_status",param2);
         }
      }
   }
}
