package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1246 implements IMessageParser
   {
       
      
      private var var_355:int = -1;
      
      public function class_1246()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_355 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_355 = param1.readInteger();
         return true;
      }
      
      public function get effectId() : int
      {
         return var_355;
      }
   }
}
