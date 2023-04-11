package package_79
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1592 extends class_1554
   {
       
      
      private var var_661:int;
      
      private var var_620:Array;
      
      public function class_1592(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         var_620 = [];
         super(param1);
         var_661 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_620.push(param1.readInteger());
            _loc3_++;
         }
      }
      
      public function get triggerConf() : int
      {
         return var_661;
      }
      
      override public function get code() : int
      {
         return var_661;
      }
      
      public function get conflictingActions() : Array
      {
         return var_620;
      }
   }
}
