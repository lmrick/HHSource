package package_147
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1362 implements IMessageParser
   {
       
      
      private var var_781:int;
      
      public function class_1362()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_781 = param1.readInteger();
         return true;
      }
      
      public function get numGifts() : int
      {
         return var_781;
      }
   }
}
