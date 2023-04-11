package package_127
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1355 implements IMessageParser
   {
       
      
      private var var_787:Boolean;
      
      private var _commission:int;
      
      private var var_1318:int;
      
      private var var_592:int;
      
      private var _offerMaxPrice:int;
      
      private var _offerMinPrice:int;
      
      private var _expirationHours:int;
      
      private var var_1092:int;
      
      private var var_1181:int;
      
      private var var_777:int;
      
      private var var_989:int;
      
      public function class_1355()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return var_787;
      }
      
      public function get commission() : int
      {
         return _commission;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1318;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_592;
      }
      
      public function get offerMinPrice() : int
      {
         return _offerMinPrice;
      }
      
      public function get offerMaxPrice() : int
      {
         return _offerMaxPrice;
      }
      
      public function get expirationHours() : int
      {
         return _expirationHours;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1092;
      }
      
      public function get tokensBatchSize() : int
      {
         return var_592;
      }
      
      public function get sellingFeePercentage() : int
      {
         return var_1181;
      }
      
      public function get revenueLimit() : int
      {
         return var_777;
      }
      
      public function get halfTaxLimit() : int
      {
         return var_989;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_787 = param1.readBoolean();
         _commission = param1.readInteger();
         var_1318 = param1.readInteger();
         var_592 = param1.readInteger();
         _offerMinPrice = param1.readInteger();
         _offerMaxPrice = param1.readInteger();
         _expirationHours = param1.readInteger();
         var_1092 = param1.readInteger();
         var_1181 = param1.readInteger();
         var_777 = param1.readInteger();
         var_989 = param1.readInteger();
         return true;
      }
   }
}
