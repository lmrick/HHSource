package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1130 implements IMessageParser
   {
       
      
      private var var_413:int;
      
      public function class_1130()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_413 = param1.readInteger();
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_413;
      }
   }
}
