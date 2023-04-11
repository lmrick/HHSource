package package_152
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1093 implements IMessageParser
   {
       
      
      private var var_645:Array;
      
      public function class_1093()
      {
         super();
      }
      
      public function get occupiedTiles() : Array
      {
         return var_645;
      }
      
      public function flush() : Boolean
      {
         var_645 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            _loc5_ = param1.readInteger();
            var_645.push({
               "x":_loc4_,
               "y":_loc5_
            });
            _loc3_++;
         }
         return true;
      }
   }
}
