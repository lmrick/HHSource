package com.sulake.habbo.room.object.visualization.furniture
{
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   public class FurnitureParticleSystemEmitter extends FurnitureParticleSystemParticle
   {
      
      public static const SHAPE_CONE:String = "cone";
      
      public static const SHAPE_PLANE:String = "plane";
      
      public static const SHAPE_SPHERE:String = "sphere";
       
      
      private var _name:String;
      
      private var var_3790:int = -1;
      
      private var var_3130:Number;
      
      private var _direction:Vector3D;
      
      private var var_2376:Number = 0.1;
      
      private var var_2818:Number;
      
      private var _airFriction:Number;
      
      private var var_3116:String;
      
      private var var_2867:Array;
      
      private var var_1804:Array;
      
      private var var_3213:int;
      
      private var _particlesPerFrame:int;
      
      private var var_2498:int;
      
      private var _fuseTime:int = 10;
      
      private var var_727:Number = 1;
      
      private var var_2396:Boolean = false;
      
      private var var_2959:int = 1;
      
      public function FurnitureParticleSystemEmitter(param1:String = "", param2:int = -1)
      {
         var_1804 = [];
         super();
         _name = param1;
         var_3790 = param2;
         var_2867 = [];
      }
      
      override public function dispose() : void
      {
         for each(var _loc1_ in var_1804)
         {
            _loc1_.dispose();
         }
         var_1804 = null;
         _direction = null;
         var_2867 = null;
         super.dispose();
      }
      
      public function setup(param1:int, param2:int, param3:Number, param4:Vector3D, param5:Number, param6:Number, param7:String, param8:Number, param9:int, param10:int) : void
      {
         var_3213 = param1;
         _particlesPerFrame = param2;
         var_3130 = param3;
         _direction = param4;
         _direction.normalize();
         var_2818 = param5;
         _airFriction = param6;
         var_3116 = param7;
         _fuseTime = param9;
         var_727 = param8;
         var_2959 = param10;
         reset();
      }
      
      public function reset() : void
      {
         for each(var _loc1_ in var_1804)
         {
            _loc1_.dispose();
         }
         var_1804 = [];
         var_2498 = 0;
         var_2396 = false;
         this.init(0,0,0,_direction,var_3130,var_2376,_fuseTime,true);
      }
      
      public function copyStateFrom(param1:FurnitureParticleSystemEmitter, param2:Number) : void
      {
         super.copy(param1,param2);
         var_3130 = param1.var_3130;
         _direction = param1._direction;
         var_2818 = param1.var_2818;
         _airFriction = param1._airFriction;
         var_3116 = param1.var_3116;
         _fuseTime = param1._fuseTime;
         var_727 = param1.var_727;
         var_2959 = param1.var_2959;
         var_2376 = param1.var_2376;
         var_2396 = param1.var_2396;
      }
      
      public function configureParticle(param1:int, param2:Boolean, param3:Array, param4:Boolean) : void
      {
         var _loc5_:Dictionary;
         (_loc5_ = new Dictionary())["lifeTime"] = param1;
         _loc5_["isEmitter"] = param2;
         _loc5_["frames"] = param3;
         _loc5_["fade"] = param4;
         var_2867.push(_loc5_);
      }
      
      override protected function ignite() : void
      {
         var_2396 = true;
         if(var_2498 < var_3213)
         {
            if(this.age > 1)
            {
               releaseParticles(this,this.direction);
            }
         }
      }
      
      private function releaseParticles(param1:FurnitureParticleSystemParticle, param2:Vector3D = null) : void
      {
         var _loc8_:FurnitureParticleSystemParticle = null;
         var _loc3_:Dictionary = null;
         var _loc10_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(!param2)
         {
            param2 = new Vector3D();
         }
         var _loc9_:Vector3D = new Vector3D();
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         _loc3_ = getRandomParticleConfiguration();
         _loc7_ = 0;
         while(_loc7_ < _particlesPerFrame)
         {
            switch(var_3116)
            {
               case "cone":
                  _loc9_.x = randomBoolean(0.5) ? Math.random() : -Math.random();
                  _loc9_.y = -(Math.random() + 1);
                  _loc9_.z = randomBoolean(0.5) ? Math.random() : -Math.random();
                  break;
               case "plane":
                  _loc9_.x = randomBoolean(0.5) ? Math.random() : -Math.random();
                  _loc9_.y = 0;
                  _loc9_.z = randomBoolean(0.5) ? Math.random() : -Math.random();
                  break;
               case "sphere":
                  _loc9_.x = randomBoolean(0.5) ? Math.random() : -Math.random();
                  _loc9_.y = randomBoolean(0.5) ? Math.random() : -Math.random();
                  _loc9_.z = randomBoolean(0.5) ? Math.random() : -Math.random();
            }
            _loc9_.normalize();
            _loc8_ = new FurnitureParticleSystemParticle();
            if(_loc3_)
            {
               _loc10_ = Math.floor(Math.random() * _loc3_["lifeTime"] + 10);
               _loc4_ = Boolean(_loc3_["isEmitter"]);
               _loc6_ = _loc3_["frames"];
               _loc5_ = Boolean(_loc3_["fade"]);
            }
            else
            {
               _loc10_ = Math.floor(Math.random() * 20 + 10);
               _loc4_ = false;
               _loc6_ = [];
            }
            _loc8_.init(param1.x,param1.y,param1.z,_loc9_,var_727,var_2376,_loc10_,_loc4_,_loc6_,_loc5_);
            var_1804.push(_loc8_);
            var_2498++;
            _loc7_++;
         }
      }
      
      private function getRandomParticleConfiguration() : Dictionary
      {
         var _loc1_:int = Math.floor(Math.random() * 0);
         return var_2867[_loc1_];
      }
      
      override public function update() : void
      {
         super.update();
         accumulateForces();
         verlet();
         satisfyConstraints();
         if(!isAlive && var_2498 < var_3213)
         {
            if(this.age % var_2959 == 0)
            {
               releaseParticles(this,this.direction);
            }
         }
      }
      
      public function verlet() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:* = null;
         if(isAlive || var_2498 < var_3213)
         {
            _loc2_ = this.x;
            _loc3_ = this.y;
            _loc4_ = this.z;
            this.x = (2 - _airFriction) * this.x - (1 - _airFriction) * this.lastX;
            this.y = (2 - _airFriction) * this.y - (1 - _airFriction) * this.lastY + var_2818 * var_2376 * var_2376;
            this.z = (2 - _airFriction) * this.z - (1 - _airFriction) * this.lastZ;
            this.lastX = _loc2_;
            this.lastY = _loc3_;
            this.lastZ = _loc4_;
         }
         var _loc1_:* = [];
         for each(_loc5_ in var_1804)
         {
            _loc5_.update();
            _loc2_ = _loc5_.x;
            _loc3_ = _loc5_.y;
            _loc4_ = _loc5_.z;
            _loc5_.x = (2 - _airFriction) * _loc5_.x - (1 - _airFriction) * _loc5_.lastX;
            _loc5_.y = (2 - _airFriction) * _loc5_.y - (1 - _airFriction) * _loc5_.lastY + var_2818 * var_2376 * var_2376;
            _loc5_.z = (2 - _airFriction) * _loc5_.z - (1 - _airFriction) * _loc5_.lastZ;
            _loc5_.lastX = _loc2_;
            _loc5_.lastY = _loc3_;
            _loc5_.lastZ = _loc4_;
            if(_loc5_.y > 10 || !_loc5_.isAlive)
            {
               _loc1_.push(_loc5_);
            }
         }
         for each(_loc5_ in _loc1_)
         {
            if(!_loc5_.isEmitter)
            {
            }
            var_1804.splice(var_1804.indexOf(_loc5_),1);
            _loc5_.dispose();
         }
      }
      
      private function satisfyConstraints() : void
      {
      }
      
      private function accumulateForces() : void
      {
         for each(var _loc1_ in var_1804)
         {
         }
      }
      
      public function get particles() : Array
      {
         return var_1804;
      }
      
      public function get hasIgnited() : Boolean
      {
         return var_2396;
      }
      
      private function randomBoolean(param1:Number) : Boolean
      {
         return Math.random() < param1;
      }
      
      public function get roomObjectSpriteId() : int
      {
         return var_3790;
      }
   }
}
