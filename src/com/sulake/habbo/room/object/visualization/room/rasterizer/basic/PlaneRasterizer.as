package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.class_3376;
   import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.class_1667;
   import com.sulake.room.utils.class_3497;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PlaneRasterizer implements class_3376
   {
      
      protected static const DEFAULT_TYPE:String = "default";
       
      
      private var _assetCollection:IGraphicAssetCollection = null;
      
      private var _materials:class_24 = null;
      
      private var var_1660:class_24 = null;
      
      private var var_37:class_24 = null;
      
      private var var_2117:class_24 = null;
      
      private var var_45:XML = null;
      
      public function PlaneRasterizer()
      {
         super();
         var_1660 = new class_24();
         _materials = new class_24();
         var_37 = new class_24();
         var_2117 = new class_24();
      }
      
      protected function get data() : XML
      {
         return var_45;
      }
      
      protected function get assetCollection() : IGraphicAssetCollection
      {
         return _assetCollection;
      }
      
      public function initializeDimensions(param1:int, param2:int) : Boolean
      {
         return true;
      }
      
      public function dispose() : void
      {
         var _loc1_:Plane = null;
         var _loc3_:RoomGeometry = null;
         var _loc2_:int = 0;
         if(var_37 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_37.length)
            {
               _loc1_ = var_37.getWithIndex(_loc2_) as Plane;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc2_++;
            }
            var_37.dispose();
            var_37 = null;
         }
         if(_materials != null)
         {
            resetMaterials();
            _materials.dispose();
            _materials = null;
         }
         if(var_1660 != null)
         {
            resetTextures();
            var_1660.dispose();
            var_1660 = null;
         }
         if(var_2117 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_2117.length)
            {
               _loc3_ = var_2117.getWithIndex(_loc2_);
               if(_loc3_ != null)
               {
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            var_2117.dispose();
            var_2117 = null;
         }
         var_45 = null;
         _assetCollection = null;
      }
      
      public function clearCache() : void
      {
         var _loc1_:Plane = null;
         var _loc2_:PlaneMaterial = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < var_37.length)
         {
            _loc1_ = var_37.getWithIndex(_loc3_) as Plane;
            if(_loc1_ != null)
            {
               _loc1_.clearCache();
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _materials.length)
         {
            _loc2_ = _materials.getWithIndex(_loc3_) as PlaneMaterial;
            if(_loc2_ != null)
            {
               _loc2_.clearCache();
            }
            _loc3_++;
         }
      }
      
      public function initialize(param1:XML) : void
      {
         var_45 = param1;
      }
      
      public function reinitialize() : void
      {
         resetTextures();
         resetMaterials();
         initializeAll();
      }
      
      private function resetMaterials() : void
      {
         var _loc2_:int = 0;
         var _loc1_:PlaneMaterial = null;
         _loc2_ = 0;
         while(_loc2_ < _materials.length)
         {
            _loc1_ = _materials.getWithIndex(_loc2_) as PlaneMaterial;
            if(_loc1_ != null)
            {
               _loc1_.dispose();
            }
            _loc2_++;
         }
         _materials.reset();
      }
      
      private function resetTextures() : void
      {
         var _loc2_:int = 0;
         var _loc1_:PlaneTexture = null;
         _loc2_ = 0;
         while(_loc2_ < var_1660.length)
         {
            _loc1_ = var_1660.getWithIndex(_loc2_) as PlaneTexture;
            if(_loc1_ != null)
            {
               _loc1_.dispose();
            }
            _loc2_++;
         }
         var_1660.reset();
      }
      
      protected function getTexture(param1:String) : PlaneTexture
      {
         return var_1660.getValue(param1) as PlaneTexture;
      }
      
      protected function getMaterial(param1:String) : PlaneMaterial
      {
         return _materials.getValue(param1) as PlaneMaterial;
      }
      
      protected function getPlane(param1:String) : Plane
      {
         return var_37.getValue(param1);
      }
      
      protected function addPlane(param1:String, param2:Plane) : Boolean
      {
         if(param2 == null)
         {
            return false;
         }
         if(var_37.getValue(param1) == null)
         {
            var_37.add(param1,param2);
            return true;
         }
         return false;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(data == null)
         {
            return;
         }
         _assetCollection = param1;
         initializeAll();
      }
      
      private function initializeAll() : void
      {
         if(data == null)
         {
            return;
         }
         initializeTexturesAndMaterials();
         initializePlanes();
      }
      
      private function initializeTexturesAndMaterials() : void
      {
         var _loc2_:XMLList = data.textures;
         if(_loc2_.length() > 0)
         {
            parseTextures(_loc2_[0],assetCollection);
         }
         var _loc1_:XMLList = data.materials;
         if(_loc1_.length() > 0)
         {
            parsePlaneMaterials(_loc1_[0]);
         }
      }
      
      protected function initializePlanes() : void
      {
      }
      
      private function parseTextures(param1:XML, param2:IGraphicAssetCollection) : void
      {
         var _loc7_:int = 0;
         var _loc6_:XML = null;
         var _loc16_:String = null;
         var _loc4_:PlaneTexture = null;
         var _loc3_:XMLList = null;
         var _loc9_:int = 0;
         var _loc13_:XML = null;
         var _loc8_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:String = null;
         var _loc17_:IGraphicAsset = null;
         var _loc11_:BitmapDataAsset = null;
         var _loc12_:BitmapData = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         var _loc5_:XMLList = param1.texture;
         _loc7_ = 0;
         while(_loc7_ < _loc5_.length())
         {
            _loc6_ = _loc5_[_loc7_];
            if(class_1667.checkRequiredAttributes(_loc6_,["id"]))
            {
               _loc16_ = _loc6_.@id;
               if(var_1660.getValue(_loc16_) == null)
               {
                  _loc4_ = new PlaneTexture();
                  _loc3_ = _loc6_.bitmap;
                  _loc9_ = 0;
                  while(_loc9_ < _loc3_.length())
                  {
                     _loc13_ = _loc3_[_loc9_];
                     if(class_1667.checkRequiredAttributes(_loc13_,["assetName"]))
                     {
                        _loc8_ = -1;
                        _loc18_ = 1;
                        _loc10_ = -1;
                        _loc14_ = 1;
                        if(String(_loc13_.@normalMinX) != "")
                        {
                           _loc8_ = parseFloat(_loc13_.@normalMinX);
                        }
                        if(String(_loc13_.@normalMaxX) != "")
                        {
                           _loc18_ = parseFloat(_loc13_.@normalMaxX);
                        }
                        if(String(_loc13_.@normalMinY) != "")
                        {
                           _loc10_ = parseFloat(_loc13_.@normalMinY);
                        }
                        if(String(_loc13_.@normalMaxY) != "")
                        {
                           _loc14_ = parseFloat(_loc13_.@normalMaxY);
                        }
                        _loc15_ = _loc13_.@assetName;
                        if((_loc17_ = param2.getAsset(_loc15_)) != null)
                        {
                           if((_loc11_ = _loc17_.asset as BitmapDataAsset) != null)
                           {
                              if((_loc12_ = _loc11_.content as BitmapData) != null)
                              {
                                 if(_loc17_.flipH)
                                 {
                                    _loc12_ = class_3497.getFlipHBitmapData(_loc12_);
                                 }
                                 else
                                 {
                                    _loc12_ = _loc12_.clone();
                                 }
                                 _loc4_.addBitmap(_loc12_,_loc8_,_loc18_,_loc10_,_loc14_,_loc15_);
                              }
                           }
                        }
                     }
                     _loc9_++;
                  }
                  var_1660.add(_loc16_,_loc4_);
               }
            }
            _loc7_++;
         }
      }
      
      private function parsePlaneMaterials(param1:XML) : void
      {
         var _loc4_:int = 0;
         var _loc15_:XML = null;
         var _loc20_:String = null;
         var _loc8_:PlaneMaterial = null;
         var _loc2_:XMLList = null;
         var _loc6_:int = 0;
         var _loc11_:XML = null;
         var _loc16_:String = null;
         var _loc12_:String = null;
         var _loc3_:int = 0;
         var _loc10_:int = 0;
         var _loc5_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc18_:XMLList = null;
         var _loc13_:PlaneMaterialCellMatrix = null;
         var _loc9_:int = 0;
         var _loc14_:XML = null;
         if(param1 == null)
         {
            return;
         }
         var _loc17_:XMLList = param1.material;
         _loc4_ = 0;
         while(_loc4_ < _loc17_.length())
         {
            _loc15_ = _loc17_[_loc4_];
            if(class_1667.checkRequiredAttributes(_loc15_,["id"]))
            {
               _loc20_ = _loc15_.@id;
               _loc8_ = new PlaneMaterial();
               _loc2_ = _loc15_.materialCellMatrix;
               _loc6_ = 0;
               while(_loc6_ < _loc2_.length())
               {
                  _loc16_ = (_loc11_ = _loc2_[_loc6_]).@repeatMode;
                  _loc12_ = _loc11_.@align;
                  _loc3_ = 1;
                  switch(_loc16_)
                  {
                     case "borders":
                        _loc3_ = 2;
                        break;
                     case "center":
                        _loc3_ = 3;
                        break;
                     case "first":
                        _loc3_ = 4;
                        break;
                     case "last":
                        _loc3_ = 5;
                        break;
                     case "random":
                        _loc3_ = 6;
                  }
                  _loc10_ = 1;
                  switch(_loc12_)
                  {
                     case "top":
                        _loc10_ = 1;
                        break;
                     case "bottom":
                        _loc10_ = 2;
                  }
                  _loc5_ = -1;
                  _loc21_ = 1;
                  _loc7_ = -1;
                  _loc19_ = 1;
                  if(String(_loc11_.@normalMinX) != "")
                  {
                     _loc5_ = parseFloat(_loc11_.@normalMinX);
                  }
                  if(String(_loc11_.@normalMaxX) != "")
                  {
                     _loc21_ = parseFloat(_loc11_.@normalMaxX);
                  }
                  if(String(_loc11_.@normalMinY) != "")
                  {
                     _loc7_ = parseFloat(_loc11_.@normalMinY);
                  }
                  if(String(_loc11_.@normalMaxY) != "")
                  {
                     _loc19_ = parseFloat(_loc11_.@normalMaxY);
                  }
                  if((_loc18_ = _loc11_.materialCellColumn).length() > 0)
                  {
                     _loc13_ = null;
                     _loc13_ = _loc8_.addMaterialCellMatrix(_loc18_.length(),_loc3_,_loc10_,_loc5_,_loc21_,_loc7_,_loc19_);
                     _loc9_ = 0;
                     while(_loc9_ < _loc18_.length())
                     {
                        _loc14_ = _loc18_[_loc9_];
                        parsePlaneMaterialCellColumn(_loc14_,_loc13_,_loc9_);
                        _loc9_++;
                     }
                  }
                  _materials.add(_loc20_,_loc8_);
                  _loc6_++;
               }
            }
            _loc4_++;
         }
      }
      
      private function parsePlaneMaterialCellColumn(param1:XML, param2:PlaneMaterialCellMatrix, param3:int) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         var _loc5_:String = param1.@repeatMode;
         var _loc7_:int = parseInt(param1.@width);
         var _loc6_:int = 1;
         switch(_loc5_)
         {
            case "borders":
               _loc6_ = 2;
               break;
            case "center":
               _loc6_ = 3;
               break;
            case "first":
               _loc6_ = 4;
               break;
            case "last":
               _loc6_ = 5;
               break;
            case "none":
               _loc6_ = 0;
         }
         var _loc4_:Array = parsePlaneMaterialCells(param1);
         param2.createColumn(param3,_loc7_,_loc4_,_loc6_);
      }
      
      private function parsePlaneMaterialCells(param1:XML) : Array
      {
         var _loc6_:int = 0;
         var _loc13_:XML = null;
         var _loc8_:String = null;
         var _loc20_:Array = null;
         var _loc21_:* = null;
         var _loc2_:Array = null;
         var _loc14_:int = 0;
         var _loc3_:XMLList = null;
         var _loc10_:XML = null;
         var _loc18_:XMLList = null;
         var _loc4_:XMLList = null;
         var _loc15_:XML = null;
         var _loc12_:XML = null;
         var _loc7_:int = 0;
         var _loc16_:String = null;
         var _loc19_:IGraphicAsset = null;
         var _loc5_:PlaneTexture = null;
         var _loc9_:PlaneMaterialCell = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc11_:* = [];
         var _loc17_:XMLList = param1.materialCell;
         _loc6_ = 0;
         while(_loc6_ < _loc17_.length())
         {
            _loc8_ = (_loc13_ = _loc17_[_loc6_]).@textureId;
            _loc20_ = null;
            _loc21_ = null;
            _loc2_ = null;
            _loc14_ = 0;
            _loc3_ = _loc13_.extraItemData;
            if(_loc3_.length() > 0)
            {
               _loc18_ = (_loc10_ = _loc3_[0]).extraItemTypes;
               _loc4_ = _loc10_.offsets;
               if(_loc18_.length() > 0 && _loc4_.length() > 0)
               {
                  _loc15_ = _loc18_[0];
                  _loc12_ = _loc4_[0];
                  _loc20_ = parseExtraItemTypes(_loc15_);
                  _loc2_ = parseExtraItemOffsets(_loc12_);
                  _loc14_ = int(_loc2_.length);
                  if(String(_loc10_.@limitMax) != "")
                  {
                     _loc14_ = parseInt(_loc10_.@limitMax);
                  }
               }
            }
            if(_loc20_ != null)
            {
               _loc21_ = [];
               _loc7_ = 0;
               while(_loc7_ < _loc20_.length)
               {
                  _loc16_ = String(_loc20_[_loc6_]);
                  if((_loc19_ = _assetCollection.getAsset(_loc16_)) != null)
                  {
                     _loc21_.push(_loc19_);
                  }
                  _loc7_++;
               }
            }
            _loc5_ = getTexture(_loc8_);
            _loc9_ = new PlaneMaterialCell(_loc5_,_loc21_,_loc2_,_loc14_);
            _loc11_.push(_loc9_);
            _loc6_++;
         }
         if(_loc11_.length == 0)
         {
            _loc11_ = null;
         }
         return _loc11_;
      }
      
      private function parseExtraItemTypes(param1:XML) : Array
      {
         var _loc3_:XMLList = null;
         var _loc4_:int = 0;
         var _loc5_:XML = null;
         var _loc6_:String = null;
         var _loc2_:* = [];
         var _loc7_:* = ["assetName"];
         if(param1 != null)
         {
            _loc3_ = param1.extraItemType;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length())
            {
               _loc5_ = _loc3_[_loc4_];
               if(class_1667.checkRequiredAttributes(_loc5_,_loc7_))
               {
                  _loc6_ = _loc5_.@assetName;
                  _loc2_.push(_loc6_);
               }
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      private function parseExtraItemOffsets(param1:XML) : Array
      {
         var _loc4_:XMLList = null;
         var _loc6_:int = 0;
         var _loc3_:XML = null;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:* = [];
         var _loc8_:* = ["x","y"];
         if(param1 != null)
         {
            _loc4_ = param1.offset;
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length())
            {
               _loc3_ = _loc4_[_loc6_];
               if(class_1667.checkRequiredAttributes(_loc3_,_loc8_))
               {
                  _loc5_ = parseInt(_loc3_.@x);
                  _loc7_ = parseInt(_loc3_.@y);
                  _loc2_.push(new Point(_loc5_,_loc7_));
               }
               _loc6_++;
            }
         }
         return _loc2_;
      }
      
      protected function getGeometry(param1:int, param2:Number, param3:Number) : IRoomGeometry
      {
         param2 = Math.abs(param2);
         if(param2 > 90)
         {
            param2 = 90;
         }
         param3 = Math.abs(param3);
         if(param3 > 90)
         {
            param3 = 90;
         }
         var _loc5_:String = param1 + "_" + Math.round(param2) + "_" + Math.round(param3);
         var _loc4_:IRoomGeometry;
         if((_loc4_ = var_2117.getValue(_loc5_)) == null)
         {
            _loc4_ = new RoomGeometry(param1,new Vector3d(param2,param3),new Vector3d(-10,0,0));
            var_2117.add(_loc5_,_loc4_);
         }
         return _loc4_;
      }
      
      protected function parseVisualizations(param1:Plane, param2:XMLList) : void
      {
         var _loc8_:int = 0;
         var _loc3_:XML = null;
         var _loc16_:int = 0;
         var _loc6_:String = null;
         var _loc20_:String = null;
         var _loc18_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc19_:XMLList = null;
         var _loc7_:PlaneVisualization = null;
         var _loc10_:int = 0;
         var _loc13_:XML = null;
         var _loc17_:PlaneMaterial = null;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc21_:String = null;
         var _loc4_:int = 0;
         var _loc9_:String = null;
         var _loc5_:* = 0;
         var _loc15_:String = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         _loc8_ = 0;
         while(_loc8_ < param2.length())
         {
            _loc3_ = param2[_loc8_];
            if(class_1667.checkRequiredAttributes(_loc3_,["size"]))
            {
               _loc16_ = parseInt(_loc3_.@size);
               _loc6_ = _loc3_.@horizontalAngle;
               _loc20_ = _loc3_.@verticalAngle;
               _loc18_ = 45;
               if(_loc6_ != "")
               {
                  _loc18_ = parseFloat(_loc6_);
               }
               _loc14_ = 30;
               if(_loc20_ != "")
               {
                  _loc14_ = parseFloat(_loc20_);
               }
               _loc19_ = _loc3_.visualizationLayer;
               if((_loc7_ = param1.createPlaneVisualization(_loc16_,_loc19_.length(),getGeometry(_loc16_,_loc18_,_loc14_))) != null)
               {
                  _loc10_ = 0;
                  while(_loc10_ < _loc19_.length())
                  {
                     _loc13_ = _loc19_[_loc10_];
                     _loc17_ = null;
                     _loc11_ = 1;
                     if(class_1667.checkRequiredAttributes(_loc13_,["materialId"]))
                     {
                        _loc12_ = _loc13_.@materialId;
                        _loc17_ = getMaterial(_loc12_);
                     }
                     _loc21_ = _loc13_.@offset;
                     _loc4_ = 0;
                     if(_loc21_.length > 0)
                     {
                        _loc4_ = parseInt(_loc21_);
                     }
                     _loc9_ = _loc13_.@color;
                     _loc5_ = 16777215;
                     if(_loc9_.length > 0)
                     {
                        _loc5_ = parseInt(_loc9_);
                     }
                     if((_loc15_ = _loc13_.@align) == "bottom")
                     {
                        _loc11_ = 2;
                     }
                     else if(_loc15_ == "top")
                     {
                        _loc11_ = 1;
                     }
                     _loc7_.setLayer(_loc10_,_loc17_,_loc5_,_loc11_,_loc4_);
                     _loc10_++;
                  }
               }
            }
            _loc8_++;
         }
      }
      
      public function render(param1:BitmapData, param2:String, param3:Number, param4:Number, param5:Number, param6:IVector3d, param7:Boolean, param8:Number = 0, param9:Number = 0, param10:Number = 0, param11:Number = 0, param12:int = 0) : PlaneBitmapData
      {
         return null;
      }
      
      public function getTextureIdentifier(param1:Number, param2:IVector3d) : String
      {
         return String(param1);
      }
      
      public function getLayers(param1:String) : Array
      {
         var _loc2_:Plane = getPlane(param1);
         if(_loc2_ == null)
         {
            _loc2_ = getPlane("default");
         }
         return _loc2_.getLayers();
      }
   }
}
