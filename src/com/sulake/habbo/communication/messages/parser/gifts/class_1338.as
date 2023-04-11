package package_172
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1338 implements IMessageParser
   {
       
      
      private var var_379:int;
      
      private var var_898:int;
      
      private var var_424:int;
      
      public function class_1338()
      {
         super();
      }
      
      public function get phoneStatusCode() : int
      {
         return var_379;
      }
      
      public function get collectionStatusCode() : int
      {
         return var_898;
      }
      
      public function get millisecondsToAllowProcessReset() : int
      {
         return var_424;
      }
      
      public function flush() : Boolean
      {
         var_379 = -1;
         var_424 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_379 = param1.readInteger();
         var_898 = param1.readInteger();
         var_424 = param1.readInteger();
         return true;
      }
   }
}
