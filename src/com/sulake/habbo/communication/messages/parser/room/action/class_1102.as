package package_141
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1102 implements IMessageParser
   {
       
      
      private var var_339:int = 0;
      
      private var var_515:int = -1;
      
      public function class_1102()
      {
         super();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get expressionType() : int
      {
         return var_515;
      }
      
      public function flush() : Boolean
      {
         var_339 = 0;
         var_515 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_339 = param1.readInteger();
         var_515 = param1.readInteger();
         return true;
      }
   }
}
