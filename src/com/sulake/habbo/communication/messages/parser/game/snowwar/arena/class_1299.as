package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1299 implements IMessageParser
   {
       
      
      private var var_339:int;
      
      private var var_534:String;
      
      public function class_1299()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_339 = -1;
         var_534 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_339 = param1.readInteger();
         var_534 = param1.readString();
         return true;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get chatMessage() : String
      {
         return var_534;
      }
   }
}
