package com.sulake.habbo.notifications.feed.data
{
   import flash.display.BitmapData;
   
   public class GenericNotificationItemData
   {
       
      
      private var var_462:String;
      
      private var var_912:int;
      
      private var _description:String;
      
      private var var_4199:BitmapData;
      
      private var var_2001:BitmapData;
      
      private var _buttonAction:String;
      
      private var _buttonCaption:String;
      
      public function GenericNotificationItemData()
      {
         super();
      }
      
      public function get title() : String
      {
         return var_462;
      }
      
      public function get timeStamp() : int
      {
         return var_912;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function get decorationImage() : BitmapData
      {
         return var_4199;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_2001;
      }
      
      public function get buttonAction() : String
      {
         return _buttonAction;
      }
      
      public function get buttonCaption() : String
      {
         return _buttonCaption;
      }
      
      public function set title(param1:String) : void
      {
         var_462 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_912 = param1;
      }
      
      public function set description(param1:String) : void
      {
         _description = param1;
      }
      
      public function set decorationImage(param1:BitmapData) : void
      {
         var_4199 = param1;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_2001 = param1;
      }
      
      public function set buttonAction(param1:String) : void
      {
         _buttonAction = param1;
      }
      
      public function set buttonCaption(param1:String) : void
      {
         _buttonCaption = param1;
      }
   }
}
