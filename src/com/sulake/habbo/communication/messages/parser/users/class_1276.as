package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1276 implements IMessageParser
   {
      
      public static const const_328:int = 1;
      
      public static const const_304:int = 2;
      
      public static const const_34:int = 3;
      
      public static const const_79:int = 4;
       
      
      private var _productName:String;
      
      private var var_1307:int;
      
      private var var_1196:int;
      
      private var var_1232:int;
      
      private var var_1215:int;
      
      private var var_1165:Boolean;
      
      private var var_1296:Boolean;
      
      private var var_1265:int;
      
      private var var_1159:int;
      
      private var _minutesUntilExpiration:int;
      
      private var var_1279:int;
      
      public function class_1276()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _productName = param1.readString();
         var_1307 = param1.readInteger();
         var_1196 = param1.readInteger();
         var_1232 = param1.readInteger();
         var_1215 = param1.readInteger();
         var_1165 = param1.readBoolean();
         var_1296 = param1.readBoolean();
         var_1265 = param1.readInteger();
         var_1159 = param1.readInteger();
         _minutesUntilExpiration = param1.readInteger();
         if(param1.bytesAvailable)
         {
            var_1279 = param1.readInteger();
         }
         return true;
      }
      
      public function get productName() : String
      {
         return _productName;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1307;
      }
      
      public function get memberPeriods() : int
      {
         return var_1196;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1232;
      }
      
      public function get responseType() : int
      {
         return var_1215;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1165;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1296;
      }
      
      public function get pastClubDays() : int
      {
         return var_1265;
      }
      
      public function get pastVipDays() : int
      {
         return var_1159;
      }
      
      public function get minutesUntilExpiration() : int
      {
         return _minutesUntilExpiration;
      }
      
      public function get minutesSinceLastModified() : int
      {
         return var_1279;
      }
   }
}
