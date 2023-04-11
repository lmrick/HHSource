package com.sulake.habbo.session.product
{
   public class ProductData implements IProductData
   {
       
      
      private var var_271:String;
      
      private var _name:String;
      
      private var _description:String = "";
      
      public function ProductData(param1:String, param2:String)
      {
         super();
         var_271 = param1;
         _name = param2;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get description() : String
      {
         return _description;
      }
   }
}
