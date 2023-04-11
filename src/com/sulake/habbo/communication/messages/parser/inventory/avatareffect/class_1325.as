package package_131
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_61.class_1581;
   
   [SecureSWF(rename="true")]
   public class class_1325 implements IMessageParser
   {
       
      
      private var var_274:Array;
      
      public function class_1325()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_274 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:class_1581 = null;
         var_274 = [];
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = new class_1581();
            _loc2_.type = param1.readInteger();
            _loc2_.subType = param1.readInteger();
            _loc2_.duration = param1.readInteger();
            _loc2_.inactiveEffectsInInventory = param1.readInteger();
            _loc2_.secondsLeftIfActive = param1.readInteger();
            _loc2_.isPermanent = param1.readBoolean();
            var_274.push(_loc2_);
            _loc4_++;
         }
         return true;
      }
      
      public function get effects() : Array
      {
         return var_274;
      }
   }
}
