package package_65
{
   import com.sulake.habbo.room.IStuffData;
   
   [SecureSWF(rename="true")]
   public class class_1590
   {
       
      
      private var _offerId:int;
      
      private var var_490:int;
      
      private var var_1023:int;
      
      private var var_1271:String;
      
      private var var_921:IStuffData;
      
      private var var_958:int;
      
      private var _status:int;
      
      private var var_1212:int = -1;
      
      private var var_1010:int;
      
      private var _offerCount:int;
      
      public function class_1590(param1:int, param2:int, param3:int, param4:String, param5:IStuffData, param6:int, param7:int, param8:int, param9:int, param10:int = -1)
      {
         super();
         _offerId = param1;
         var_490 = param2;
         var_1023 = param3;
         var_1271 = param4;
         var_921 = param5;
         var_958 = param6;
         _status = param7;
         var_1212 = param8;
         var_1010 = param9;
         _offerCount = param10;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniId() : int
      {
         return var_490;
      }
      
      public function get furniType() : int
      {
         return var_1023;
      }
      
      public function get extraData() : String
      {
         return var_1271;
      }
      
      public function get stuffData() : IStuffData
      {
         return var_921;
      }
      
      public function get price() : int
      {
         return var_958;
      }
      
      public function get status() : int
      {
         return _status;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1212;
      }
      
      public function get averagePrice() : int
      {
         return var_1010;
      }
      
      public function get offerCount() : int
      {
         return _offerCount;
      }
   }
}
