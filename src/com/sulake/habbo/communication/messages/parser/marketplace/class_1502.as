package package_127
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1502 implements IMessageParser
   {
       
      
      private var var_991:int;
      
      private var var_170:int;
      
      public function class_1502()
      {
         super();
      }
      
      public function get tokenCount() : int
      {
         return var_991;
      }
      
      public function get resultCode() : int
      {
         return var_170;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_170 = param1.readInteger();
         var_991 = param1.readInteger();
         return true;
      }
   }
}
