package package_155
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1348 implements IMessageParser
   {
       
      
      private var _groupId:int;
      
      private var var_405:int;
      
      private var _amount:int;
      
      private var var_676:Array;
      
      public function class_1348()
      {
         super();
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function get startIndex() : int
      {
         return var_405;
      }
      
      public function get amount() : int
      {
         return _amount;
      }
      
      public function get threads() : Array
      {
         return var_676;
      }
      
      public function flush() : Boolean
      {
         _groupId = -1;
         var_405 = -1;
         _amount = -1;
         var_676 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         _groupId = param1.readInteger();
         var_405 = param1.readInteger();
         _amount = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < amount)
         {
            var_676.push(class_1629.readFromMessage(param1));
            _loc2_++;
         }
         return true;
      }
   }
}
