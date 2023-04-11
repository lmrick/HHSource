package package_157
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class class_1483 implements IMessageParser
   {
       
      
      private var var_512:int;
      
      private var var_312:Array;
      
      public function class_1483()
      {
         var_312 = [];
         super();
      }
      
      public function get gameTypeId() : int
      {
         return var_512;
      }
      
      public function get winners() : Array
      {
         return var_312;
      }
      
      public function flush() : Boolean
      {
         var_512 = -1;
         var_312 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_512 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_312.push(new class_1533(param1));
            _loc3_++;
         }
         return true;
      }
   }
}
