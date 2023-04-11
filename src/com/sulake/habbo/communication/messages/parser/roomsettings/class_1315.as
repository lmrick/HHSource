package package_126
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_78.class_1624;
   
   [SecureSWF(rename="true")]
   public class class_1315 implements IMessageParser
   {
       
      
      private var _flatId:int;
      
      private var var_45:class_1624;
      
      public function class_1315()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._flatId = param1.readInteger();
         this.var_45 = new class_1624(param1);
         return true;
      }
      
      public function get flatId() : int
      {
         return _flatId;
      }
      
      public function get data() : class_1624
      {
         return var_45;
      }
   }
}
