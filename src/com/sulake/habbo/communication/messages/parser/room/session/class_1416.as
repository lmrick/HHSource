package package_150
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1416 implements IMessageParser
   {
       
      
      private var var_339:int = 0;
      
      private var var_195:int = 0;
      
      public function class_1416()
      {
         super();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get value() : int
      {
         return var_195;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_339 = param1.readInteger();
         var_195 = param1.readInteger();
         return true;
      }
   }
}
