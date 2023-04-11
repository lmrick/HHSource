package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_8.class_1608;
   
   [SecureSWF(rename="true")]
   public class class_1442 implements IMessageParser
   {
       
      
      private var var_343:String;
      
      private var var_235:Array;
      
      public function class_1442()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_235 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_235 = [];
         var_343 = param1.readString();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_235.push(new class_1608(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get products() : Array
      {
         return var_235;
      }
   }
}
