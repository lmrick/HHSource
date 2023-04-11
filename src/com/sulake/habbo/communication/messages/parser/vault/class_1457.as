package package_167
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1457 implements IMessageParser
   {
       
      
      private var var_45:Array;
      
      public function class_1457()
      {
         var_45 = [];
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_45.push(new class_1603(param1.readByte(),param1.readByte(),param1.readInteger(),param1.readString()));
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_45 = [];
         return true;
      }
      
      public function get data() : Array
      {
         return var_45;
      }
      
      public function set data(param1:Array) : void
      {
         var_45 = param1;
      }
   }
}
