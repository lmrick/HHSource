package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1275 implements IMessageParser
   {
       
      
      private var var_343:String = "";
      
      private var var_299:Array;
      
      public function class_1275()
      {
         var_299 = [];
         super();
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get sellablePalettes() : Array
      {
         return var_299.slice();
      }
      
      public function flush() : Boolean
      {
         var_343 = "";
         var_299 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_343 = param1.readString();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_299.push(new class_1578(param1));
            _loc3_++;
         }
         return true;
      }
   }
}
