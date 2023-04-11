package package_161
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1177 implements IMessageParser
   {
       
      
      private var var_504:int;
      
      public function class_1177()
      {
         super();
      }
      
      public function get minutesUntilClosing() : int
      {
         return var_504;
      }
      
      public function flush() : Boolean
      {
         var_504 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_504 = param1.readInteger();
         return true;
      }
   }
}
