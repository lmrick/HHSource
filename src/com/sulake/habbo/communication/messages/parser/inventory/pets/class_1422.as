package package_144
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1422 implements IMessageParser
   {
       
      
      private var var_421:int;
      
      public function class_1422()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_421 = param1.readInteger();
         return true;
      }
      
      public function get petId() : int
      {
         return var_421;
      }
   }
}
