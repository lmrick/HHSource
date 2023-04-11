package package_125
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1411 implements IMessageParser
   {
       
      
      private var var_425:int;
      
      private var var_576:Boolean;
      
      public function class_1411()
      {
         super();
      }
      
      public function get userID() : int
      {
         return var_425;
      }
      
      public function get userAccepts() : Boolean
      {
         return var_576;
      }
      
      public function flush() : Boolean
      {
         var_425 = -1;
         var_576 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_425 = param1.readInteger();
         var_576 = param1.readInteger() > 0;
         return true;
      }
   }
}
