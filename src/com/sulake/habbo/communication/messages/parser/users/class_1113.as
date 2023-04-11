package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1113 implements IMessageParser
   {
       
      
      private var var_445:int;
      
      private var var_305:int;
      
      public function class_1113()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_445 = param1.readInteger();
         var_305 = param1.readInteger();
         return true;
      }
      
      public function get guildId() : int
      {
         return var_445;
      }
      
      public function get reason() : int
      {
         return var_305;
      }
   }
}
