package package_121
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1407 implements IMessageParser
   {
       
      
      private var var_45:package_121.class_1537;
      
      public function class_1407()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_45 = new package_121.class_1537();
         var_45.parse(param1);
         return true;
      }
      
      public function flush() : Boolean
      {
         var_45 = null;
         return true;
      }
      
      public function cloneData() : package_121.class_1537
      {
         return !!var_45 ? var_45.clone() : null;
      }
   }
}
