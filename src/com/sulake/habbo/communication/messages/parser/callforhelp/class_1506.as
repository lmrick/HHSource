package package_165
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1506 implements IMessageParser
   {
       
      
      private var var_736:Boolean;
      
      private var var_1303:Boolean;
      
      private var var_1171:String;
      
      private var var_741:int;
      
      private var var_1061:String;
      
      private var var_990:String;
      
      private var var_1299:int;
      
      private var var_1257:String;
      
      private var var_1269:int;
      
      private var var_847:Boolean;
      
      private var var_848:String;
      
      public function class_1506()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_736 = param1.readBoolean();
         var_1303 = param1.readBoolean();
         var_1171 = param1.readString();
         var_741 = param1.readInteger();
         param1.readInteger();
         var_1061 = param1.readString();
         var_990 = param1.readString();
         var_1299 = param1.readInteger();
         var_1257 = param1.readString();
         var_1269 = param1.readInteger();
         param1.readInteger();
         var_847 = param1.readBoolean();
         if(param1.bytesAvailable)
         {
            var_848 = param1.readString();
         }
         return true;
      }
      
      public function get isSanctionNew() : Boolean
      {
         return var_736;
      }
      
      public function get isSanctionActive() : Boolean
      {
         return var_1303;
      }
      
      public function get sanctionName() : String
      {
         return var_1171;
      }
      
      public function get sanctionLengthHours() : int
      {
         return var_741;
      }
      
      public function get sanctionReason() : String
      {
         return var_1061;
      }
      
      public function get sanctionCreationTime() : String
      {
         return var_990;
      }
      
      public function get probationHoursLeft() : int
      {
         return var_1299;
      }
      
      public function get nextSanctionName() : String
      {
         return var_1257;
      }
      
      public function get nextSanctionLengthHours() : int
      {
         return var_1269;
      }
      
      public function get hasCustomMute() : Boolean
      {
         return var_847;
      }
      
      public function get tradeLockExpiryTime() : String
      {
         return var_848;
      }
   }
}
