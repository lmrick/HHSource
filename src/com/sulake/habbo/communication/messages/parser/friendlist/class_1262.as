package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_24.class_1566;
   
   [SecureSWF(rename="true")]
   public class class_1262 implements IMessageParser
   {
       
      
      private var var_1224:Array;
      
      public function class_1262()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1224 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1224.push(new class_1566(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get failures() : Array
      {
         return this.var_1224;
      }
   }
}
