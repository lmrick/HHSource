package com.sulake.core.localization
{
   public class GameDataResources implements class_40
   {
       
      
      private var var_857:String;
      
      private var _externalTextsHash:String;
      
      private var var_1251:String;
      
      private var _externalVariablesHash:String;
      
      private var var_1006:String;
      
      private var _furniDataHash:String;
      
      private var var_1037:String;
      
      private var _productDataHash:String;
      
      public function GameDataResources()
      {
         super();
      }
      
      public static function parse(param1:String) : class_51
      {
         var _loc2_:Object = JSON.parse(param1);
         var _loc4_:class_51 = new class_51();
         for each(var _loc3_ in _loc2_.hashes)
         {
            if(_loc3_.name == "external_texts")
            {
               _loc4_.var_857 = _loc3_.url;
               _loc4_._externalTextsHash = _loc3_.hash;
            }
            else if(_loc3_.name == "external_variables")
            {
               _loc4_.var_1251 = _loc3_.url;
               _loc4_._externalVariablesHash = _loc3_.hash;
            }
            else if(_loc3_.name == "furnidata")
            {
               _loc4_.var_1006 = _loc3_.url;
               _loc4_._furniDataHash = _loc3_.hash;
            }
            else if(_loc3_.name == "productdata")
            {
               _loc4_.var_1037 = _loc3_.url;
               _loc4_._productDataHash = _loc3_.hash;
            }
         }
         return _loc4_;
      }
      
      public function isValid() : Boolean
      {
         return var_857 && _externalTextsHash && var_1251 && _externalVariablesHash && var_1006 && _furniDataHash && var_1037 && _productDataHash;
      }
      
      public function getExternalTextsUrl() : String
      {
         return var_857;
      }
      
      public function getExternalTextsHash() : String
      {
         return _externalTextsHash;
      }
      
      public function getExternalVariablesUrl() : String
      {
         return var_1251;
      }
      
      public function getExternalVariablesHash() : String
      {
         return _externalVariablesHash;
      }
      
      public function getFurniDataUrl() : String
      {
         return var_1006;
      }
      
      public function getFurniDataHash() : String
      {
         return _furniDataHash;
      }
      
      public function getProductDataUrl() : String
      {
         return var_1037;
      }
      
      public function getProductDataHash() : String
      {
         return _productDataHash;
      }
   }
}
