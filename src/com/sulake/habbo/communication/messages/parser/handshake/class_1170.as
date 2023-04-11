package package_133
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1170 implements IMessageParser
   {
       
      
      private var var_305:int;
      
      public function class_1170()
      {
         super();
         var_305 = -1;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1.bytesAvailable)
         {
            var_305 = param1.readInteger();
         }
         return true;
      }
      
      public function get reason() : int
      {
         return var_305;
      }
   }
}
