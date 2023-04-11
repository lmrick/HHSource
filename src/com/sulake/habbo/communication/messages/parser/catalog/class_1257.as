package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1257 implements IMessageParser
   {
       
      
      private var _offerId:int;
      
      private var var_806:Boolean;
      
      public function class_1257()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _offerId = param1.readInteger();
         var_806 = param1.readBoolean();
         return true;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get isGiftable() : Boolean
      {
         return var_806;
      }
   }
}
