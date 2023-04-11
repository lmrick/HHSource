package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1398 implements IMessageParser
   {
       
      
      protected var _ignoredUsers:Array = null;
      
      public function class_1398()
      {
         super();
         _ignoredUsers = [];
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         _ignoredUsers = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _ignoredUsers.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get ignoredUsers() : Array
      {
         return _ignoredUsers.slice();
      }
   }
}
