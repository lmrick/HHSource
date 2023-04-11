package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var var_629:String;
      
      private var var_599:String;
      
      private var var_657:String;
      
      private var _name:String;
      
      private var var_90:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array;
         var_629 = (_loc4_ = param1.split("_"))[0];
         var _loc5_:Array;
         var_599 = (_loc5_ = String(_loc4_[1]).split("."))[0];
         var_657 = _loc5_[1];
         _name = param2;
         var_90 = param3;
      }
      
      public function get id() : String
      {
         return var_629 + "_" + var_599 + "." + var_657;
      }
      
      public function get languageCode() : String
      {
         return var_629;
      }
      
      public function get countryCode() : String
      {
         return var_599;
      }
      
      public function get encoding() : String
      {
         return var_657;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_90;
      }
   }
}
