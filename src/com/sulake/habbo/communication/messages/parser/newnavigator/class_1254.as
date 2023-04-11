package package_142
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_18.class_1548;
   
   [SecureSWF(rename="true")]
   public class class_1254 implements IMessageParser
   {
       
      
      private var var_513:class_1548;
      
      public function class_1254()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_513 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_513 = new class_1548(param1);
         return true;
      }
      
      public function get searchResult() : class_1548
      {
         return var_513;
      }
   }
}
