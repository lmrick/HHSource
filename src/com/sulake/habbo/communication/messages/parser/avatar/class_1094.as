package package_151
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1094 implements IMessageParser
   {
       
      
      private var var_380:int = -1;
      
      private var _name:String;
      
      private var var_301:Array;
      
      public function class_1094()
      {
         super();
      }
      
      public function get resultCode() : int
      {
         return var_380;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get nameSuggestions() : Array
      {
         return var_301;
      }
      
      public function flush() : Boolean
      {
         var_380 = -1;
         _name = "";
         var_301 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_380 = param1.readInteger();
         _name = param1.readString();
         var _loc2_:int = param1.readInteger();
         var_301 = [];
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_301.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
   }
}
