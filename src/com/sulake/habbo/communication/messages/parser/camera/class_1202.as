package package_145
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1202 implements IMessageParser
   {
       
      
      private var var_574:int = 0;
      
      private var var_419:int = 0;
      
      private var var_542:int = 0;
      
      public function class_1202()
      {
         super();
      }
      
      public function getCreditPrice() : int
      {
         return var_574;
      }
      
      public function getDucketPrice() : int
      {
         return var_419;
      }
      
      public function getPublishDucketPrice() : int
      {
         return var_542;
      }
      
      public function flush() : Boolean
      {
         var_574 = 0;
         var_419 = 0;
         var_542 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_574 = param1.readInteger();
         var_419 = param1.readInteger();
         if(param1.bytesAvailable > 0)
         {
            var_542 = param1.readInteger();
         }
         return true;
      }
   }
}
