package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1330 implements IMessageParser
   {
       
      
      private var var_358:String;
      
      private var var_531:int;
      
      private var _totalCoinsForBonus:int;
      
      private var var_499:int;
      
      public function class_1330()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _totalCoinsForBonus = -1;
         var_499 = -1;
         var_358 = "";
         var_531 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_358 = param1.readString();
         var_531 = param1.readInteger();
         _totalCoinsForBonus = param1.readInteger();
         var_499 = param1.readInteger();
         return true;
      }
      
      public function get totalCoinsForBonus() : int
      {
         return _totalCoinsForBonus;
      }
      
      public function get coinsStillRequiredToBuy() : int
      {
         return var_499;
      }
      
      public function get productType() : String
      {
         return var_358;
      }
      
      public function get productClassId() : int
      {
         return var_531;
      }
   }
}
