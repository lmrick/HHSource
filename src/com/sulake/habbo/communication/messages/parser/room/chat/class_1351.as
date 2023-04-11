package package_164
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1351 implements IMessageParser
   {
       
      
      private var var_1133:int = 0;
      
      public function class_1351()
      {
         super();
      }
      
      public function get secondsRemaining() : int
      {
         return var_1133;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1133 = param1.readInteger();
         return true;
      }
   }
}
