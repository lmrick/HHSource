package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_8.class_1542;
   
   [SecureSWF(rename="true")]
   public class class_1225 implements IMessageParser
   {
       
      
      private var _offer:class_1542;
      
      public function class_1225()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _offer = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _offer = new class_1542(param1);
         return true;
      }
      
      public function offer() : class_1542
      {
         return _offer;
      }
   }
}
