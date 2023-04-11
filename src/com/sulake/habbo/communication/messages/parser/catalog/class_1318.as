package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_8.class_1615;
   
   [SecureSWF(rename="true")]
   public class class_1318 implements IMessageParser
   {
       
      
      private var var_45:class_1615;
      
      public function class_1318()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_45 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_45 = new class_1615().parse(param1);
         return true;
      }
      
      public function get data() : class_1615
      {
         return var_45;
      }
   }
}
