package package_16
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.habbo.room.IStuffData;
   import flash.utils.getTimer;
   import package_154.class_1538;
   import package_55.class_1594;
   
   [SecureSWF(rename="true")]
   public class class_1595 implements class_1594
   {
       
      
      private var var_1011:int;
      
      private var var_970:Boolean;
      
      private var var_399:int;
      
      private var var_261:String;
      
      private var var_1118:int;
      
      private var var_826:int;
      
      private var var_774:int;
      
      private var var_921:IStuffData;
      
      private var var_609:int;
      
      private var _secondsToExpiration:int;
      
      private var var_793:int;
      
      private var _creationMonth:int;
      
      private var var_1178:int;
      
      private var var_797:Boolean;
      
      private var var_519:int;
      
      private var _flatId:int;
      
      private var var_326:Boolean;
      
      private var var_1168:Boolean;
      
      public function class_1595(param1:IMessageDataWrapper)
      {
         super();
         var_399 = param1.readInteger();
         var_261 = param1.readString().toUpperCase();
         var_1118 = param1.readInteger();
         var_826 = param1.readInteger();
         var_774 = param1.readInteger();
         var_797 = param1.readBoolean();
         var_921 = class_1538.parseStuffData(param1);
         _secondsToExpiration = -1;
         var_1011 = getTimer();
         var_1168 = false;
         var_793 = param1.readInteger();
         _creationMonth = param1.readInteger();
         var_1178 = param1.readInteger();
         var_609 = itemType == "S" ? param1.readInteger() : -1;
         _flatId = -1;
         var_326 = false;
         var_970 = var_261 == "I";
      }
      
      public function get itemId() : int
      {
         return var_399;
      }
      
      public function get itemType() : String
      {
         return var_261;
      }
      
      public function get roomItemId() : int
      {
         return var_1118;
      }
      
      public function get itemTypeId() : int
      {
         return var_826;
      }
      
      public function get category() : int
      {
         return var_774;
      }
      
      public function get stuffData() : IStuffData
      {
         return var_921;
      }
      
      public function get extra() : int
      {
         return var_609;
      }
      
      public function get secondsToExpiration() : int
      {
         return _secondsToExpiration;
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
      
      public function get isGroupable() : Boolean
      {
         return var_797;
      }
      
      public function get songId() : int
      {
         return var_609;
      }
      
      public function get flatId() : int
      {
         return _flatId;
      }
      
      public function get isRented() : Boolean
      {
         return var_326;
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
      
      public function get isRecyclable() : Boolean
      {
         return true;
      }
      
      public function get isTradeable() : Boolean
      {
         return true;
      }
      
      public function get isSellable() : Boolean
      {
         return true;
      }
      
      public function get slotId() : String
      {
         return null;
      }
      
      public function get isExternalImageFurni() : Boolean
      {
         return var_261.indexOf("external_image") != -1;
      }
   }
}
