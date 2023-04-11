package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1389 implements IMessageParser
   {
       
      
      private var var_378:int;
      
      public function class_1389()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_378 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_378 = param1.readInteger();
         return true;
      }
      
      public function get gameType() : int
      {
         return var_378;
      }
   }
}
