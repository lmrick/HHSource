package package_151
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_44.class_1607;
   
   [SecureSWF(rename="true")]
   public class class_1360 implements IMessageParser
   {
       
      
      private var var_159:int;
      
      private var var_594:Array;
      
      public function class_1360()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_159 = 0;
         var_594 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:class_1607 = null;
         var_159 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = new class_1607(param1);
            var_594.push(_loc2_);
            _loc4_++;
         }
         return true;
      }
      
      public function get outfits() : Array
      {
         return var_594;
      }
      
      public function get state() : int
      {
         return var_159;
      }
   }
}
