package package_144
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1350 implements IMessageParser
   {
       
      
      private var var_1044:Boolean;
      
      private var var_436:package_144.class_1572;
      
      public function class_1350()
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
         var_436 = new package_144.class_1572(param1);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1044;
      }
      
      public function get pet() : package_144.class_1572
      {
         return var_436;
      }
   }
}
