package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1145 implements IMessageParser
   {
       
      
      private var _productName:String = "";
      
      private var _productDescription:String = "";
      
      public function class_1145()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _productDescription = "";
         _productName = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _productDescription = param1.readString();
         _productName = param1.readString();
         return true;
      }
      
      public function get productName() : String
      {
         return _productName;
      }
      
      public function get productDescription() : String
      {
         return _productDescription;
      }
   }
}
