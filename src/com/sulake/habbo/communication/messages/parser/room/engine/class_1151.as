package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1151 implements IMessageParser
   {
       
      
      private var var_247:int = 0;
      
      public function class_1151()
      {
         super();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function flush() : Boolean
      {
         var_247 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_247 = int(param1.readString());
         return true;
      }
   }
}
