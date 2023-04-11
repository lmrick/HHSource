package package_127
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1388 implements IMessageParser
   {
       
      
      private var var_170:int;
      
      private var var_740:int = -1;
      
      private var var_1167:int = -1;
      
      private var var_891:int = -1;
      
      public function class_1388()
      {
         super();
      }
      
      public function get result() : int
      {
         return var_170;
      }
      
      public function get offerId() : int
      {
         return var_740;
      }
      
      public function get newPrice() : int
      {
         return var_1167;
      }
      
      public function get requestedOfferId() : int
      {
         return var_891;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_170 = param1.readInteger();
         var_740 = param1.readInteger();
         var_1167 = param1.readInteger();
         var_891 = param1.readInteger();
         return true;
      }
   }
}
