package package_126
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1214 implements IMessageParser
   {
       
      
      private var var_354:int;
      
      private var var_413:int;
      
      public function class_1214()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_354 = param1.readInteger();
         var_413 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_354 = 0;
         var_413 = 0;
         return true;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get errorCode() : int
      {
         return var_413;
      }
   }
}
