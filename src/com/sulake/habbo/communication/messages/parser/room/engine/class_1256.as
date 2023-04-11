package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1256 implements IMessageParser
   {
       
      
      private var var_1125:int;
      
      private var var_466:Boolean;
      
      public function class_1256()
      {
         super();
      }
      
      public function get guestRoomId() : int
      {
         return var_1125;
      }
      
      public function get owner() : Boolean
      {
         return var_466;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1125 = param1.readInteger();
         var_466 = param1.readBoolean();
         return true;
      }
   }
}
