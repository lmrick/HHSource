package package_176
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_101.class_1614;
   
   [SecureSWF(rename="true")]
   public class class_1345 implements IMessageParser
   {
       
      
      private var var_501:class_1614;
      
      public function class_1345()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_501 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_501 = new class_1614(param1);
         return true;
      }
      
      public function get achievement() : class_1614
      {
         return var_501;
      }
   }
}
