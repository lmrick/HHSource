package package_139
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_83.class_1605;
   
   [SecureSWF(rename="true")]
   public class class_1186 implements IMessageParser
   {
       
      
      private var var_614:Array;
      
      private var var_1326:Boolean;
      
      public function class_1186()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_614 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_614.push(new class_1605(param1));
            _loc3_++;
         }
         var_1326 = param1.readBoolean();
         return true;
      }
      
      public function get quests() : Array
      {
         return var_614;
      }
      
      public function get openWindow() : Boolean
      {
         return var_1326;
      }
   }
}
