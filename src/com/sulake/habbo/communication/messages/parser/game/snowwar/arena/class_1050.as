package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1050 implements IMessageParser
   {
       
      
      private var var_339:int;
      
      private var var_508:int;
      
      public function class_1050()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_339 = NaN;
         var_508 = NaN;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_339 = param1.readInteger();
         var_508 = param1.readInteger();
         return true;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get playerGameObjectId() : int
      {
         return var_508;
      }
   }
}
