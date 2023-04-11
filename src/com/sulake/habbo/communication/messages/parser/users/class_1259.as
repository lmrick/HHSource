package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1259 implements IMessageParser
   {
       
      
      private var var_339:int;
      
      private var var_110:Array;
      
      public function class_1259()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_339 = -1;
         var_110 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var_339 = param1.readInteger();
         var _loc4_:int = param1.readInteger();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = param1.readInteger();
            _loc3_ = param1.readString();
            var_110.push(_loc3_);
            _loc5_++;
         }
         return true;
      }
      
      public function get badges() : Array
      {
         return var_110;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
   }
}
