package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_8.class_1541;
   
   [SecureSWF(rename="true")]
   public class class_1384 implements IMessageParser
   {
       
      
      private var _offers:Array;
      
      private var var_680:int;
      
      public function class_1384()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _offers = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         _offers = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _offers.push(new class_1541(param1));
            _loc3_++;
         }
         var_680 = param1.readInteger();
         return true;
      }
      
      public function get offers() : Array
      {
         return _offers;
      }
      
      public function get source() : int
      {
         return var_680;
      }
   }
}
