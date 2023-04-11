package package_176
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1342 implements IMessageParser
   {
       
      
      private var var_522:int;
      
      public function class_1342()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_522 = param1.readInteger();
         return true;
      }
      
      public function get score() : int
      {
         return var_522;
      }
   }
}
