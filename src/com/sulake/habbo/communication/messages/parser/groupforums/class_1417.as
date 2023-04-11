package package_155
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1417 implements IMessageParser
   {
       
      
      private var _groupId:int;
      
      private var var_284:int;
      
      private var var_405:int;
      
      private var _amount:int;
      
      private var var_628:Array;
      
      public function class_1417()
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
      
      public function get startIndex() : int
      {
         return var_405;
      }
      
      public function get amount() : int
      {
         return _amount;
      }
      
      public function get messages() : Array
      {
         return var_628;
      }
      
      public function flush() : Boolean
      {
         _groupId = -1;
         var_284 = -1;
         var_405 = -1;
         _amount = -1;
         var_628 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:class_1560 = null;
         _groupId = param1.readInteger();
         var_284 = param1.readInteger();
         var_405 = param1.readInteger();
         _amount = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _amount)
         {
            _loc3_ = class_1560.readFromMessage(param1);
            _loc3_.groupID = _groupId;
            _loc3_.threadId = var_284;
            var_628.push(_loc3_);
            _loc2_++;
         }
         return true;
      }
   }
}
