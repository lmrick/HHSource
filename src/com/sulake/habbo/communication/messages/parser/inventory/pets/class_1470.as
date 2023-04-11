package package_144
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1470 implements IMessageParser
   {
       
      
      private var var_479:int;
      
      private var var_421:int;
      
      public function class_1470()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_421 = -1;
         var_479 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_421 = param1.readInteger();
         var_479 = param1.readInteger();
         return true;
      }
      
      public function get rarityCategory() : int
      {
         return var_479;
      }
      
      public function get petId() : int
      {
         return var_421;
      }
   }
}
