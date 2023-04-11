package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1504 implements IMessageParser
   {
       
      
      private var var_708:int;
      
      private var _groupId:int;
      
      public function class_1504()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_708 = param1.readInteger();
         _groupId = param1.readInteger();
         return true;
      }
      
      public function get baseRoomId() : int
      {
         return var_708;
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
   }
}
