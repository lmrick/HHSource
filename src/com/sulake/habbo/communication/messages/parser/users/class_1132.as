package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1132 implements IMessageParser
   {
       
      
      private var _groupId:int;
      
      public function class_1132()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _groupId = param1.readInteger();
         return true;
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
   }
}
