package package_145
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1339 implements IMessageParser
   {
       
      
      private var var_309:Boolean = true;
      
      private var var_368:Boolean = false;
      
      public function class_1339()
      {
         super();
      }
      
      public function isOk() : Boolean
      {
         return var_309;
      }
      
      public function isRenderLimitHit() : Boolean
      {
         return var_368;
      }
      
      public function flush() : Boolean
      {
         var_309 = true;
         var_368 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1.bytesAvailable)
         {
            var_309 = param1.readBoolean();
            var_368 = param1.readBoolean();
         }
         return true;
      }
   }
}
