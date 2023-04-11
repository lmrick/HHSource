package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1427 implements IMessageParser
   {
       
      
      private var var_1395:int;
      
      private var var_1398:Boolean;
      
      public function class_1427()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1395 = param1.readInteger();
         this.var_1398 = param1.readBoolean();
         return true;
      }
      
      public function get rating() : int
      {
         return var_1395;
      }
      
      public function get canRate() : Boolean
      {
         return var_1398;
      }
   }
}
