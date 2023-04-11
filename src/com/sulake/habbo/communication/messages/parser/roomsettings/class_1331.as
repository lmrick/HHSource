package package_126
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1331 implements IMessageParser
   {
       
      
      private var var_354:int;
      
      private var var_339:int;
      
      public function class_1331()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_354 = 0;
         var_339 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_354 = param1.readInteger();
         var_339 = param1.readInteger();
         return true;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
   }
}
