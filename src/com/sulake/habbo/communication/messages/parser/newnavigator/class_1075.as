package package_142
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_18.class_1651;
   
   [SecureSWF(rename="true")]
   public class class_1075 implements IMessageParser
   {
       
      
      private var var_662:Vector.<class_1651>;
      
      public function class_1075()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_662 = new Vector.<class_1651>(0);
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_662.push(new class_1651(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get topLevelContexts() : Vector.<class_1651>
      {
         return var_662;
      }
   }
}
