package package_171
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1353 implements IMessageParser
   {
       
      
      private var var_341:int;
      
      private var var_610:Array;
      
      public function class_1353()
      {
         super();
      }
      
      public function get skillList() : Array
      {
         return var_610;
      }
      
      public function get botId() : int
      {
         return var_341;
      }
      
      public function flush() : Boolean
      {
         var_341 = -1;
         var_610 = new Array(0);
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_341 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_610.push(new class_1626(param1));
            _loc3_++;
         }
         return true;
      }
   }
}
