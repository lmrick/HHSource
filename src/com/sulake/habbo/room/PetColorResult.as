package com.sulake.habbo.room
{
   public class PetColorResult
   {
      
      private static const COLOR_TAGS:Array = ["Null","Black","White","Grey","Red","Orange","Pink","Green","Lime","Blue","Light-Blue","Dark-Blue","Yellow","Brown","Dark-Brown","Beige","Cyan","Purple","Gold"];
       
      
      private var var_3745:int;
      
      private var var_1290:String;
      
      private var var_247:String;
      
      private var _primaryColor:int = 0;
      
      private var _secondaryColor:int = 0;
      
      private var var_3912:Boolean = false;
      
      private var var_3249:Array;
      
      public function PetColorResult(param1:int, param2:int, param3:int, param4:int, param5:String, param6:Boolean, param7:Array)
      {
         var_3249 = [];
         super();
         _primaryColor = param1 & 16777215;
         _secondaryColor = param2 & 16777215;
         var_3745 = param3;
         var_1290 = param4 > -1 && param4 < COLOR_TAGS.length ? COLOR_TAGS[param4] : "";
         var_247 = param5;
         var_3912 = param6;
         var_3249 = param7;
      }
      
      public function get primaryColor() : int
      {
         return _primaryColor;
      }
      
      public function get secondaryColor() : int
      {
         return _secondaryColor;
      }
      
      public function get breed() : int
      {
         return var_3745;
      }
      
      public function get tag() : String
      {
         return var_1290;
      }
      
      public function get id() : String
      {
         return var_247;
      }
      
      public function get isMaster() : Boolean
      {
         return var_3912;
      }
      
      public function get layerTags() : Array
      {
         return var_3249;
      }
   }
}
