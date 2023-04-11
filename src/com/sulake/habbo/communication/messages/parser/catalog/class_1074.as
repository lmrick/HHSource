package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1074 implements IMessageParser
   {
       
      
      private var var_929:int;
      
      public function class_1074()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_929 = param1.readInteger();
         return true;
      }
      
      public function get furniCount() : int
      {
         return var_929;
      }
   }
}
