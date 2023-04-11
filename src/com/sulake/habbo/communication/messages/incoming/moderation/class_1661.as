package package_50
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1661
   {
       
      
      private var var_354:int;
      
      private var _roomName:String;
      
      private var var_767:int;
      
      private var var_1197:int;
      
      public function class_1661(param1:IMessageDataWrapper)
      {
         super();
         var_354 = param1.readInteger();
         _roomName = param1.readString();
         var_767 = param1.readInteger();
         var_1197 = param1.readInteger();
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get roomName() : String
      {
         return _roomName;
      }
      
      public function get enterHour() : int
      {
         return var_767;
      }
      
      public function get enterMinute() : int
      {
         return var_1197;
      }
   }
}
