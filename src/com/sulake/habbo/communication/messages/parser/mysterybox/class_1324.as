package package_168
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1324 implements IMessageParser
   {
       
      
      private var var_348:String;
      
      private var var_385:int;
      
      public function class_1324()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_348 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_348 = param1.readString();
         var_385 = param1.readInteger();
         return true;
      }
      
      public function get contentType() : String
      {
         return var_348;
      }
      
      public function get classId() : int
      {
         return var_385;
      }
   }
}
