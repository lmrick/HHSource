package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_5.class_1174;
   
   [SecureSWF(rename="true")]
   public class class_1527 implements IMessageParser
   {
       
      
      private var _groupId:int;
      
      private var var_426:class_1174;
      
      public function class_1527()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_426 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _groupId = param1.readInteger();
         var_426 = new class_1174(param1);
         return true;
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function get requester() : class_1174
      {
         return var_426;
      }
   }
}
