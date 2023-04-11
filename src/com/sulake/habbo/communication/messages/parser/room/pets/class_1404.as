package package_134
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1404 implements IMessageParser
   {
       
      
      private var var_421:int;
      
      private var var_313:Array;
      
      private var var_243:Array;
      
      public function class_1404()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get allCommands() : Array
      {
         return var_313;
      }
      
      public function get enabledCommands() : Array
      {
         return var_243;
      }
      
      public function flush() : Boolean
      {
         var_421 = -1;
         var_313 = null;
         var_243 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_421 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         var_313 = [];
         while(_loc3_-- > 0)
         {
            var_313.push(param1.readInteger());
         }
         var _loc2_:int = param1.readInteger();
         var_243 = [];
         while(_loc2_-- > 0)
         {
            var_243.push(param1.readInteger());
         }
         return true;
      }
   }
}
