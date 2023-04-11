package package_124
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1051 implements IMessageParser
   {
       
      
      private var var_413:int = 0;
      
      private var var_881:String;
      
      public function class_1051()
      {
         super();
      }
      
      public function get errorCode() : int
      {
         return var_413;
      }
      
      public function get filteredText() : String
      {
         return var_881;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_413 = param1.readInteger();
         var_881 = param1.readString();
         return true;
      }
   }
}
