package com.sulake.core.window
{
   import com.sulake.core.window.utils.IIterable;
   import flash.geom.Point;
   
   public interface IWindowContainer extends class_3127, IIterable
   {
       
      
      function get numChildren() : int;
      
      function addChild(param1:class_3127) : class_3127;
      
      function addChildAt(param1:class_3127, param2:int) : class_3127;
      
      function getChildAt(param1:int) : class_3127;
      
      function getChildByID(param1:int) : class_3127;
      
      function getChildByTag(param1:String) : class_3127;
      
      function getChildByName(param1:String) : class_3127;
      
      function getChildIndex(param1:class_3127) : int;
      
      function findChildByTag(param1:String) : class_3127;
      
      function findChildByName(param1:String) : class_3127;
      
      function removeChild(param1:class_3127) : class_3127;
      
      function removeChildAt(param1:int) : class_3127;
      
      function setChildIndex(param1:class_3127, param2:int) : void;
      
      function swapChildren(param1:class_3127, param2:class_3127) : void;
      
      function swapChildrenAt(param1:int, param2:int) : void;
      
      function groupChildrenWithID(param1:uint, param2:Array, param3:int = 0) : uint;
      
      function groupChildrenWithTag(param1:String, param2:Array, param3:int = 0) : uint;
      
      function getChildUnderPoint(param1:Point) : class_3127;
      
      function groupChildrenUnderPoint(param1:Point, param2:Array) : void;
   }
}
