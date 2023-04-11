package package_166
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_55.class_1598;
   
   [SecureSWF(rename="true")]
   public class class_1399 implements IMessageParser
   {
       
      
      protected var var_252:Vector.<class_1598>;
      
      public function class_1399()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_252 = new Vector.<class_1598>(0);
         _loc3_ = 0;
         while(_loc3_ < 1)
         {
            var_252.push(new class_1598(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_252 = null;
         return true;
      }
      
      public function getFurni() : Vector.<class_1598>
      {
         return var_252;
      }
   }
}
