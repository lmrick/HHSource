package package_144
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1121 implements IMessageParser
   {
       
      
      private var var_436:package_144.class_1572;
      
      private var var_873:Boolean;
      
      public function class_1121()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_436 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_436 = new package_144.class_1572(param1);
         var_873 = param1.readBoolean();
         return true;
      }
      
      public function get pet() : package_144.class_1572
      {
         return var_436;
      }
      
      public function openInventory() : Boolean
      {
         return var_873;
      }
   }
}
