package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_24.class_1646;
   
   [SecureSWF(rename="true")]
   public class class_1067 implements IMessageParser
   {
       
      
      private var var_1309:int;
      
      private var var_1107:Array;
      
      public function class_1067()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1107 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         this.var_1309 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         class_14.log("Received friend requests: " + var_1309 + ", " + _loc2_);
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1107.push(new class_1646(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get totalReqCount() : int
      {
         return this.var_1309;
      }
      
      public function get reqs() : Array
      {
         return this.var_1107;
      }
   }
}
