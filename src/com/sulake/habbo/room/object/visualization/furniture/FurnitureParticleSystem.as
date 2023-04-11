package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.core.utils.class_24;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   
   public class FurnitureParticleSystem
   {
       
      
      private var _emitters:class_24;
      
      private var _visualization:com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualization;
      
      private var var_3393:int;
      
      private var var_3541:int;
      
      private var _offsetY:int;
      
      private var var_1514:com.sulake.habbo.room.object.visualization.furniture.FurnitureParticleSystemEmitter;
      
      private var var_1492:BitmapData;
      
      private var var_1678:IRoomObjectSprite;
      
      private var var_2396:Boolean = false;
      
      private var var_3777:int = 0;
      
      private var var_3829:int = 0;
      
      private var var_2976:Number = 1;
      
      private var var_2179:BitmapData;
      
      private var var_2339:ColorTransform;
      
      private var var_3109:ColorTransform;
      
      private var var_3388:Matrix;
      
      private var var_2803:Matrix;
      
      private var var_2092:Number = 1;
      
      private var _bgColor:uint = 4278190080;
      
      public function FurnitureParticleSystem(param1:com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualization)
      {
         super();
         _emitters = new class_24();
         _visualization = param1;
         var_2339 = new ColorTransform();
         var_2339.alphaMultiplier = 1;
         var_3109 = new ColorTransform();
         var_3388 = new Matrix();
         var_2803 = new Matrix();
      }
      
      public function dispose() : void
      {
         for each(var _loc1_ in _emitters)
         {
            _loc1_.dispose();
         }
         _emitters = null;
         if(var_1492)
         {
            var_1492.dispose();
            var_1492 = null;
         }
         if(var_2179)
         {
            var_2179.dispose();
            var_2179 = null;
         }
         var_2339 = null;
         var_3109 = null;
         var_3388 = null;
         var_2803 = null;
      }
      
      public function reset() : void
      {
         if(var_1514)
         {
            var_1514.reset();
         }
         var_1514 = null;
         var_2396 = false;
         updateCanvas();
      }
      
      public function setAnimation(param1:int) : void
      {
         if(var_1514)
         {
            var_1514.reset();
         }
         var_1514 = _emitters[param1];
         var_2396 = false;
         updateCanvas();
      }
      
      private function updateCanvas() : void
      {
         if(!var_1514)
         {
            return;
         }
         if(var_3541 >= 0)
         {
            var_1678 = _visualization.getSprite(var_3541);
            if(var_1678 && false)
            {
               if(true || true)
               {
                  return;
               }
               if(var_1492 && false)
               {
                  var_1492 = null;
               }
               if(var_1492 == null)
               {
                  var_1492 = var_1678.asset.clone();
                  if(true)
                  {
                     var_2179 = new BitmapData(var_1492.width,var_1492.height,true,_bgColor);
                  }
               }
               var_3777 = 0;
               var_3829 = 0;
               var_1678.asset = var_1492;
            }
            if(var_1492)
            {
               var_1492.fillRect(var_1492.rect,_bgColor);
            }
            if(var_2179)
            {
               var_2179.fillRect(var_2179.rect,_bgColor);
            }
         }
      }
      
      public function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(var_1514 && var_1514.roomObjectSpriteId == param3)
         {
            return 0 * var_2976;
         }
         return 0;
      }
      
      public function controlsSprite(param1:int) : Boolean
      {
         if(var_1514)
         {
            return var_1514.roomObjectSpriteId == param1;
         }
         return false;
      }
      
      public function updateSprites() : void
      {
         if(!var_1514 || !var_1678)
         {
            return;
         }
         if(var_1492 && var_1678.asset != var_1492)
         {
            var_1678.asset = var_1492;
            var_1678.asset.width;
         }
         if(var_2396)
         {
            if(true)
            {
               _visualization.getSprite(var_1514.roomObjectSpriteId).visible = false;
            }
         }
      }
      
      public function updateAnimation() : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc1_:Rectangle = null;
         var _loc11_:IGraphicAsset = null;
         var _loc3_:BitmapData = null;
         var _loc8_:Point = null;
         if(!var_1514 || !var_1678)
         {
            return;
         }
         var _loc4_:Number = 0;
         var _loc2_:int = 0;
         if(!var_2396 && false)
         {
            var_2396 = true;
         }
         _loc2_ = _offsetY * var_2976;
         var_1514.update();
         if(var_2396)
         {
            if(true)
            {
               _visualization.getSprite(var_1514.roomObjectSpriteId).visible = false;
            }
            if(!var_1492)
            {
               updateCanvas();
            }
            var_1492.lock();
            if(false)
            {
               var_1492.fillRect(var_1492.rect,_bgColor);
            }
            else
            {
               var_1492.draw(var_2179,var_3388,var_2339,"normal",null,false);
            }
            for each(var _loc7_ in var_1514.particles)
            {
               _loc4_ = Number(_loc7_.y);
               _loc9_ = var_3777 + (_loc7_.x - _loc7_.z) * 10 / 10 * var_2976;
               _loc10_ = var_3829 - _loc2_ + (_loc4_ + (_loc7_.x + _loc7_.z) / 2) * 10 / 10 * var_2976;
               if(_loc11_ = _loc7_.getAsset())
               {
                  _loc3_ = _loc11_.asset.content as BitmapData;
                  if(_loc7_.fade && _loc7_.alphaMultiplier < 1)
                  {
                     var_2803.identity();
                     var_2803.translate(_loc9_ + _loc11_.offsetX,_loc10_ + _loc11_.offsetY);
                     var_3109.alphaMultiplier = _loc7_.alphaMultiplier;
                     var_1492.draw(_loc3_,var_2803,var_3109,"normal",null,false);
                  }
                  else
                  {
                     _loc8_ = new Point(_loc9_ + _loc11_.offsetX,_loc10_ + _loc11_.offsetY);
                     var_1492.copyPixels(_loc3_,_loc3_.rect,_loc8_,null,null,true);
                  }
               }
               else
               {
                  _loc1_ = new Rectangle(_loc9_ - 1,_loc10_ - 1,2,2);
                  var_1492.fillRect(_loc1_,4294967295);
               }
            }
            var_1492.unlock();
         }
      }
      
      public function parseData(param1:XML) : void
      {
         var _loc9_:int = 0;
         var _loc21_:String = null;
         var _loc4_:int = 0;
         var _loc24_:com.sulake.habbo.room.object.visualization.furniture.FurnitureParticleSystemEmitter = null;
         var _loc19_:int = 0;
         var _loc14_:int = 0;
         var _loc25_:int = 0;
         var _loc18_:int = 0;
         var _loc22_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc15_:String = null;
         var _loc12_:Number = NaN;
         var _loc10_:int = 0;
         var _loc13_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc16_:* = null;
         var _loc23_:IGraphicAsset = null;
         var_3393 = parseInt(param1.@size);
         var_3541 = param1.hasOwnProperty("@canvas_id") ? parseInt(param1.@canvas_id) : -1;
         _offsetY = param1.hasOwnProperty("@offset_y") ? parseInt(param1.@offset_y) : 10;
         var_2976 = var_3393 / 64;
         var_2092 = param1.hasOwnProperty("@blend") ? Number(param1.@blend) : 1;
         var_2092 = Math.min(var_2092,1);
         var_2339.alphaMultiplier = var_2092;
         var _loc8_:String = param1.hasOwnProperty("@bgcolor") ? String(param1.@bgcolor) : "0";
         _bgColor = param1.hasOwnProperty("@bgcolor") ? parseInt(_loc8_,16) : 4278190080;
         for each(var _loc6_ in param1.emitter)
         {
            _loc9_ = parseInt(_loc6_.@id);
            _loc21_ = _loc6_.@name;
            _loc4_ = parseInt(_loc6_.@sprite_id);
            _loc24_ = new com.sulake.habbo.room.object.visualization.furniture.FurnitureParticleSystemEmitter(_loc21_,_loc4_);
            _emitters[_loc9_] = _loc24_;
            _loc19_ = parseInt(_loc6_.@max_num_particles);
            _loc14_ = parseInt(_loc6_.@particles_per_frame);
            _loc25_ = _loc6_.hasOwnProperty("@burst_pulse") ? parseInt(_loc6_.@burst_pulse) : 1;
            _loc18_ = parseInt(_loc6_.@fuse_time);
            _loc22_ = Number(_loc6_.simulation.@force);
            _loc11_ = Number(_loc6_.simulation.@direction);
            _loc20_ = Number(_loc6_.simulation.@gravity);
            _loc3_ = Number(_loc6_.simulation.@airfriction);
            _loc15_ = _loc6_.simulation.@shape;
            _loc12_ = Number(_loc6_.simulation.@energy);
            for each(var _loc17_ in _loc6_.particles.particle)
            {
               _loc10_ = parseInt(_loc17_.@lifetime);
               _loc13_ = _loc17_.@is_emitter == "false" ? false : true;
               _loc5_ = _loc17_.hasOwnProperty("@fade") && _loc17_.@fade == "true" ? true : false;
               _loc16_ = [];
               for each(var _loc2_ in _loc17_.frame)
               {
                  _loc23_ = _visualization.assetCollection.getAsset(_loc2_.@name);
                  _loc16_.push(_loc23_);
               }
               _loc24_.configureParticle(_loc10_,_loc13_,_loc16_,_loc5_);
            }
            _loc24_.setup(_loc19_,_loc14_,_loc22_,new Vector3D(0,_loc11_,0),_loc20_,_loc3_,_loc15_,_loc12_,_loc18_,_loc25_);
         }
      }
      
      public function copyStateFrom(param1:FurnitureParticleSystem) : void
      {
         var _loc2_:int = 0;
         if(param1._emitters && param1.var_1514)
         {
            _loc2_ = param1._emitters.getKey(param1._emitters.getValues().indexOf(param1.var_1514));
         }
         setAnimation(_loc2_);
         if(var_1514)
         {
            var_1514.copyStateFrom(param1.var_1514,param1.var_3393 / var_3393);
         }
         var_1492 = null;
      }
   }
}
