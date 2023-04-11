package package_131
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1076 implements IMessageParser
   {
       
      
      private var var_271:int;
      
      public function class_1076()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_271 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_271 = param1.readInteger();
         return true;
      }
      
      public function get type() : int
      {
         return var_271;
      }
   }
}
