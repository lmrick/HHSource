package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements class_3148
   {
      
      public static const const_615:String = "i";
      
      public static const const_923:String = "s";
       
      
      private var var_271:String;
      
      private var var_247:int;
      
      private var _className:String;
      
      private var _hasIndexedColor:Boolean;
      
      private var var_3958:int;
      
      private var _revision:int;
      
      private var var_3949:int;
      
      private var var_4170:int;
      
      private var var_4079:int;
      
      private var _colours:Array;
      
      private var _localizedName:String;
      
      private var _description:String;
      
      private var var_4172:String;
      
      private var var_3882:int;
      
      private var var_4040:int;
      
      private var _customParams:String;
      
      private var var_774:int;
      
      private var _purchaseCouldBeUsedForBuyout:Boolean;
      
      private var _rentCouldBeUsedForBuyout:Boolean;
      
      private var var_3930:Boolean;
      
      private var _fullName:String;
      
      private var var_867:Boolean;
      
      private var var_4001:Boolean;
      
      private var var_4107:Boolean;
      
      private var var_4242:Boolean;
      
      private var var_4222:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:String, param5:String, param6:String, param7:int, param8:int, param9:int, param10:int, param11:Array, param12:Boolean, param13:int, param14:String, param15:int, param16:Boolean, param17:int, param18:Boolean, param19:Boolean, param20:String, param21:int, param22:Boolean, param23:Boolean, param24:Boolean, param25:Boolean, param26:String)
      {
         super();
         var_271 = param1;
         var_247 = param2;
         _fullName = param3;
         _className = param4;
         _revision = param7;
         var_3949 = param8;
         var_4170 = param9;
         var_4079 = param10;
         _colours = param11;
         _hasIndexedColor = param12;
         var_3958 = param13;
         _localizedName = param5;
         _description = param6;
         var_4172 = param14;
         var_3882 = param15;
         _purchaseCouldBeUsedForBuyout = param16;
         var_4040 = param17;
         _rentCouldBeUsedForBuyout = param18;
         _customParams = param20;
         var_774 = param21;
         var_3930 = param19;
         var_867 = param22;
         var_4001 = param23;
         var_4107 = param24;
         var_4242 = param25;
         var_4222 = param26;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get className() : String
      {
         return _className;
      }
      
      public function get fullName() : String
      {
         return _fullName;
      }
      
      public function get hasIndexedColor() : Boolean
      {
         return _hasIndexedColor;
      }
      
      public function get colourIndex() : int
      {
         return var_3958;
      }
      
      public function get revision() : int
      {
         return _revision;
      }
      
      public function get tileSizeX() : int
      {
         return var_3949;
      }
      
      public function get tileSizeY() : int
      {
         return var_4170;
      }
      
      public function get tileSizeZ() : int
      {
         return var_4079;
      }
      
      public function get colours() : Array
      {
         return _colours;
      }
      
      public function get localizedName() : String
      {
         return _localizedName;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function get adUrl() : String
      {
         return var_4172;
      }
      
      public function get purchaseOfferId() : int
      {
         return var_3882;
      }
      
      public function get customParams() : String
      {
         return _customParams;
      }
      
      public function get category() : int
      {
         return var_774;
      }
      
      public function set className(param1:String) : void
      {
         _className = param1;
      }
      
      public function get rentOfferId() : int
      {
         return var_4040;
      }
      
      public function get purchaseCouldBeUsedForBuyout() : Boolean
      {
         return _purchaseCouldBeUsedForBuyout;
      }
      
      public function get rentCouldBeUsedForBuyout() : Boolean
      {
         return _rentCouldBeUsedForBuyout;
      }
      
      public function get availableForBuildersClub() : Boolean
      {
         return var_3930;
      }
      
      public function get canStandOn() : Boolean
      {
         return var_867;
      }
      
      public function get canSitOn() : Boolean
      {
         return var_4001;
      }
      
      public function get canLayOn() : Boolean
      {
         return var_4107;
      }
      
      public function get isExternalImageType() : Boolean
      {
         return _className.indexOf("external_image") != -1;
      }
      
      public function get excludedFromDynamic() : Boolean
      {
         return var_4242;
      }
      
      public function get furniLine() : String
      {
         return var_4222;
      }
   }
}
