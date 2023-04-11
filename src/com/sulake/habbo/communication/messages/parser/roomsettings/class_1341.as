package package_126
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_78.class_1636;
   
   [SecureSWF(rename="true")]
   public class class_1341 implements IMessageParser
   {
       
      
      private var var_354:int;
      
      private var var_597:Array;
      
      public function class_1341()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_597 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_354 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_597.push(new class_1636(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get bannedUsers() : Array
      {
         return var_597;
      }
   }
}
