package package_150
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1135 implements IMessageParser
   {
       
      
      private var var_354:int;
      
      public function class_1135()
      {
         super();
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_354 = param1.readInteger();
         return true;
      }
   }
}
