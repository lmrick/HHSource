package package_147
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1279 implements IMessageParser
   {
       
      
      private var var_628:Array;
      
      public function class_1279()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_628 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_628.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get messages() : Array
      {
         return var_628;
      }
   }
}
