package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1247 implements IMessageParser
   {
       
      
      private var var_339:int;
      
      private var var_297:Boolean;
      
      public function class_1247()
      {
         super();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get success() : Boolean
      {
         return var_297;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_339 = param1.readInteger();
         var_297 = param1.readBoolean();
         return true;
      }
   }
}
