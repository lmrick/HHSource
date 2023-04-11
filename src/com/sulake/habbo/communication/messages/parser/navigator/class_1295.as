package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_11.class_1625;
   
   [SecureSWF(rename="true")]
   public class class_1295 implements IMessageParser
   {
       
      
      private var var_241:Array;
      
      public function class_1295()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var_241 = [];
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_241.push(new class_1625(param1));
            _loc2_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_241 = null;
         return true;
      }
      
      public function get nodes() : Array
      {
         return var_241;
      }
   }
}
