package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_24.class_1546;
   
   [SecureSWF(rename="true")]
   public class class_1498 implements IMessageParser
   {
       
      
      private var var_1358:int;
      
      private var var_1351:int;
      
      private var var_1344:int;
      
      private var var_1298:Array;
      
      public function class_1498()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1298 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         this.var_1358 = param1.readInteger();
         this.var_1351 = param1.readInteger();
         this.var_1344 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1298.push(new class_1546(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_1358;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_1351;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_1344;
      }
      
      public function get categories() : Array
      {
         return this.var_1298;
      }
   }
}
