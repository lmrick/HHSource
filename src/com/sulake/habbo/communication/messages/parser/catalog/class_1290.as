package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_8.class_1563;
   
   [SecureSWF(rename="true")]
   public class class_1290 implements IMessageParser
   {
       
      
      private var _offer:class_1563;
      
      public function class_1290()
      {
         super();
      }
      
      public function get offer() : class_1563
      {
         return _offer;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _offer = new class_1563(param1);
         return true;
      }
   }
}
