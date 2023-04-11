package package_164
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1175 implements IMessageParser
   {
       
      
      private var var_616:Array;
      
      public function class_1175()
      {
         super();
      }
      
      public function get badWords() : Array
      {
         return var_616;
      }
      
      public function flush() : Boolean
      {
         return false;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_616 = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_616.push(param1.readString());
            _loc3_++;
         }
         return false;
      }
   }
}
