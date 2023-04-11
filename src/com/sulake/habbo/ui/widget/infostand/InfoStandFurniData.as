package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandFurniData
   {
       
      
      private var var_247:int = 0;
      
      private var var_774:int = 0;
      
      private var _name:String = "";
      
      private var _description:String = "";
      
      private var var_973:BitmapData;
      
      private var var_3882:int = -1;
      
      private var var_388:String = "";
      
      private var var_921:IStuffData = null;
      
      private var _groupId:int;
      
      private var var_684:int = 0;
      
      private var _ownerName:String = "";
      
      private var var_4040:int = -1;
      
      private var var_3930:Boolean = false;
      
      public function InfoStandFurniData()
      {
         super();
      }
      
      public function set id(param1:int) : void
      {
         var_247 = param1;
      }
      
      public function set category(param1:int) : void
      {
         var_774 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set description(param1:String) : void
      {
         _description = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         var_973 = param1;
      }
      
      public function set purchaseOfferId(param1:int) : void
      {
         var_3882 = param1;
      }
      
      public function set extraParam(param1:String) : void
      {
         var_388 = param1;
      }
      
      public function set stuffData(param1:IStuffData) : void
      {
         var_921 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         _groupId = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_684 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get category() : int
      {
         return var_774;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function get image() : BitmapData
      {
         return var_973;
      }
      
      public function get purchaseOfferId() : int
      {
         return var_3882;
      }
      
      public function get extraParam() : String
      {
         return var_388;
      }
      
      public function get stuffData() : IStuffData
      {
         return var_921;
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get rentOfferId() : int
      {
         return var_4040;
      }
      
      public function set rentOfferId(param1:int) : void
      {
         var_4040 = param1;
      }
      
      public function get availableForBuildersClub() : Boolean
      {
         return var_3930;
      }
      
      public function setData(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         id = param1.id;
         category = param1.category;
         name = param1.name;
         description = param1.description;
         image = param1.image;
         purchaseOfferId = param1.purchaseOfferId;
         extraParam = param1.extraParam;
         stuffData = param1.stuffData;
         groupId = param1.groupId;
         ownerName = param1.ownerName;
         ownerId = param1.ownerId;
         rentOfferId = param1.rentOfferId;
         var_3930 = param1.availableForBuildersClub;
      }
   }
}
