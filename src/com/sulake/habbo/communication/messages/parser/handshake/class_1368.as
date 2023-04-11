package package_133
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1368 implements IMessageParser
   {
       
      
      private var var_875:int;
      
      public function class_1368()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_875 = param1.readInteger();
         return true;
      }
      
      public function get noobnessLevel() : int
      {
         return var_875;
      }
   }
}
