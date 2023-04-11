package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1115 implements IMessageParser
   {
       
      
      private var var_337:int;
      
      private var var_344:int;
      
      private var _offerId:int;
      
      private var var_358:String;
      
      public function class_1115()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_337 = -1;
         var_344 = -1;
         _offerId = -1;
         var_358 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_337 = param1.readInteger();
         var_344 = param1.readInteger();
         _offerId = param1.readInteger();
         var_358 = param1.readString();
         return true;
      }
      
      public function get appearsInSeconds() : int
      {
         return var_337;
      }
      
      public function get pageId() : int
      {
         return var_344;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get productType() : String
      {
         return var_358;
      }
   }
}
