package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1415 implements IMessageParser
   {
       
      
      private var var_247:int;
      
      private var var_195:int;
      
      public function class_1415()
      {
         super();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get value() : int
      {
         return var_195;
      }
      
      public function flush() : Boolean
      {
         var_247 = -1;
         var_195 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_247 = param1.readInteger();
         var_195 = param1.readInteger();
         return true;
      }
   }
}
