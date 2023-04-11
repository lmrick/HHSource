package package_8
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1541
   {
       
      
      private var _offerId:int;
      
      private var var_343:String;
      
      private var var_908:int;
      
      private var var_703:int;
      
      private var var_964:int;
      
      private var var_725:Boolean;
      
      private var var_880:int;
      
      private var var_1295:int;
      
      private var var_1264:int;
      
      private var var_364:int;
      
      private var _month:int;
      
      private var var_690:int;
      
      private var var_859:Boolean;
      
      public function class_1541(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_343 = param1.readString();
         param1.readBoolean();
         var_908 = param1.readInteger();
         var_703 = param1.readInteger();
         var_964 = param1.readInteger();
         var_725 = param1.readBoolean();
         var_880 = param1.readInteger();
         var_1295 = param1.readInteger();
         var_859 = param1.readBoolean();
         var_1264 = param1.readInteger();
         var_364 = param1.readInteger();
         _month = param1.readInteger();
         var_690 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get priceCredits() : int
      {
         return var_908;
      }
      
      public function get vip() : Boolean
      {
         return var_725;
      }
      
      public function get months() : int
      {
         return var_880;
      }
      
      public function get extraDays() : int
      {
         return var_1295;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1264;
      }
      
      public function get year() : int
      {
         return var_364;
      }
      
      public function get month() : int
      {
         return _month;
      }
      
      public function get day() : int
      {
         return var_690;
      }
      
      public function get priceActivityPoints() : int
      {
         return var_703;
      }
      
      public function get priceActivityPointType() : int
      {
         return var_964;
      }
      
      public function get isGiftable() : Boolean
      {
         return var_859;
      }
   }
}
