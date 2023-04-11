package package_50
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1564
   {
       
      
      private var var_339:int;
      
      private var _userName:String;
      
      private var var_872:int;
      
      private var var_1009:int;
      
      private var _online:Boolean;
      
      private var var_966:int;
      
      private var var_999:int;
      
      private var var_1191:int;
      
      private var var_1312:int;
      
      private var var_1185:int;
      
      private var var_764:String;
      
      private var var_1173:String;
      
      private var var_1017:int;
      
      private var var_935:int;
      
      private var var_1329:String;
      
      private var var_427:String;
      
      private var var_959:String;
      
      private var var_828:String = "";
      
      private var var_1182:int = 0;
      
      public function class_1564(param1:IMessageDataWrapper)
      {
         super();
         var_339 = param1.readInteger();
         _userName = param1.readString();
         var_427 = param1.readString();
         var_872 = param1.readInteger();
         var_1009 = param1.readInteger();
         _online = param1.readBoolean();
         var_966 = param1.readInteger();
         var_999 = param1.readInteger();
         var_1191 = param1.readInteger();
         var_1312 = param1.readInteger();
         var_1185 = param1.readInteger();
         var_764 = param1.readString();
         var_1173 = param1.readString();
         var_1017 = param1.readInteger();
         var_935 = param1.readInteger();
         var_1329 = param1.readString();
         var_959 = param1.readString();
         if(param1.bytesAvailable)
         {
            var_828 = param1.readString();
            var_1182 = param1.readInteger();
         }
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get registrationAgeInMinutes() : int
      {
         return var_872;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1009;
      }
      
      public function get online() : Boolean
      {
         return _online;
      }
      
      public function get cfhCount() : int
      {
         return var_966;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_999;
      }
      
      public function get cautionCount() : int
      {
         return var_1191;
      }
      
      public function get banCount() : int
      {
         return var_1312;
      }
      
      public function get tradingLockCount() : int
      {
         return var_1185;
      }
      
      public function get tradingExpiryDate() : String
      {
         return var_764;
      }
      
      public function get lastPurchaseDate() : String
      {
         return var_1173;
      }
      
      public function get identityId() : int
      {
         return var_1017;
      }
      
      public function get identityRelatedBanCount() : int
      {
         return var_935;
      }
      
      public function get primaryEmailAddress() : String
      {
         return var_1329;
      }
      
      public function get userClassification() : String
      {
         return var_959;
      }
      
      public function get lastSanctionTime() : String
      {
         return var_828;
      }
      
      public function get sanctionAgeHours() : int
      {
         return var_1182;
      }
   }
}
