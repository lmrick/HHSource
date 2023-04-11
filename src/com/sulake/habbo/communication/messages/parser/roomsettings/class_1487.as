package package_126
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1487 implements IMessageParser
   {
       
      
      private var var_692:int;
      
      public function class_1487()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_692 = param1.readInteger();
         return true;
      }
      
      public function get selectionType() : int
      {
         return var_692;
      }
   }
}
