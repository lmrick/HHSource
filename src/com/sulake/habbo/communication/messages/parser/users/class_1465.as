package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1465 implements IMessageParser
   {
       
      
      private var var_339:int = 0;
      
      private var var_702:int = 0;
      
      public function class_1465()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_339 = param1.readInteger();
         var_702 = param1.readInteger();
         return true;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get respectTotal() : int
      {
         return var_702;
      }
   }
}
