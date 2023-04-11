package com.sulake.habbo.advertisement.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class AdEvent extends Event
   {
      
      public static const ROOM_AD_IMAGE_LOADED:String = "AE_ROOM_AD_IMAGE_LOADED";
      
      public static const ROOM_AD_IMAGE_LOADING_FAILED:String = "AE_ROOM_AD_IMAGE_LOADING_FAILED";
      
      public static const ROOM_AD_SHOW:String = "AE_ROOM_AD_SHOW";
       
      
      private var var_973:BitmapData;
      
      private var var_354:int;
      
      private var var_350:String;
      
      private var var_3178:String;
      
      private var var_3938:BitmapData;
      
      private var var_3741:BitmapData;
      
      private var var_347:int;
      
      private var var_907:int;
      
      public function AdEvent(param1:String, param2:int, param3:BitmapData = null, param4:String = "", param5:String = "", param6:BitmapData = null, param7:BitmapData = null, param8:int = -1, param9:int = -1, param10:Boolean = false, param11:Boolean = false)
      {
         super(param1,param10,param11);
         var_973 = param3;
         var_354 = param2;
         var_350 = param4;
         var_3178 = param5;
         var_3938 = param6;
         var_3741 = param7;
         var_347 = param8;
         var_907 = param9;
      }
      
      public function get image() : BitmapData
      {
         return var_973;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get imageUrl() : String
      {
         return var_350;
      }
      
      public function get clickUrl() : String
      {
         return var_3178;
      }
      
      public function get adWarningL() : BitmapData
      {
         return var_3938;
      }
      
      public function get adWarningR() : BitmapData
      {
         return var_3741;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get objectCategory() : int
      {
         return var_907;
      }
   }
}
