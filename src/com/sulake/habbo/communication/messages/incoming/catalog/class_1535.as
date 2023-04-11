package package_8
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1535
   {
       
      
      private var var_769:int;
      
      private var var_1001:int;
      
      private var var_1235:int;
      
      private var var_1333:int;
      
      private var var_641:Array;
      
      public function class_1535(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         super();
         var_769 = param1.readInteger();
         var_1001 = param1.readInteger();
         var_1235 = param1.readInteger();
         var_1333 = param1.readInteger();
         var_641 = [];
         var _loc2_:int = param1.readInteger();
         while(_loc3_ < _loc2_)
         {
            var_641.push(param1.readInteger());
            _loc3_++;
         }
      }
      
      public function get maxPurchaseSize() : int
      {
         return var_769;
      }
      
      public function get bundleSize() : int
      {
         return var_1001;
      }
      
      public function get bundleDiscountSize() : int
      {
         return var_1235;
      }
      
      public function get bonusThreshold() : int
      {
         return var_1333;
      }
      
      public function get additionalBonusDiscountThresholdQuantities() : Array
      {
         return var_641;
      }
   }
}
