package com.sulake.habbo.catalog.purchase
{
   import package_128.class_1109;
   import package_8.class_289;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_787:Boolean = false;
      
      private var var_958:int;
      
      private var var_624:Array;
      
      private var var_630:Array;
      
      private var var_653:Array;
      
      private var var_647:Array;
      
      public function GiftWrappingConfiguration(param1:class_289)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:class_1109 = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_787 = _loc2_.isWrappingEnabled;
         var_958 = _loc2_.wrappingPrice;
         var_624 = _loc2_.stuffTypes;
         var_630 = _loc2_.boxTypes;
         var_653 = _loc2_.ribbonTypes;
         var_647 = _loc2_.defaultStuffTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_787;
      }
      
      public function get price() : int
      {
         return var_958;
      }
      
      public function get stuffTypes() : Array
      {
         return var_624;
      }
      
      public function get boxTypes() : Array
      {
         return var_630;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_653;
      }
      
      public function get defaultStuffTypes() : Array
      {
         return var_647;
      }
   }
}
