package com.sulake.habbo.avatar.structure.figure
{
   import com.sulake.core.utils.class_24;
   
   public interface ISetType
   {
       
      
      function getPartSet(param1:int) : class_3195;
      
      function isMandatory(param1:String, param2:int) : Boolean;
      
      function optionalFromClubLevel(param1:String) : int;
      
      function get type() : String;
      
      function get paletteID() : int;
      
      function get partSets() : class_24;
   }
}
