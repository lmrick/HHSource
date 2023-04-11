package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import flash.geom.Vector3D;
   
   public class FurnitureParticleSystemParticle
   {
       
      
      private var var_29:Number;
      
      private var var_28:Number;
      
      private var var_30:Number;
      
      private var var_2493:Number;
      
      private var var_2534:Number;
      
      private var var_2543:Number;
      
      private var var_2097:Boolean = false;
      
      private var _direction:Vector3D;
      
      private var var_1260:int = 0;
      
      private var _lifeTime:int;
      
      private var var_2918:Boolean = false;
      
      private var var_2652:Boolean = false;
      
      private var _fadeTime:Number;
      
      private var var_2486:Number = 1;
      
      private var var_1655:Array;
      
      public function FurnitureParticleSystemParticle()
      {
         super();
      }
      
      public function get fade() : Boolean
      {
         return var_2652;
      }
      
      public function get alphaMultiplier() : Number
      {
         return var_2486;
      }
      
      public function get direction() : Vector3D
      {
         return _direction;
      }
      
      public function get age() : int
      {
         return var_1260;
      }
      
      public function init(param1:Number, param2:Number, param3:Number, param4:Vector3D, param5:Number, param6:Number, param7:int, param8:Boolean = false, param9:Array = null, param10:Boolean = false) : void
      {
         var_29 = param1;
         var_28 = param2;
         var_30 = param3;
         _direction = new Vector3D(param4.x,param4.y,param4.z);
         _direction.scaleBy(param5);
         var_2493 = var_29 - 0 * param6;
         var_2534 = var_28 - 0 * param6;
         var_2543 = var_30 - 0 * param6;
         var_1260 = 0;
         var_2097 = false;
         _lifeTime = param7;
         var_2918 = param8;
         var_1655 = param9;
         var_2652 = param10;
         var_2486 = 1;
         _fadeTime = 0.5 + Math.random() * 0.5;
      }
      
      public function update() : void
      {
         var_1260++;
         if(var_1260 == _lifeTime)
         {
            ignite();
         }
         if(var_2652)
         {
            if(var_1260 / _lifeTime > _fadeTime)
            {
               var_2486 = (_lifeTime - var_1260) / (_lifeTime * (1 - _fadeTime));
            }
         }
      }
      
      public function getAsset() : IGraphicAsset
      {
         if(var_1655 && false)
         {
            return var_1655[var_1260 % 0];
         }
         return null;
      }
      
      protected function ignite() : void
      {
      }
      
      public function get isEmitter() : Boolean
      {
         return var_2918;
      }
      
      public function get isAlive() : Boolean
      {
         return var_1260 <= _lifeTime;
      }
      
      public function dispose() : void
      {
         _direction = null;
      }
      
      public function get x() : Number
      {
         return var_29;
      }
      
      public function get y() : Number
      {
         return var_28;
      }
      
      public function get z() : Number
      {
         return var_30;
      }
      
      public function set x(param1:Number) : void
      {
         var_29 = param1;
      }
      
      public function set y(param1:Number) : void
      {
         var_28 = param1;
      }
      
      public function set z(param1:Number) : void
      {
         var_30 = param1;
      }
      
      public function get lastX() : Number
      {
         return var_2493;
      }
      
      public function set lastX(param1:Number) : void
      {
         var_2097 = true;
         var_2493 = param1;
      }
      
      public function get lastY() : Number
      {
         return var_2534;
      }
      
      public function set lastY(param1:Number) : void
      {
         var_2097 = true;
         var_2534 = param1;
      }
      
      public function get lastZ() : Number
      {
         return var_2543;
      }
      
      public function set lastZ(param1:Number) : void
      {
         var_2097 = true;
         var_2543 = param1;
      }
      
      public function get hasMoved() : Boolean
      {
         return var_2097;
      }
      
      public function toString() : String
      {
         return [var_29,var_28,var_30].toString();
      }
      
      public function copy(param1:FurnitureParticleSystemParticle, param2:Number) : void
      {
         var_29 = param1.var_29 * param2;
         var_28 = param1.var_28 * param2;
         var_30 = param1.var_30 * param2;
         var_2493 = param1.var_2493 * param2;
         var_2534 = param1.var_2534 * param2;
         var_2543 = param1.var_2543 * param2;
         var_2097 = param1.hasMoved;
         _direction = param1._direction;
         var_1260 = param1.var_1260;
         _lifeTime = param1._lifeTime;
         var_2918 = param1.var_2918;
         var_2652 = param1.var_2652;
         _fadeTime = param1._fadeTime;
         var_2486 = param1.var_2486;
      }
   }
}
