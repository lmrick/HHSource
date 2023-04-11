package package_142
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1490 implements IMessageParser
   {
       
      
      private var var_650:Vector.<String>;
      
      public function class_1490()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_650 = new Vector.<String>(0);
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_650.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get collapsedCategories() : Vector.<String>
      {
         return var_650;
      }
   }
}
