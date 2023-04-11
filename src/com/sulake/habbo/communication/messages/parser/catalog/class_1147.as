package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_8.class_1535;
   
   [SecureSWF(rename="true")]
   public class class_1147 implements IMessageParser
   {
       
      
      private var _bundleDiscountRuleset:class_1535;
      
      public function class_1147()
      {
         super();
      }
      
      public function get bundleDiscountRuleset() : class_1535
      {
         return _bundleDiscountRuleset;
      }
      
      public function flush() : Boolean
      {
         _bundleDiscountRuleset = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _bundleDiscountRuleset = new class_1535(param1);
         return true;
      }
   }
}
