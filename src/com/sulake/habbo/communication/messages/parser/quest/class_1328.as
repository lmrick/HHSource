package package_139
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_83.class_1605;
   
   [SecureSWF(rename="true")]
   public class class_1328 implements IMessageParser
   {
       
      
      private var var_526:class_1605;
      
      private var var_992:Boolean;
      
      public function class_1328()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_526 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_526 = new class_1605(param1);
         var_992 = param1.readBoolean();
         return true;
      }
      
      public function get questData() : class_1605
      {
         return var_526;
      }
      
      public function get showDialog() : Boolean
      {
         return var_992;
      }
   }
}
