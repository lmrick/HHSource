package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_24.class_1602;
   
   [SecureSWF(rename="true")]
   public class class_1208 implements IMessageParser
   {
       
      
      private var var_1124:Array;
      
      private var _others:Array;
      
      public function class_1208()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1124 = [];
         this._others = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1124.push(new class_1602(param1));
            _loc3_++;
         }
         var _loc4_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            this._others.push(new class_1602(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get friends() : Array
      {
         return this.var_1124;
      }
      
      public function get others() : Array
      {
         return this._others;
      }
   }
}
