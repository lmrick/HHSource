package package_146
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1316 implements IMessageParser
   {
       
      
      private var var_441:class_24;
      
      private var var_485:int;
      
      public function class_1316()
      {
         super();
         var_441 = new class_24();
      }
      
      public function get songDisks() : class_24
      {
         return var_441;
      }
      
      public function get maxLength() : int
      {
         return var_485;
      }
      
      public function flush() : Boolean
      {
         var_441.reset();
         var_485 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_485 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc4_:int = -1;
         var _loc5_:int = -1;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            _loc5_ = param1.readInteger();
            var_441.add(_loc4_,_loc5_);
            _loc3_++;
         }
         return true;
      }
   }
}
