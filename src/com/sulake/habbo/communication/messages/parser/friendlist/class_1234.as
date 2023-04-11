package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_24.class_1646;
   
   [SecureSWF(rename="true")]
   public class class_1234 implements IMessageParser
   {
       
      
      private var var_1387:class_1646;
      
      public function class_1234()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1387 = new class_1646(param1);
         return true;
      }
      
      public function get req() : class_1646
      {
         return this.var_1387;
      }
   }
}
