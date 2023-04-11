package package_150
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1216 implements IMessageParser
   {
       
      
      private var var_420:Boolean = false;
      
      public function class_1216()
      {
         super();
      }
      
      public function get isPlaying() : Boolean
      {
         return var_420;
      }
      
      public function flush() : Boolean
      {
         var_420 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_420 = param1.readBoolean();
         return true;
      }
   }
}
