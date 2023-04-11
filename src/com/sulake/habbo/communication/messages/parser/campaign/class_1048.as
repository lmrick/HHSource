package package_121
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1048 implements IMessageParser
   {
       
      
      private var var_543:Boolean;
      
      private var _productName:String;
      
      private var var_525:String;
      
      private var var_552:String;
      
      public function class_1048()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_543 = param1.readBoolean();
         _productName = param1.readString();
         var_525 = param1.readString();
         var_552 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_543 = false;
         _productName = null;
         var_525 = null;
         var_552 = null;
         return true;
      }
      
      public function get doorOpened() : Boolean
      {
         return var_543;
      }
      
      public function get productName() : String
      {
         return _productName;
      }
      
      public function get customImage() : String
      {
         return var_525;
      }
      
      public function get furnitureClassName() : String
      {
         return var_552;
      }
   }
}
