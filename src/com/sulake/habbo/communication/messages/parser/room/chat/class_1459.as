package package_164
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1459 implements IMessageParser
   {
       
      
      private var var_556:int = 0;
      
      public function class_1459()
      {
         super();
      }
      
      public function get seconds() : int
      {
         return var_556;
      }
      
      public function flush() : Boolean
      {
         var_556 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_556 = param1.readInteger();
         return true;
      }
   }
}
