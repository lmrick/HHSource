package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1317 implements IMessageParser
   {
       
      
      private var var_338:int;
      
      public function class_1317()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_338 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_338 = param1.readInteger();
         return true;
      }
      
      public function get timeToStageEnd() : int
      {
         return var_338;
      }
   }
}
