package package_142
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_18.class_1597;
   
   [SecureSWF(rename="true")]
   public class class_1185 implements IMessageParser
   {
       
      
      private var var_644:Vector.<class_1597>;
      
      public function class_1185()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_644 = new Vector.<class_1597>(0);
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_644.push(new class_1597(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get savedSearches() : Vector.<class_1597>
      {
         return var_644;
      }
   }
}
