package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1405 implements IMessageParser
   {
       
      
      private var var_359:int;
      
      public function class_1405()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_359 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_359 = param1.readInteger();
         return true;
      }
      
      public function get timeToNextState() : int
      {
         return var_359;
      }
   }
}
