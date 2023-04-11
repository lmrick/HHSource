package com.sulake.room.renderer
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.RoomRotatingEffect;
   import com.sulake.room.utils.RoomShakingEffect;
   import com.sulake.room.utils.Vector3d;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class RotatingRoomSpriteCanvas extends class_3398
   {
       
      
      private var _tools:Sprite;
      
      private var var_2440:Boolean = false;
      
      private var _rotation:Number = 0;
      
      private var _rotationOrigin:Vector3d = null;
      
      private var _rotationRodLength:Number = 0;
      
      private var var_1747:Array;
      
      private var var_1865:Array;
      
      private var var_1809:Vector3d;
      
      private var var_2679:Vector3d;
      
      private var var_1186:int = 0;
      
      public function RotatingRoomSpriteCanvas(param1:class_3221, param2:int, param3:int, param4:int, param5:int)
      {
         var_1747 = [];
         var_1865 = [];
         super(param1,param2,param3,param4,param5);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _tools = null;
         var_1747 = [];
         var_1865 = [];
      }
      
      override public function initialize(param1:int, param2:int) : void
      {
         super.initialize(param1,param2);
      }
      
      override public function render(param1:int, param2:Boolean = false) : void
      {
         doMagic();
         super.render(param1,param2);
      }
      
      override public function handleMouseEvent(param1:int, param2:int, param3:String, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean) : Boolean
      {
         var _loc8_:Boolean = super.handleMouseEvent(param1,param2,param3,param4,param5,param6,param7);
         if(param3 == "click")
         {
            checkButtonHits(param1 + screenOffsetX,param2 + screenOffsetY);
         }
         return _loc8_;
      }
      
      private function getGeometry() : RoomGeometry
      {
         return geometry as RoomGeometry;
      }
      
      private function doMagic() : void
      {
         var _loc2_:IVector3d = null;
         var _loc3_:Vector3d = null;
         var _loc4_:IVector3d = null;
         var _loc1_:Vector3d = null;
         if(_rotation != 0)
         {
            _loc2_ = var_1809;
            getGeometry().direction = new Vector3d(_loc2_.x + _rotation,_loc2_.y,_loc2_.z);
            _loc2_ = getGeometry().direction;
            getGeometry().setDepthVector(new Vector3d(_loc2_.x,_loc2_.y,5));
            _loc3_ = new Vector3d();
            _loc3_.assign(_rotationOrigin);
            _loc3_.x += _rotationRodLength * Math.cos((_loc2_.x + 180) / 180 * 3.141592653589793) * Math.cos(_loc2_.y / 180 * 3.141592653589793);
            _loc3_.y += _rotationRodLength * Math.sin((_loc2_.x + 180) / 180 * 3.141592653589793) * Math.cos(_loc2_.y / 180 * 3.141592653589793);
            _loc3_.z += _rotationRodLength * Math.sin(_loc2_.y / 180 * 3.141592653589793);
            getGeometry().location = _loc3_;
            var_2679 = new Vector3d();
            var_2679.assign(_loc3_);
            var_1809 = new Vector3d();
            var_1809.assign(getGeometry().direction);
         }
         if(RoomShakingEffect.isVisualizationOn() && !var_2440)
         {
            changeShaking();
         }
         else if(!RoomShakingEffect.isVisualizationOn() && var_2440)
         {
            changeShaking();
         }
         if(RoomRotatingEffect.isVisualizationOn())
         {
            changeRotation();
         }
         if(var_2440)
         {
            var_1186++;
            _loc4_ = var_1809;
            _loc1_ = Vector3d.sum(_loc4_,new Vector3d(Math.sin(var_1186 * 5 / 180 * 3.141592653589793) * 2,Math.sin(var_1186 / 180 * 3.141592653589793) * 5,Math.sin(var_1186 * 10 / 180 * 3.141592653589793) * 2));
            getGeometry().direction = _loc1_;
         }
         else
         {
            var_1186 = 0;
            getGeometry().direction = var_1809;
         }
      }
      
      private function createTestingTools() : void
      {
         var _loc4_:* = null;
         var _loc1_:Rectangle = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(_tools == null && displayObject is Sprite)
         {
            _tools = new Sprite();
            (displayObject as Sprite).addChild(_tools);
            _loc4_ = [16776960,16711680,65280,11184810,11184810,11184810,11184810];
            _loc1_ = null;
            _loc1_ = new Rectangle(58,8,16,16);
            var_1747.push(_loc1_);
            _loc1_ = new Rectangle(58,28,16,16);
            var_1747.push(_loc1_);
            _loc1_ = new Rectangle(58,48,16,16);
            var_1747.push(_loc1_);
            _loc1_ = new Rectangle(82,28,16,16);
            var_1747.push(_loc1_);
            _loc1_ = new Rectangle(122,28,16,16);
            var_1747.push(_loc1_);
            _loc1_ = new Rectangle(102,8,16,16);
            var_1747.push(_loc1_);
            _loc1_ = new Rectangle(102,48,16,16);
            var_1747.push(_loc1_);
            _loc3_ = 0;
            while(_loc3_ < var_1747.length)
            {
               _loc1_ = var_1747[_loc3_] as Rectangle;
               _loc2_ = 0;
               _tools.graphics.beginFill(_loc2_);
               _tools.graphics.drawRect(_loc1_.x - 1,_loc1_.y - 1,_loc1_.width + 2,_loc1_.height + 2);
               _tools.graphics.endFill();
               _loc2_ = int(_loc4_[_loc3_]);
               _tools.graphics.beginFill(_loc2_);
               _tools.graphics.drawRect(_loc1_.x,_loc1_.y,_loc1_.width,_loc1_.height);
               _tools.graphics.endFill();
               _loc3_++;
            }
            var_1865.push(changeScale);
            var_1865.push(changeShaking);
            var_1865.push(changeRotation);
            var_1865.push(moveLeft);
            var_1865.push(moveRight);
            var_1865.push(moveUp);
            var_1865.push(moveDown);
         }
      }
      
      private function checkButtonHits(param1:int, param2:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:Rectangle = null;
         _loc4_ = 0;
         while(_loc4_ < var_1747.length)
         {
            _loc3_ = var_1747[_loc4_] as Rectangle;
            if(param1 >= _loc3_.x && param1 <= _loc3_.x + _loc3_.width && param2 >= _loc3_.y && param2 <= _loc3_.y + _loc3_.height)
            {
               if(var_1865.length > _loc4_)
               {
                  var_1865[_loc4_]();
               }
            }
            _loc4_++;
         }
      }
      
      private function changeScale() : void
      {
         if(getGeometry().scale < 64)
         {
            getGeometry().scale = 64;
         }
         else
         {
            getGeometry().scale = 32;
         }
      }
      
      private function changeShaking() : void
      {
         var _loc1_:IVector3d = null;
         var_2440 = !var_2440;
         if(var_2440)
         {
            _loc1_ = getGeometry().direction;
            var_1809 = new Vector3d(_loc1_.x,_loc1_.y,_loc1_.z);
         }
      }
      
      private function changeRotation() : void
      {
         var _loc3_:IVector3d = null;
         var _loc1_:IVector3d = null;
         var _loc2_:IVector3d = null;
         if(var_2440)
         {
            return;
         }
         if(_rotation == 0)
         {
            if(getGeometry() != null)
            {
               _loc3_ = getGeometry().location;
               _loc1_ = getGeometry().directionAxis;
               var_2679 = new Vector3d();
               var_2679.assign(_loc3_);
               var_1809 = new Vector3d();
               var_1809.assign(getGeometry().direction);
               _loc2_ = RoomGeometry.getIntersectionVector(_loc3_,_loc1_,new Vector3d(0,0,0),new Vector3d(0,0,1));
               if(_loc2_ != null)
               {
                  _rotationOrigin = new Vector3d(_loc2_.x,_loc2_.y,_loc2_.z);
                  _rotationRodLength = Vector3d.dif(_loc2_,_loc3_).length;
                  _rotation = 1;
               }
            }
         }
         else
         {
            _rotation = 0;
            if(getGeometry() != null)
            {
               getGeometry().location = var_2679;
               getGeometry().direction = var_1809;
               getGeometry().setDepthVector(new Vector3d(var_1809.x,var_1809.y,5));
            }
         }
      }
      
      private function moveLeft() : void
      {
         var _loc1_:Number = NaN;
         if(_rotation != 0)
         {
            if(_rotation == 1)
            {
               _rotation = -1;
            }
            else
            {
               _rotation -= 1;
            }
            return;
         }
         if(getGeometry() != null)
         {
            _loc1_ = (getGeometry().direction.x - 90) / 180 * 3.141592653589793;
            getGeometry().location = Vector3d.sum(getGeometry().location,new Vector3d(Math.cos(_loc1_) * Math.sqrt(2),Math.sin(_loc1_) * Math.sqrt(2)));
         }
      }
      
      private function moveRight() : void
      {
         var _loc1_:Number = NaN;
         if(_rotation != 0)
         {
            if(_rotation == -1)
            {
               _rotation = 1;
            }
            else
            {
               _rotation += 1;
            }
            return;
         }
         if(getGeometry() != null)
         {
            _loc1_ = (getGeometry().direction.x + 90) / 180 * 3.141592653589793;
            getGeometry().location = Vector3d.sum(getGeometry().location,new Vector3d(Math.cos(_loc1_) * Math.sqrt(2),Math.sin(_loc1_) * Math.sqrt(2)));
         }
      }
      
      private function moveUp() : void
      {
         var _loc1_:Number = NaN;
         if(_rotation != 0)
         {
            return;
         }
         if(getGeometry() != null)
         {
            _loc1_ = getGeometry().direction.x / 180 * 3.141592653589793;
            getGeometry().location = Vector3d.sum(getGeometry().location,new Vector3d(Math.cos(_loc1_) * Math.sqrt(2),Math.sin(_loc1_) * Math.sqrt(2)));
         }
      }
      
      private function moveDown() : void
      {
         var _loc1_:Number = NaN;
         if(_rotation != 0)
         {
            return;
         }
         if(getGeometry() != null)
         {
            _loc1_ = (geometry.direction.x + 180) / 180 * 3.141592653589793;
            getGeometry().location = Vector3d.sum(getGeometry().location,new Vector3d(Math.cos(_loc1_) * Math.sqrt(2),Math.sin(_loc1_) * Math.sqrt(2)));
         }
      }
   }
}
