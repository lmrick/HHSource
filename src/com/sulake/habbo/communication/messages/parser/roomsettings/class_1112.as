package package_126
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_78.class_1624;
   
   [SecureSWF(rename="true")]
   public class class_1112 implements IMessageParser
   {
       
      
      private var var_354:int;
      
      private var var_665:Array;
      
      public function class_1112()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var_354 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_665.push(new class_1624(param1));
            _loc2_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_665 = [];
         return true;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get controllers() : Array
      {
         return var_665;
      }
   }
}
