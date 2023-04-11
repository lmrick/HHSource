package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1435 implements IMessageParser
   {
       
      
      private var var_249:Array;
      
      private var var_944:Boolean;
      
      private var var_1308:int;
      
      public function class_1435()
      {
         super();
      }
      
      public function get issues() : Array
      {
         return var_249;
      }
      
      public function get retryEnabled() : Boolean
      {
         return var_944;
      }
      
      public function get retryCount() : int
      {
         return var_1308;
      }
      
      public function flush() : Boolean
      {
         var_249 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc7_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc5_:String = null;
         var _loc4_:class_1612 = null;
         var_249 = [];
         var _loc6_:int = param1.readInteger();
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = param1.readInteger();
            _loc2_ = param1.readInteger();
            _loc5_ = param1.readString();
            _loc4_ = new class_1612(_loc3_,0,0,0,0,0,0,0,null,0,null,_loc2_,_loc5_,null,0,[]);
            var_249.push(_loc4_);
            _loc7_++;
         }
         var_944 = param1.readBoolean();
         var_1308 = param1.readInteger();
         return true;
      }
   }
}
