package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1052:String;
      
      private var var_902:Class;
      
      private var var_691:Class;
      
      private var var_502:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class = null, ... rest)
      {
         super();
         var_1052 = param1;
         var_902 = param2;
         var_691 = param3;
         if(rest == null)
         {
            var_502 = [];
         }
         else
         {
            var_502 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return var_1052;
      }
      
      public function get assetClass() : Class
      {
         return var_902;
      }
      
      public function get loaderClass() : Class
      {
         return var_691;
      }
      
      public function get fileTypes() : Array
      {
         return var_502;
      }
   }
}
