package package_127
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1054 implements IMessageParser
   {
       
      
      private var var_1010:int;
      
      private var var_701:int;
      
      private var _historyLength:int;
      
      private var var_626:Array;
      
      private var var_582:Array;
      
      private var var_598:Array;
      
      private var var_1240:int;
      
      private var var_871:int;
      
      public function class_1054()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return var_1010;
      }
      
      public function get offerCount() : int
      {
         return var_701;
      }
      
      public function get historyLength() : int
      {
         return _historyLength;
      }
      
      public function get dayOffsets() : Array
      {
         return var_626;
      }
      
      public function get averagePrices() : Array
      {
         return var_582;
      }
      
      public function get soldAmounts() : Array
      {
         return var_598;
      }
      
      public function get furniTypeId() : int
      {
         return var_1240;
      }
      
      public function get furniCategoryId() : int
      {
         return var_871;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_1010 = param1.readInteger();
         var_701 = param1.readInteger();
         _historyLength = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_626 = [];
         var_582 = [];
         var_598 = [];
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_626.push(param1.readInteger());
            var_582.push(param1.readInteger());
            var_598.push(param1.readInteger());
            _loc3_++;
         }
         var_871 = param1.readInteger();
         var_1240 = param1.readInteger();
         return true;
      }
   }
}
