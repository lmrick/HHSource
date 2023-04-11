package package_181
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_120.class_1532;
   
   [SecureSWF(rename="true")]
   public class class_1425 implements IMessageParser
   {
       
      
      private var var_670:Array;
      
      public function class_1425()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_670 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_670.push(new class_1532(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get hotLooks() : Array
      {
         return var_670;
      }
   }
}
