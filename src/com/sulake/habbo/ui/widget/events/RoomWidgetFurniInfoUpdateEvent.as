package com.sulake.habbo.ui.widget.events
{
   import com.sulake.habbo.room.IStuffData;
   import flash.display.BitmapData;
   
   public class RoomWidgetFurniInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const FURNI:String = "RWFIUE_FURNI";
       
      
      private var var_247:int = 0;
      
      private var var_774:int = 0;
      
      private var _name:String = "";
      
      private var _description:String = "";
      
      private var var_973:BitmapData = null;
      
      private var var_970:Boolean = false;
      
      private var var_4110:Boolean = false;
      
      private var var_2922:Boolean = false;
      
      private var var_1362:int = 0;
      
      private var var_3824:Boolean = false;
      
      private var _expiration:int = -1;
      
      private var var_4336:int = -1;
      
      private var var_3882:int = -1;
      
      private var var_388:String = "";
      
      private var var_360:Boolean = false;
      
      private var var_921:IStuffData = null;
      
      private var _groupId:int = 0;
      
      private var var_684:int = 0;
      
      private var _ownerName:String = "";
      
      private var var_747:int = 0;
      
      private var var_4333:int = -1;
      
      private var var_4040:int = -1;
      
      private var _purchaseCouldBeUsedForBuyout:Boolean;
      
      private var _rentCouldBeUsedForBuyout:Boolean;
      
      private var var_3930:Boolean;
      
      public function RoomWidgetFurniInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set id(param1:int) : void
      {
         var_247 = param1;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function set category(param1:int) : void
      {
         var_774 = param1;
      }
      
      public function get category() : int
      {
         return var_774;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set description(param1:String) : void
      {
         _description = param1;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function set image(param1:BitmapData) : void
      {
         var_973 = param1;
      }
      
      public function get image() : BitmapData
      {
         return var_973;
      }
      
      public function set isWallItem(param1:Boolean) : void
      {
         var_970 = param1;
      }
      
      public function get isWallItem() : Boolean
      {
         return var_970;
      }
      
      public function set isStickie(param1:Boolean) : void
      {
         var_4110 = param1;
      }
      
      public function get isStickie() : Boolean
      {
         return var_4110;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_2922 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_2922;
      }
      
      public function set roomControllerLevel(param1:int) : void
      {
         var_1362 = param1;
      }
      
      public function get roomControllerLevel() : int
      {
         return var_1362;
      }
      
      public function set isAnyRoomController(param1:Boolean) : void
      {
         var_3824 = param1;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return var_3824;
      }
      
      public function set expiration(param1:int) : void
      {
         _expiration = param1;
      }
      
      public function get expiration() : int
      {
         return _expiration;
      }
      
      public function set purchaseOfferId(param1:int) : void
      {
         var_3882 = param1;
      }
      
      public function get purchaseOfferId() : int
      {
         return var_3882;
      }
      
      public function set extraParam(param1:String) : void
      {
         var_388 = param1;
      }
      
      public function get extraParam() : String
      {
         return var_388;
      }
      
      public function set isOwner(param1:Boolean) : void
      {
         var_360 = param1;
      }
      
      public function get isOwner() : Boolean
      {
         return var_360;
      }
      
      public function set stuffData(param1:IStuffData) : void
      {
         var_921 = param1;
      }
      
      public function get stuffData() : IStuffData
      {
         return var_921;
      }
      
      public function set groupId(param1:int) : void
      {
         _groupId = param1;
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_684 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set usagePolicy(param1:int) : void
      {
         var_747 = param1;
      }
      
      public function get usagePolicy() : int
      {
         return var_747;
      }
      
      public function set rentOfferId(param1:int) : void
      {
         var_4040 = param1;
      }
      
      public function get rentOfferId() : int
      {
         return var_4040;
      }
      
      public function get purchaseCouldBeUsedForBuyout() : Boolean
      {
         return _purchaseCouldBeUsedForBuyout;
      }
      
      public function set purchaseCouldBeUsedForBuyout(param1:Boolean) : void
      {
         _purchaseCouldBeUsedForBuyout = param1;
      }
      
      public function get rentCouldBeUsedForBuyout() : Boolean
      {
         return _rentCouldBeUsedForBuyout;
      }
      
      public function set rentCouldBeUsedForBuyout(param1:Boolean) : void
      {
         _rentCouldBeUsedForBuyout = param1;
      }
      
      public function get availableForBuildersClub() : Boolean
      {
         return var_3930;
      }
      
      public function set availableForBuildersClub(param1:Boolean) : void
      {
         var_3930 = param1;
      }
   }
}
