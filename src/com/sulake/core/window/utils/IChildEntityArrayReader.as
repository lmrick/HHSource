package com.sulake.core.window.utils
{
   public interface IChildEntityArrayReader
   {
       
      
      function get numChildren() : int;
      
      function getChildAt(param1:int) : class_3257;
      
      function getChildByID(param1:int) : class_3257;
      
      function getChildByName(param1:String) : class_3257;
      
      function getChildIndex(param1:class_3257) : int;
      
      function groupChildrenWithID(param1:uint, param2:Array) : uint;
   }
}
