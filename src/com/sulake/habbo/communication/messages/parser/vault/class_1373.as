package package_167
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1373 implements IMessageParser
   {
       
      
      private var var_518:Boolean;
      
      private var var_545:int;
      
      private var var_428:int;
      
      public function class_1373()
      {
         super();
      }
      
      public function get isUnlocked() : Boolean
      {
         return var_518;
      }
      
      public function get totalBalance() : int
      {
         return var_545;
      }
      
      public function get withdrawBalance() : int
      {
         return var_428;
      }
      
      public function flush() : Boolean
      {
         var_518 = false;
         var_545 = 0;
         var_428 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_518 = param1.readBoolean();
         var_545 = param1.readInteger();
         var_428 = param1.readInteger();
         return true;
      }
   }
}
