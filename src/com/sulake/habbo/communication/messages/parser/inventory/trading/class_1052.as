package package_125
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1052 implements IMessageParser
   {
      
      public static const const_214:int = 1;
       
      
      private var var_339:int;
      
      private var var_305:int;
      
      public function class_1052()
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
         var_305 = param1.readInteger();
         return true;
      }
      
      public function get userID() : int
      {
         return var_339;
      }
      
      public function get reason() : int
      {
         return var_305;
      }
   }
}
