package package_180
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1385 implements IMessageParser
   {
       
      
      private var var_367:String = "";
      
      private var var_354:int = 0;
      
      public function class_1385()
      {
         super();
      }
      
      public function get roomType() : String
      {
         return var_367;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function flush() : Boolean
      {
         var_367 = "";
         var_354 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_367 = param1.readString();
         var_354 = param1.readInteger();
         return true;
      }
   }
}
