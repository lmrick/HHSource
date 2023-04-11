package package_134
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1480 implements IMessageParser
   {
       
      
      private var var_413:int;
      
      public function class_1480()
      {
         super();
      }
      
      public function get errorCode() : int
      {
         return var_413;
      }
      
      public function flush() : Boolean
      {
         var_413 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_413 = param1.readInteger();
         return true;
      }
   }
}
