package package_145
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1273 implements IMessageParser
   {
       
      
      private var var_309:Boolean = false;
      
      private var var_487:String = null;
      
      public function class_1273()
      {
         super();
      }
      
      public function isOk() : Boolean
      {
         return var_309;
      }
      
      public function getErrorReason() : String
      {
         return var_487;
      }
      
      public function flush() : Boolean
      {
         var_309 = false;
         var_487 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_309 = param1.readBoolean();
         var_487 = param1.readString();
         return true;
      }
   }
}
