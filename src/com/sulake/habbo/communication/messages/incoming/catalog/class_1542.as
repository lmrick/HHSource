package package_8
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1542 extends class_1541
   {
       
      
      private var var_617:int;
      
      private var var_916:int;
      
      private var var_1102:int;
      
      private var var_1156:int;
      
      public function class_1542(param1:IMessageDataWrapper)
      {
         super(param1);
         var_617 = param1.readInteger();
         var_916 = param1.readInteger();
         var_1102 = param1.readInteger();
         var_1156 = param1.readInteger();
      }
      
      public function get originalPrice() : int
      {
         return var_617 * months;
      }
      
      public function get originalActivityPointPrice() : int
      {
         return var_916 * months;
      }
      
      public function get originalActivityPointType() : int
      {
         return var_1102;
      }
      
      public function get discountCreditAmount() : int
      {
         return var_617 * months - this.priceCredits;
      }
      
      public function get discountActivityPointAmount() : int
      {
         return originalActivityPointPrice * months - this.priceActivityPoints;
      }
      
      public function get subscriptionDaysLeft() : int
      {
         return var_1156;
      }
   }
}
