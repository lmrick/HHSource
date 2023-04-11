package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1169 implements IMessageParser
   {
       
      
      private var var_1393:int;
      
      private var var_413:int;
      
      public function class_1169()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1393 = param1.readInteger();
         this.var_413 = param1.readInteger();
         return true;
      }
      
      public function get clientMessageId() : int
      {
         return this.var_1393;
      }
      
      public function get errorCode() : int
      {
         return this.var_413;
      }
   }
}
