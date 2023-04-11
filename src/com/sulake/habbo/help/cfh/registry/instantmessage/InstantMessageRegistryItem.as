package com.sulake.habbo.help.cfh.registry.instantmessage
{
   public class InstantMessageRegistryItem
   {
       
      
      private var _index:int;
      
      private var var_339:int;
      
      private var _username:String = "";
      
      private var var_3792:String = "";
      
      private var _chatTime:Date;
      
      private var _selected:Boolean;
      
      public function InstantMessageRegistryItem(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _index = param1;
         var_339 = param2;
         _username = param3;
         var_3792 = param4;
         _selected = false;
         _chatTime = new Date();
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _username;
      }
      
      public function get text() : String
      {
         return var_3792;
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         _selected = param1;
      }
      
      public function get chatTime() : Date
      {
         return _chatTime;
      }
   }
}
