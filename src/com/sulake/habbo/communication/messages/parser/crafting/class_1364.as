package package_148
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1364 implements IMessageParser
   {
       
      
      private var var_316:Vector.<package_148.class_1536>;
      
      public function class_1364()
      {
         var_316 = new Vector.<package_148.class_1536>(0);
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_316.push(new package_148.class_1536(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_316 = new Vector.<package_148.class_1536>(0);
         return true;
      }
      
      public function get ingredients() : Vector.<package_148.class_1536>
      {
         return var_316;
      }
   }
}
