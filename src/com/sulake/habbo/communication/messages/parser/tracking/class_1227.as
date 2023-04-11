package package_169
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1227 implements IMessageParser
   {
       
      
      private var var_438:int;
      
      public function class_1227()
      {
         super();
      }
      
      public function get requestId() : int
      {
         return var_438;
      }
      
      public function flush() : Boolean
      {
         var_438 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_438 = param1.readInteger();
         return true;
      }
   }
}
