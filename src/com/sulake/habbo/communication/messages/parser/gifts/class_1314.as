package package_172
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1314 implements IMessageParser
   {
       
      
      private var var_380:int;
      
      private var var_1140:int;
      
      public function class_1314()
      {
         super();
      }
      
      public function get resultCode() : int
      {
         return var_380;
      }
      
      public function get millisToAllowProcessReset() : int
      {
         return var_1140;
      }
      
      public function flush() : Boolean
      {
         var_380 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_380 = param1.readInteger();
         var_1140 = param1.readInteger();
         return true;
      }
   }
}
