package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1496 implements IMessageParser
   {
       
      
      private var var_490:int;
      
      private var var_563:int;
      
      public function class_1496()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_490 = param1.readInteger();
         var_563 = param1.readInteger();
         return true;
      }
      
      public function get furniId() : int
      {
         return var_490;
      }
      
      public function get commandId() : int
      {
         return var_563;
      }
   }
}
