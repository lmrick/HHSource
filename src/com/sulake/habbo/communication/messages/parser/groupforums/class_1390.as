package package_155
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1390 implements IMessageParser
   {
       
      
      private var _groupId:int;
      
      private var var_377:package_155.class_1629;
      
      public function class_1390()
      {
         super();
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function get thread() : package_155.class_1629
      {
         return var_377;
      }
      
      public function flush() : Boolean
      {
         _groupId = -1;
         var_377 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _groupId = param1.readInteger();
         var_377 = package_155.class_1629.readFromMessage(param1);
         return true;
      }
   }
}
