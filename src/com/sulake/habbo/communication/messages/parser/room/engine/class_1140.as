package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1140 implements IMessageParser
   {
       
      
      private var var_399:int = 0;
      
      private var var_1228:int = -1;
      
      public function class_1140()
      {
         super();
      }
      
      public function get itemId() : int
      {
         return var_399;
      }
      
      public function get pickerId() : int
      {
         return var_1228;
      }
      
      public function flush() : Boolean
      {
         var_399 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_399 = int(param1.readString());
         var_1228 = param1.readInteger();
         return true;
      }
   }
}
