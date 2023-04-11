package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;
   import package_171.class_1626;
   
   public class RentableBotInfoData
   {
       
      
      private var var_247:int = -1;
      
      private var var_783:int;
      
      private var var_3359:Boolean = false;
      
      private var var_3344:Boolean = false;
      
      private var var_3207:Boolean = false;
      
      private var var_3177:int = 0;
      
      private var _botSkills:Array;
      
      private var var_2406:Array;
      
      private var _name:String;
      
      public function RentableBotInfoData()
      {
         var_2406 = new Array(0);
         super();
      }
      
      public function set id(param1:int) : void
      {
         var_247 = param1;
      }
      
      public function set roomIndex(param1:int) : void
      {
         var_783 = param1;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get roomIndex() : int
      {
         return var_783;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_3359;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_3344;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_3207;
      }
      
      public function get carryItemType() : int
      {
         return var_3177;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_3359 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_3344 = param1;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_3207 = param1;
      }
      
      public function set carryItemType(param1:int) : void
      {
         var_3177 = param1;
      }
      
      public function get botSkills() : Array
      {
         return _botSkills;
      }
      
      public function set botSkills(param1:Array) : void
      {
         _botSkills = param1;
      }
      
      public function get botSkillsWithCommands() : Array
      {
         return var_2406;
      }
      
      public function set botSkillsWithCommands(param1:Array) : void
      {
         var_2406 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function populate(param1:RoomWidgetRentableBotInfoUpdateEvent) : void
      {
         if(param1.webID != id)
         {
            var_2406 = new Array(0);
         }
         id = param1.webID;
         roomIndex = param1.userRoomId;
         amIOwner = param1.amIOwner;
         amIAnyRoomController = param1.amIAnyRoomController;
         carryItemType = param1.carryItem;
         botSkills = param1.botSkills;
         _name = param1.name;
      }
      
      public function cloneAndSetSkillsWithCommands(param1:Array) : void
      {
         _botSkills = [];
         for each(var _loc2_ in param1)
         {
            botSkills.push(_loc2_.id);
         }
         var_2406 = param1.concat();
      }
   }
}
