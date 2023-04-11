package package_179
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1494 implements IMessageParser
   {
       
      
      private var var_399:int;
      
      public function class_1494()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_399 = param1.readInteger();
         return true;
      }
      
      public function get itemId() : int
      {
         return var_399;
      }
   }
}
