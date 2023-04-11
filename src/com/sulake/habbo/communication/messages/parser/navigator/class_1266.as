package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1266 implements IMessageParser
   {
       
      
      private var var_1355:Boolean;
      
      private var var_413:int;
      
      public function class_1266()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1355 = param1.readBoolean();
         this.var_413 = param1.readInteger();
         return true;
      }
      
      public function get canCreateEvent() : Boolean
      {
         return var_1355;
      }
      
      public function get errorCode() : int
      {
         return var_413;
      }
   }
}
