package package_155
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1523 implements IMessageParser
   {
       
      
      private var _groupId:int;
      
      private var var_284:int;
      
      private var var_357:package_155.class_1560;
      
      public function class_1523()
      {
         super();
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function get threadId() : int
      {
         return var_284;
      }
      
      public function get message() : package_155.class_1560
      {
         return var_357;
      }
      
      public function flush() : Boolean
      {
         _groupId = -1;
         var_284 = -1;
         var_357 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _groupId = param1.readInteger();
         var_284 = param1.readInteger();
         var_357 = package_155.class_1560.readFromMessage(param1);
         return true;
      }
   }
}
