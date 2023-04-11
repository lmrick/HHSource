package com.sulake.habbo.avatar.geometry
{
   public class Node3D
   {
       
      
      private var _location:com.sulake.habbo.avatar.geometry.Vector3D;
      
      private var _transformedLocation:com.sulake.habbo.avatar.geometry.Vector3D;
      
      private var _needsTransformation:Boolean = false;
      
      public function Node3D(param1:Number, param2:Number, param3:Number)
      {
         _transformedLocation = new com.sulake.habbo.avatar.geometry.Vector3D();
         super();
         _location = new com.sulake.habbo.avatar.geometry.Vector3D(param1,param2,param3);
         if(param1 != 0 || param2 != 0 || param3 != 0)
         {
            _needsTransformation = true;
         }
      }
      
      public function get location() : com.sulake.habbo.avatar.geometry.Vector3D
      {
         return _location;
      }
      
      public function get transformedLocation() : com.sulake.habbo.avatar.geometry.Vector3D
      {
         return _transformedLocation;
      }
      
      public function applyTransform(param1:Matrix4x4) : void
      {
         if(_needsTransformation)
         {
            _transformedLocation = param1.vectorMultiplication(_location);
         }
      }
   }
}
