package package_176
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_101.class_1614;
   
   [SecureSWF(rename="true")]
   public class class_1428 implements IMessageParser
   {
       
      
      private var var_246:Array;
      
      private var var_879:String;
      
      public function class_1428()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_246 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_246 = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_246.push(new class_1614(param1));
            _loc3_++;
         }
         var_879 = param1.readString();
         return true;
      }
      
      public function get achievements() : Array
      {
         return var_246;
      }
      
      public function get defaultCategory() : String
      {
         return var_879;
      }
   }
}
