package com.sulake.habbo.avatar.geometry
{
   public class GeometryItem extends Node3D
   {
       
      
      private var var_247:String;
      
      private var _radius:Number;
      
      private var _normal:com.sulake.habbo.avatar.geometry.Vector3D;
      
      private var _isDoubleSided:Boolean = false;
      
      private var var_3981:Boolean = false;
      
      public function GeometryItem(param1:XML, param2:Boolean = false)
      {
         super(parseFloat(param1.@x),parseFloat(param1.@y),parseFloat(param1.@z));
         var_247 = String(param1.@id);
         _radius = parseFloat(param1.@radius);
         _normal = new com.sulake.habbo.avatar.geometry.Vector3D(parseFloat(param1.@nx),parseFloat(param1.@ny),parseFloat(param1.@nz));
         _isDoubleSided = parseInt(param1.@double) as Boolean;
         var_3981 = param2;
      }
      
      public function getDistance(param1:com.sulake.habbo.avatar.geometry.Vector3D) : Number
      {
         var _loc3_:Number = Math.abs(param1.z - this.transformedLocation.z - _radius);
         var _loc2_:Number = Math.abs(param1.z - this.transformedLocation.z + _radius);
         return Math.min(_loc3_,_loc2_);
      }
      
      public function get id() : String
      {
         return var_247;
      }
      
      public function get normal() : com.sulake.habbo.avatar.geometry.Vector3D
      {
         return _normal;
      }
      
      public function get isDoubleSided() : Boolean
      {
         return _isDoubleSided;
      }
      
      public function toString() : String
      {
         return var_247 + ": " + this.location + " - " + this.transformedLocation;
      }
      
      public function get isDynamic() : Boolean
      {
         return var_3981;
      }
   }
}
