package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1187 implements IMessageParser
   {
       
      
      private var var_786:int;
      
      private var var_1223:int;
      
      public function class_1187()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_786 = param1.readInteger();
         var_1223 = param1.readInteger();
         return true;
      }
      
      public function get homeRoomId() : int
      {
         return var_786;
      }
      
      public function get roomIdToEnter() : int
      {
         return var_1223;
      }
   }
}
