package package_161
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1431 implements IMessageParser
   {
       
      
      private var var_403:int;
      
      private var var_381:int;
      
      public function class_1431()
      {
         super();
      }
      
      public function get openHour() : int
      {
         return var_403;
      }
      
      public function get openMinute() : int
      {
         return var_381;
      }
      
      public function flush() : Boolean
      {
         var_403 = 0;
         var_381 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_403 = param1.readInteger();
         var_381 = param1.readInteger();
         return true;
      }
   }
}
