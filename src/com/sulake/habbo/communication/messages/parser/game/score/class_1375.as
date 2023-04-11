package package_157
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_8.class_1608;
   
   public class class_1375 implements IMessageParser
   {
       
      
      private var var_512:int;
      
      private var var_235:Array;
      
      private var var_373:int;
      
      private var var_503:Boolean;
      
      public function class_1375()
      {
         var_235 = [];
         super();
      }
      
      public function get gameTypeId() : int
      {
         return var_512;
      }
      
      public function get products() : Array
      {
         return var_235;
      }
      
      public function get minutesUntilNextWeek() : int
      {
         return var_373;
      }
      
      public function get rewardingOn() : Boolean
      {
         return var_503;
      }
      
      public function flush() : Boolean
      {
         var_512 = -1;
         var_235 = [];
         var_373 = 0;
         var_503 = true;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var_512 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_235.push(new class_1608(param1));
            _loc2_++;
         }
         var_373 = param1.readInteger();
         var_503 = param1.readBoolean();
         return true;
      }
   }
}
