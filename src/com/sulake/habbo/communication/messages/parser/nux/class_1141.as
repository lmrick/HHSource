package package_162
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_74.class_1604;
   
   [SecureSWF(rename="true")]
   public class class_1141 implements IMessageParser
   {
       
      
      private var var_621:Vector.<class_1604>;
      
      public function class_1141()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         var_621 = new Vector.<class_1604>();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_621.push(new class_1604(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get giftOptions() : Vector.<class_1604>
      {
         return var_621;
      }
   }
}
