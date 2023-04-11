package package_165
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_36.class_1632;
   
   [SecureSWF(rename="true")]
   public class class_1148 implements IMessageParser
   {
       
      
      private var var_575:int = -1;
      
      private var var_459:int = -1;
      
      private var var_546:class_1632;
      
      public function class_1148()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_575 = param1.readInteger();
         var_459 = param1.readInteger();
         var_546 = new class_1632(param1);
         return true;
      }
      
      public function get issueId() : int
      {
         return var_575;
      }
      
      public function get accountId() : int
      {
         return var_459;
      }
      
      public function get sanctionType() : class_1632
      {
         return var_546;
      }
      
      public function flush() : Boolean
      {
         var_575 = -1;
         var_459 = -1;
         var_546 = null;
         return true;
      }
   }
}
