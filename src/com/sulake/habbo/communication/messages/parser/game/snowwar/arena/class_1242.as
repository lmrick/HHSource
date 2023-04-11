package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1242 implements IMessageParser
   {
       
      
      private var var_817:int;
      
      private var var_639:Array;
      
      public function class_1242()
      {
         super();
      }
      
      public function get percentage() : int
      {
         return var_817;
      }
      
      public function get finishedPlayers() : Array
      {
         return var_639;
      }
      
      public function flush() : Boolean
      {
         return false;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_817 = param1.readInteger();
         var_639 = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_639.push(param1.readInteger());
            _loc3_++;
         }
         return true;
      }
   }
}
