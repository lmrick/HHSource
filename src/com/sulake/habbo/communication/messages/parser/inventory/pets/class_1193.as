package package_144
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1193 implements IMessageParser
   {
       
      
      private var var_472:int;
      
      private var var_170:int;
      
      public function class_1193()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_472 = 0;
         var_170 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_472 = param1.readInteger();
         var_170 = param1.readInteger();
         return true;
      }
      
      public function get breedingNestStuffId() : int
      {
         return var_472;
      }
      
      public function get result() : int
      {
         return var_170;
      }
   }
}
