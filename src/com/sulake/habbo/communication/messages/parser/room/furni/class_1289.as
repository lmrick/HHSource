package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1289 implements IMessageParser
   {
       
      
      private var var_713:int = 0;
      
      public function class_1289()
      {
         super();
      }
      
      public function get code() : int
      {
         return var_713;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_713 = param1.readInteger();
         return true;
      }
   }
}
