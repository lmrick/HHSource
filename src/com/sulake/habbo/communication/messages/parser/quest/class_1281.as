package package_139
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_83.class_1605;
   
   [SecureSWF(rename="true")]
   public class class_1281 implements IMessageParser
   {
       
      
      private var var_363:class_1605;
      
      private var var_1066:int;
      
      private var var_1294:int;
      
      public function class_1281()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_363 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:Boolean = param1.readBoolean();
         if(_loc2_)
         {
            var_363 = new class_1605(param1);
            var_1066 = param1.readInteger();
            var_1294 = param1.readInteger();
         }
         return true;
      }
      
      public function get quest() : class_1605
      {
         return var_363;
      }
      
      public function get easyQuestCount() : int
      {
         return var_1066;
      }
      
      public function get hardQuestCount() : int
      {
         return var_1294;
      }
   }
}
