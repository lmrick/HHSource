package package_175
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1357 implements IMessageParser
   {
       
      
      private var var_302:package_175.class_1616;
      
      private var var_873:Boolean;
      
      public function class_1357()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_302 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_302 = new package_175.class_1616(param1);
         var_873 = param1.readBoolean();
         return true;
      }
      
      public function get item() : package_175.class_1616
      {
         return var_302;
      }
      
      public function openInventory() : Boolean
      {
         return var_873;
      }
   }
}
