package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1062 implements IMessageParser
   {
       
      
      private var var_561:int = -1;
      
      private var var_570:int = 0;
      
      public function class_1062()
      {
         super();
      }
      
      public function get giverUserId() : int
      {
         return var_561;
      }
      
      public function get handItemType() : int
      {
         return var_570;
      }
      
      public function flush() : Boolean
      {
         var_561 = -1;
         var_570 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_561 = param1.readInteger();
         var_570 = param1.readInteger();
         return true;
      }
   }
}
