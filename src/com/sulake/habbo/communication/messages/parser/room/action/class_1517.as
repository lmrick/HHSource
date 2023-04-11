package package_141
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1517 implements IMessageParser
   {
       
      
      private var var_339:int = 0;
      
      private var var_355:int = 0;
      
      private var var_1080:int = 0;
      
      public function class_1517()
      {
         super();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get effectId() : int
      {
         return var_355;
      }
      
      public function get delayMilliSeconds() : int
      {
         return var_1080;
      }
      
      public function flush() : Boolean
      {
         var_339 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_339 = param1.readInteger();
         var_355 = param1.readInteger();
         var_1080 = param1.readInteger();
         return true;
      }
   }
}
