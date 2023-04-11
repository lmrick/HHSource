package com.sulake.habbo.avatar.structure.figure
{
   public interface IFigurePartSet
   {
      function getPart(param1:String, param2:int) : class_3370;
      
      function get type() : String;
      
      function get id() : int;
      
      function get gender() : String;
      
      function get clubLevel() : int;
      
      function get isColorable() : Boolean;
      
      function get isSelectable() : Boolean;
      
      function get isPreSelectable() : Boolean;
      
      function get isSellable() : Boolean;
      
      function get parts() : Array;
      
      function get hiddenLayers() : Array;
   }
}
