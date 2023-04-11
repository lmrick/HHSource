package package_8
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1547
   {
       
      
      private var var_622:Array;
      
      private var var_585:Array;
      
      public function class_1547(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         super();
         var_622 = [];
         var_585 = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_622.push(param1.readString());
            _loc3_++;
         }
         var _loc4_:int = param1.readInteger();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            var_585.push(param1.readString());
            _loc5_++;
         }
      }
      
      public function get images() : Array
      {
         return var_622;
      }
      
      public function get texts() : Array
      {
         return var_585;
      }
   }
}
