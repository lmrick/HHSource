package package_155
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1464 implements IMessageParser
   {
       
      
      private var var_893:int;
      
      private var _totalAmount:int;
      
      private var var_405:int;
      
      private var _amount:int;
      
      private var _forums:Array;
      
      public function class_1464()
      {
         super();
      }
      
      public function get listCode() : int
      {
         return var_893;
      }
      
      public function get totalAmount() : int
      {
         return _totalAmount;
      }
      
      public function get startIndex() : int
      {
         return var_405;
      }
      
      public function get amount() : int
      {
         return _amount;
      }
      
      public function get forums() : Array
      {
         return _forums;
      }
      
      public function flush() : Boolean
      {
         _forums = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var_893 = param1.readInteger();
         _totalAmount = param1.readInteger();
         var_405 = param1.readInteger();
         _amount = param1.readInteger();
         _forums = [];
         _loc2_ = 0;
         while(_loc2_ < amount)
         {
            _forums.push(class_1641.readFromMessage(param1));
            _loc2_++;
         }
         return true;
      }
   }
}
