package com.sulake.habbo.inventory.items
{
   import com.sulake.habbo.room.IStuffData;
   import flash.utils.getTimer;
   import package_55.class_1594;
   
   public class FurnitureItem implements class_3172
   {
       
      
      private var var_1011:int;
      
      private var var_970:Boolean;
      
      private var var_519:int;
      
      private var var_142:Boolean;
      
      private var var_247:int;
      
      private var var_3426:int;
      
      private var var_774:int;
      
      private var var_271:int;
      
      private var var_921:IStuffData;
      
      private var var_609:Number;
      
      private var var_3415:Boolean;
      
      private var var_3392:Boolean;
      
      private var var_3382:Boolean;
      
      private var var_887:Boolean;
      
      private var _secondsToExpiration:int;
      
      private var var_1168:Boolean;
      
      private var var_793:int;
      
      private var _creationMonth:int;
      
      private var var_1178:int;
      
      private var var_789:String;
      
      private var var_326:Boolean;
      
      private var _flatId:int;
      
      public function FurnitureItem(param1:class_1594)
      {
         super();
         var_247 = param1.itemId;
         var_271 = param1.itemTypeId;
         var_3426 = param1.roomItemId;
         var_774 = param1.category;
         var_3382 = param1.isGroupable && !param1.isRented;
         var_3392 = param1.isTradeable;
         var_3415 = param1.isRecyclable;
         var_887 = param1.isSellable;
         var_921 = param1.stuffData;
         var_609 = param1.extra;
         _secondsToExpiration = param1.secondsToExpiration;
         var_1011 = param1.expirationTimeStamp;
         var_1168 = param1.hasRentPeriodStarted;
         var_793 = param1.creationDay;
         _creationMonth = param1.creationMonth;
         var_1178 = param1.creationYear;
         var_789 = param1.slotId;
         var_519 = param1.songId;
         _flatId = param1.flatId;
         var_326 = param1.isRented;
         var_970 = param1.isWallItem;
      }
      
      public function get isRented() : Boolean
      {
         return var_326;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get ref() : int
      {
         return var_3426;
      }
      
      public function get category() : int
      {
         return var_774;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get stuffData() : IStuffData
      {
         return var_921;
      }
      
      public function set stuffData(param1:IStuffData) : void
      {
         var_921 = param1;
      }
      
      public function get extra() : Number
      {
         return var_609;
      }
      
      public function get recyclable() : Boolean
      {
         return var_3415;
      }
      
      public function get tradeable() : Boolean
      {
         return var_3392;
      }
      
      public function get groupable() : Boolean
      {
         return var_3382;
      }
      
      public function get sellable() : Boolean
      {
         return var_887;
      }
      
      public function get secondsToExpiration() : int
      {
         if(_secondsToExpiration == -1)
         {
            return -1;
         }
         var _loc1_:int = -1;
         if(var_1168)
         {
            _loc1_ = _secondsToExpiration - (getTimer() - var_1011) / 1000;
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
         }
         else
         {
            _loc1_ = _secondsToExpiration;
         }
         return _loc1_;
      }
      
      public function get creationDay() : int
      {
         return var_793;
      }
      
      public function get creationMonth() : int
      {
         return _creationMonth;
      }
      
      public function get creationYear() : int
      {
         return var_1178;
      }
      
      public function get slotId() : String
      {
         return var_789;
      }
      
      public function get songId() : int
      {
         return var_519;
      }
      
      public function get locked() : Boolean
      {
         return var_142;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_142 = param1;
      }
      
      public function get flatId() : int
      {
         return _flatId;
      }
      
      public function get isWallItem() : Boolean
      {
         return var_970;
      }
      
      public function get hasRentPeriodStarted() : Boolean
      {
         return var_1168;
      }
      
      public function get expirationTimeStamp() : int
      {
         return var_1011;
      }
      
      public function update(param1:class_1594) : void
      {
         var_271 = param1.itemTypeId;
         var_3426 = param1.roomItemId;
         var_774 = param1.category;
         var_3382 = param1.isGroupable && !param1.isRented;
         var_3392 = param1.isTradeable;
         var_3415 = param1.isRecyclable;
         var_887 = param1.isSellable;
         var_921 = param1.stuffData;
         var_609 = param1.extra;
         _secondsToExpiration = param1.secondsToExpiration;
         var_1011 = param1.expirationTimeStamp;
         var_1168 = param1.hasRentPeriodStarted;
         var_793 = param1.creationDay;
         _creationMonth = param1.creationMonth;
         var_1178 = param1.creationYear;
         var_789 = param1.slotId;
         var_519 = param1.songId;
         _flatId = param1.flatId;
         var_326 = param1.isRented;
         var_970 = param1.isWallItem;
      }
   }
}
