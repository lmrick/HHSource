package package_155
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1160 implements IMessageParser
   {
       
      
      private var var_758:int;
      
      public function class_1160()
      {
         super();
      }
      
      public function get unreadForumsCount() : int
      {
         return var_758;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_758 = param1.readInteger();
         return true;
      }
   }
}
