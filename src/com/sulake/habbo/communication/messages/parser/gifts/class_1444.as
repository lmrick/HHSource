package package_172
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1444 implements IMessageParser
   {
       
      
      private var var_380:int;
      
      private var var_424:int;
      
      public function class_1444()
      {
         super();
      }
      
      public function get resultCode() : int
      {
         return var_380;
      }
      
      public function get millisecondsToAllowProcessReset() : int
      {
         return var_424;
      }
      
      public function flush() : Boolean
      {
         var_380 = -1;
         var_424 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_380 = param1.readInteger();
         var_424 = param1.readInteger();
         return true;
      }
   }
}
