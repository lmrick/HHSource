package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1068 implements IMessageParser
   {
       
      
      private var var_354:int;
      
      private var _roomName:String;
      
      private var var_451:int;
      
      public function class_1068()
      {
         super();
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get roomName() : String
      {
         return _roomName;
      }
      
      public function get messageCount() : int
      {
         return var_451;
      }
      
      public function flush() : Boolean
      {
         var_354 = -1;
         _roomName = "";
         var_451 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_354 = param1.readInteger();
         _roomName = param1.readString();
         var_451 = param1.readInteger();
         return true;
      }
   }
}
