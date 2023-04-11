package package_79
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1593 extends class_1554
   {
       
      
      private var var_271:int;
      
      private var var_1187:int;
      
      private var var_646:Array;
      
      public function class_1593(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         var_646 = [];
         super(param1);
         var_271 = param1.readInteger();
         var_1187 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_646.push(param1.readInteger());
            _loc3_++;
         }
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      override public function get code() : int
      {
         return var_271;
      }
      
      public function get delayInPulses() : int
      {
         return var_1187;
      }
      
      public function get conflictingTriggers() : Array
      {
         return var_646;
      }
   }
}
