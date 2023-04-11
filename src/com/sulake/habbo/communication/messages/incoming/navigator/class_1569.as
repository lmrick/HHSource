package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1569 implements class_13
   {
       
      
      private const const_93:int = 1;
      
      private const const_252:int = 2;
      
      private const const_303:int = 4;
      
      private const const_399:int = 8;
      
      private const const_292:int = 16;
      
      private const const_172:int = 32;
      
      private var _flatId:int;
      
      private var _roomName:String;
      
      private var var_1327:Boolean;
      
      private var var_684:int;
      
      private var _ownerName:String;
      
      private var var_719:int;
      
      private var var_392:int;
      
      private var var_1238:int;
      
      private var _description:String;
      
      private var var_776:int;
      
      private var var_522:int;
      
      private var var_1076:int;
      
      private var var_415:int;
      
      private var var_1428:int;
      
      private var var_771:int = 0;
      
      private var _groupName:String = "";
      
      private var var_1280:String = "";
      
      private var var_239:Array;
      
      private var var_664:package_11.class_1668;
      
      private var var_834:Boolean;
      
      private var var_715:Boolean;
      
      private var var_818:String = "";
      
      private var var_998:String = "";
      
      private var var_1252:int = 0;
      
      private var var_1281:Boolean;
      
      private var var_1032:Boolean;
      
      private var _disposed:Boolean;
      
      private var var_939:String = null;
      
      public function class_1569(param1:IMessageDataWrapper)
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var_239 = [];
         super();
         _flatId = param1.readInteger();
         _roomName = param1.readString();
         var_684 = param1.readInteger();
         _ownerName = param1.readString();
         var_719 = param1.readInteger();
         var_392 = param1.readInteger();
         var_1238 = param1.readInteger();
         _description = param1.readString();
         var_776 = param1.readInteger();
         var_522 = param1.readInteger();
         var_1076 = param1.readInteger();
         var_415 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_239.push(_loc5_);
            _loc4_++;
         }
         var _loc2_:int = param1.readInteger();
         if((_loc2_ & 1) > 0)
         {
            var_939 = param1.readString();
         }
         if((_loc2_ & 2) > 0)
         {
            var_771 = param1.readInteger();
            _groupName = param1.readString();
            var_1280 = param1.readString();
         }
         if((_loc2_ & 4) > 0)
         {
            var_818 = param1.readString();
            var_998 = param1.readString();
            var_1252 = param1.readInteger();
         }
         var_1327 = (_loc2_ & 8) > 0;
         var_834 = (_loc2_ & 16) > 0;
         var_715 = (_loc2_ & 32) > 0;
         var_664 = new package_11.class_1668(null);
         var_664.setDefaults();
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_239 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get flatId() : int
      {
         return _flatId;
      }
      
      public function get roomName() : String
      {
         return _roomName;
      }
      
      public function get showOwner() : Boolean
      {
         return var_1327;
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get doorMode() : int
      {
         return var_719;
      }
      
      public function get userCount() : int
      {
         return var_392;
      }
      
      public function get maxUserCount() : int
      {
         return var_1238;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function get tradeMode() : int
      {
         return var_776;
      }
      
      public function get score() : int
      {
         return var_522;
      }
      
      public function get ranking() : int
      {
         return var_1076;
      }
      
      public function get categoryId() : int
      {
         return var_415;
      }
      
      public function get habboGroupId() : int
      {
         return var_771;
      }
      
      public function get groupName() : String
      {
         return _groupName;
      }
      
      public function get groupBadgeCode() : String
      {
         return var_1280;
      }
      
      public function get tags() : Array
      {
         return var_239;
      }
      
      public function get thumbnail() : package_11.class_1668
      {
         return var_664;
      }
      
      public function get allowPets() : Boolean
      {
         return var_834;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return var_715;
      }
      
      public function get roomAdName() : String
      {
         return var_818;
      }
      
      public function get roomAdDescription() : String
      {
         return var_998;
      }
      
      public function get roomAdExpiresInMin() : int
      {
         return var_1252;
      }
      
      public function get allInRoomMuted() : Boolean
      {
         return var_1281;
      }
      
      public function get officialRoomPicRef() : String
      {
         return var_939;
      }
      
      public function set allInRoomMuted(param1:Boolean) : void
      {
         var_1281 = param1;
      }
      
      public function set roomName(param1:String) : void
      {
         _roomName = param1;
      }
      
      public function get canMute() : Boolean
      {
         return var_1032;
      }
      
      public function set canMute(param1:Boolean) : void
      {
         var_1032 = param1;
      }
   }
}
