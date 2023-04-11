package package_125
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1333 implements IMessageParser
   {
       
      
      private var var_425:int;
      
      private var var_353:Boolean;
      
      private var var_555:int;
      
      private var var_394:Boolean;
      
      public function class_1333()
      {
         super();
      }
      
      public function get userID() : int
      {
         return var_425;
      }
      
      public function get userCanTrade() : Boolean
      {
         return var_353;
      }
      
      public function get otherUserID() : int
      {
         return var_555;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return var_394;
      }
      
      public function flush() : Boolean
      {
         var_425 = -1;
         var_353 = false;
         var_555 = -1;
         var_394 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_425 = param1.readInteger();
         var_353 = param1.readInteger() == 1;
         var_555 = param1.readInteger();
         var_394 = param1.readInteger() == 1;
         return true;
      }
   }
}
