package package_139
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_83.class_1647;
   
   [SecureSWF(rename="true")]
   public class class_1070 implements IMessageParser
   {
       
      
      private var var_643:Array;
      
      public function class_1070()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_643 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_643.push(new class_1647(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get prizes() : Array
      {
         return var_643;
      }
   }
}
