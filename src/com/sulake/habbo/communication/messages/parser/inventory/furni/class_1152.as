package package_166
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1152 implements IMessageParser
   {
       
      
      private var var_247:int;
      
      private var var_1214:int;
      
      public function class_1152()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_247 = param1.readInteger();
         var_1214 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get itemsLeft() : int
      {
         return var_1214;
      }
   }
}
