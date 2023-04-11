package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_5.class_1633;
   
   [SecureSWF(rename="true")]
   public class class_1157 implements IMessageParser
   {
       
      
      private var var_292:Array;
      
      public function class_1157()
      {
         var_292 = [];
         super();
      }
      
      public function flush() : Boolean
      {
         var_292 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_292.push(new class_1633(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get guilds() : Array
      {
         return var_292;
      }
   }
}
