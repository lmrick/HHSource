package com.sulake.habbo.avatar.structure
{
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.figure.class_3195;
   import com.sulake.habbo.avatar.structure.figure.class_3220;
   
   public interface IFigureSetData
   {
      function getSetType(param1:String) : ISetType;
      
      function getPalette(param1:int) : class_3220;
      
      function getFigurePartSet(param1:int) : class_3195;
   }
}
