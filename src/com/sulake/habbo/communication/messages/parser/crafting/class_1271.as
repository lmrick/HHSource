package package_148
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1271 implements IMessageParser
   {
       
      
      private var var_297:Boolean;
      
      private var var_1008:package_148.class_1545;
      
      public function class_1271()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_297 = param1.readBoolean();
         if(var_297)
         {
            var_1008 = new package_148.class_1545(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_297 = false;
         return true;
      }
      
      public function get success() : Boolean
      {
         return var_297;
      }
      
      public function get productData() : package_148.class_1545
      {
         return var_1008;
      }
   }
}
