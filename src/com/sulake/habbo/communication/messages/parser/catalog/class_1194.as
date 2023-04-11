package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1194 implements IMessageParser
   {
       
      
      private var var_413:int = 0;
      
      public function class_1194()
      {
         super();
      }
      
      public function get errorCode() : int
      {
         return var_413;
      }
      
      public function flush() : Boolean
      {
         var_413 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_413 = param1.readInteger();
         return true;
      }
   }
}
