package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;
   
   public class InfoStandRentableBotData
   {
       
      
      private var var_339:int = 0;
      
      private var _name:String = "";
      
      private var var_110:Array;
      
      private var var_4010:int = 0;
      
      private var var_3764:int = 0;
      
      private var var_3344:Boolean;
      
      private var var_3207:Boolean;
      
      private var _botSkills:Array;
      
      public function InfoStandRentableBotData()
      {
         var_110 = [];
         super();
      }
      
      public function set userId(param1:int) : void
      {
         var_339 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_110 = param1;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_4010 = param1;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_3764 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_3344 = param1;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_3207 = param1;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get badges() : Array
      {
         return var_110.slice();
      }
      
      public function get carryItem() : int
      {
         return var_4010;
      }
      
      public function get userRoomId() : int
      {
         return var_3764;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_3344;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_3207;
      }
      
      public function get botSkills() : Array
      {
         return _botSkills;
      }
      
      public function set botSkills(param1:Array) : void
      {
         _botSkills = param1;
      }
      
      public function setData(param1:RoomWidgetRentableBotInfoUpdateEvent) : void
      {
         userId = param1.webID;
         name = param1.name;
         badges = param1.badges;
         carryItem = param1.carryItem;
         userRoomId = param1.userRoomId;
         amIOwner = param1.amIOwner;
         amIAnyRoomController = param1.amIAnyRoomController;
         botSkills = param1.botSkills;
      }
   }
}
