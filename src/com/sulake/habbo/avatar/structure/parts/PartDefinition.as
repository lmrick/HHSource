package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_3893:String;
      
      private var var_3228:String;
      
      private var var_3916:String;
      
      private var var_3270:Boolean;
      
      private var var_3680:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_3893 = String(param1["set-type"]);
         var_3228 = String(param1["flipped-set-type"]);
         var_3916 = String(param1["remove-set-type"]);
         var_3270 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_3680 >= 0;
      }
      
      public function get staticId() : int
      {
         return var_3680;
      }
      
      public function set staticId(param1:int) : void
      {
         var_3680 = param1;
      }
      
      public function get setType() : String
      {
         return var_3893;
      }
      
      public function get flippedSetType() : String
      {
         return var_3228;
      }
      
      public function get removeSetType() : String
      {
         return var_3916;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_3270;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_3270 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_3228 = param1;
      }
   }
}
