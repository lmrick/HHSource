package package_150
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1516 implements IMessageParser
   {
       
      
      private var _flatId:int = 0;
      
      private var var_225:class_24;
      
      private var var_699:int = 0;
      
      public function class_1516()
      {
         var_225 = new class_24();
         super();
      }
      
      public function get flatId() : int
      {
         return _flatId;
      }
      
      public function get activeTarget() : int
      {
         return var_699;
      }
      
      public function flush() : Boolean
      {
         var_225.reset();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc6_:class_1530 = null;
         var _loc7_:int = 0;
         var _loc2_:String = null;
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var_225.reset();
         _flatId = param1.readInteger();
         var _loc4_:int = param1.readInteger();
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc2_ = param1.readString();
            _loc5_ = param1.readInteger();
            if(_loc7_ == 0)
            {
               var_699 = _loc5_;
            }
            _loc6_ = new class_1530(_loc2_,_loc5_);
            _loc3_ = param1.readInteger();
            _loc8_ = 0;
            while(_loc8_ < _loc3_)
            {
               _loc6_.addQueue(param1.readString(),param1.readInteger());
               _loc8_++;
            }
            var_225.add(_loc6_.target,_loc6_);
            _loc7_++;
         }
         return true;
      }
      
      public function getQueueSetTargets() : Array
      {
         return var_225.getKeys();
      }
      
      public function getQueueSet(param1:int) : class_1530
      {
         return var_225.getValue(param1) as class_1530;
      }
   }
}
