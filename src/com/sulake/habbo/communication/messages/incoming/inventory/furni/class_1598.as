package package_55
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.habbo.room.IStuffData;
   import flash.utils.getTimer;
   import package_154.class_1538;
   
   [SecureSWF(rename="true")]
   public class class_1598 implements class_1594
   {
      
      private static const const_205:String = "I";
      
      private static const const_121:String = "S";
       
      
      private var var_326:Boolean;
      
      private var var_399:int;
      
      private var var_261:String;
      
      private var var_1118:int;
      
      private var var_826:int;
      
      private var var_774:int;
      
      private var var_921:IStuffData;
      
      private var var_797:Boolean;
      
      private var var_1183:Boolean;
      
      private var var_1268:Boolean;
      
      private var var_1053:Boolean;
      
      private var _secondsToExpiration:int;
      
      private var var_609:int;
      
      private var _flatId:int;
      
      private var var_970:Boolean;
      
      private var var_1168:Boolean;
      
      private var var_1011:int;
      
      private var var_789:String = "";
      
      private var var_519:int = -1;
      
      public function class_1598(param1:IMessageDataWrapper)
      {
         super();
         var_399 = param1.readInteger();
         var_261 = param1.readString();
         var_1118 = param1.readInteger();
         var_826 = param1.readInteger();
         var_774 = param1.readInteger();
         var_921 = class_1538.parseStuffData(param1);
         var_1183 = param1.readBoolean();
         var_1268 = param1.readBoolean();
         var_797 = param1.readBoolean();
         var_1053 = param1.readBoolean();
         _secondsToExpiration = param1.readInteger();
         var_1011 = getTimer();
         if(secondsToExpiration > -1)
         {
            var_326 = true;
         }
         else
         {
            var_326 = false;
            _secondsToExpiration = -1;
         }
         var_1168 = param1.readBoolean();
         _flatId = param1.readInteger();
         var_970 = var_261 == "I";
         if(var_261 == "S")
         {
            var_789 = param1.readString();
            var_609 = param1.readInteger();
         }
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
      
      public function get isGroupable() : Boolean
      {
         return var_797;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1183;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1268;
      }
      
      public function get isSellable() : Boolean
      {
         return var_1053;
      }
      
      public function get secondsToExpiration() : int
      {
         return _secondsToExpiration;
      }
      
      public function get flatId() : int
      {
         return _flatId;
      }
      
      public function get slotId() : String
      {
         return var_789;
      }
      
      public function get songId() : int
      {
         return var_519;
      }
      
      public function get extra() : int
      {
         return var_609;
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
      
      public function get creationDay() : int
      {
         return 0;
      }
      
      public function get creationMonth() : int
      {
         return 0;
      }
      
      public function get creationYear() : int
      {
         return 0;
      }
      
      public function get isExternalImageFurni() : Boolean
      {
         return var_261.indexOf("external_image") != -1;
      }
   }
}
