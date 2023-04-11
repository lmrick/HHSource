package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1454 implements IMessageParser
   {
       
      
      private var var_45:package_137.class_1649;
      
      public function class_1454()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         if(var_45 != null)
         {
            var_45.dispose();
            var_45 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_45 = new package_137.class_1649(param1);
         return true;
      }
      
      public function get data() : package_137.class_1649
      {
         return var_45;
      }
   }
}
