package package_133
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import flash.utils.Dictionary;
   
   [SecureSWF(rename="true")]
   public class class_1063 implements IMessageParser
   {
       
      
      private var var_228:Dictionary;
      
      public function class_1063()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         if(var_228)
         {
            var_228 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_228 = new Dictionary();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_228[param1.readInteger()] = param1.readString();
            _loc3_++;
         }
         return true;
      }
      
      public function get accounts() : Dictionary
      {
         return var_228;
      }
   }
}
