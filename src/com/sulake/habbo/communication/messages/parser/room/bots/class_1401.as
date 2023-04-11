package package_171
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1401 implements IMessageParser
   {
       
      
      private var var_341:int;
      
      public function class_1401()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_341 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_341 = param1.readInteger();
         return true;
      }
      
      public function get botId() : int
      {
         return var_341;
      }
   }
}
