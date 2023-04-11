package package_175
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1500 implements IMessageParser
   {
       
      
      private var var_1044:Boolean;
      
      private var var_302:package_175.class_1616;
      
      public function class_1500()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1044 = param1.readBoolean();
         var_302 = new package_175.class_1616(param1);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1044;
      }
      
      public function get item() : package_175.class_1616
      {
         return var_302;
      }
   }
}
