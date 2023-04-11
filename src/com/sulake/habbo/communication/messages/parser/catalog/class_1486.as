package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   import package_8.class_1409;
   import package_8.class_1539;
   
   [SecureSWF(rename="true")]
   public class class_1486 implements IMessageParser
   {
       
      
      private var var_919:int;
      
      private var var_1146:int;
      
      private var _offers:Array;
      
      private var var_175:class_24;
      
      public function class_1486()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         if(var_175)
         {
            var_175.dispose();
            var_175 = null;
         }
         _offers = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:class_1539 = null;
         var_919 = param1.readInteger();
         var_1146 = param1.readInteger();
         _offers = [];
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _offers.push(new class_1409(param1));
            _loc4_++;
         }
         var_175 = new class_24();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = new class_1539(param1);
            var_175.add(_loc2_.offerId,_loc2_);
            _loc4_++;
         }
         return true;
      }
      
      public function get daysUntilNextGift() : int
      {
         return var_919;
      }
      
      public function get giftsAvailable() : int
      {
         return var_1146;
      }
      
      public function get offers() : Array
      {
         return _offers;
      }
      
      public function get giftData() : class_24
      {
         return var_175;
      }
   }
}
