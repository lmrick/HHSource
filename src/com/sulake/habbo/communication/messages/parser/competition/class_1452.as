package package_129
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1452 implements IMessageParser
   {
       
      
      private var var_429:int;
      
      private var var_822:String;
      
      private var var_380:int;
      
      private var var_1113:int;
      
      public function class_1452()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_429 = param1.readInteger();
         var_822 = param1.readString();
         var_380 = param1.readInteger();
         var_1113 = param1.readInteger();
         return true;
      }
      
      public function get goalId() : int
      {
         return var_429;
      }
      
      public function get goalCode() : String
      {
         return var_822;
      }
      
      public function get isVotingAllowedForUser() : Boolean
      {
         return var_380 == 0;
      }
      
      public function get votesRemaining() : int
      {
         return var_1113;
      }
      
      public function get resultCode() : int
      {
         return var_380;
      }
   }
}
