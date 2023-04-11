package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1206 implements IMessageParser
   {
       
      
      private var var_1078:int;
      
      public function class_1206()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1078 = param1.readInteger();
         return true;
      }
      
      public function get unreadMessageCount() : int
      {
         return var_1078;
      }
   }
}
