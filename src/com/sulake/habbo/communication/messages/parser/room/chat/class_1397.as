package package_164
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1397 implements IMessageParser
   {
       
      
      private var var_339:int = 0;
      
      private var var_418:Boolean = false;
      
      public function class_1397()
      {
         super();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get isTyping() : Boolean
      {
         return var_418;
      }
      
      public function flush() : Boolean
      {
         var_339 = 0;
         var_418 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_339 = param1.readInteger();
         var_418 = param1.readInteger() == 1;
         return true;
      }
   }
}
