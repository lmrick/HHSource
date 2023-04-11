package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1520 implements IMessageParser
   {
       
      
      private var var_339:int;
      
      public function class_1520()
      {
         super();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_339 = param1.readInteger();
         return true;
      }
   }
}
