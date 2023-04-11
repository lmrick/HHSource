package package_145
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1396 implements IMessageParser
   {
       
      
      private var var_309:Boolean = false;
      
      private var var_510:int = 0;
      
      private var var_477:String;
      
      public function class_1396()
      {
         super();
      }
      
      public function isOk() : Boolean
      {
         return var_309;
      }
      
      public function getSecondsToWait() : int
      {
         return var_510;
      }
      
      public function getExtraDataId() : String
      {
         return var_477;
      }
      
      public function flush() : Boolean
      {
         var_309 = false;
         var_510 = 0;
         var_477 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_309 = param1.readBoolean();
         var_510 = param1.readInteger();
         if(var_309 && param1.bytesAvailable)
         {
            var_477 = param1.readString();
         }
         return true;
      }
   }
}
