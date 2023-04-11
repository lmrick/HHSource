package com.sulake.habbo.freeflowchat.history.visualization.entry
{
   import flash.display.Bitmap;
   
   public class BitmapSpriteWithUserId  extends Bitmap
   {
       
      
      private var var_339:int;
      
      private var var_354:int;
      
      private var var_4171:Boolean;
      
      private var _userName:String;
      
      public function BitmapSpriteWithUserId ()
      {
         super();
      }
      
      public function get canIgnore() : Boolean
      {
         return var_4171;
      }
      
      public function set canIgnore(param1:Boolean) : void
      {
         var_4171 = param1;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function set userName(param1:String) : void
      {
         _userName = param1;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function set userId(param1:int) : void
      {
         var_339 = param1;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function set roomId(param1:int) : void
      {
         var_354 = param1;
      }
   }
}
