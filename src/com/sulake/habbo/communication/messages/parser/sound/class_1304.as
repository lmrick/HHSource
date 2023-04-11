package package_146
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_93.class_1544;
   
   [SecureSWF(rename="true")]
   public class class_1304 implements IMessageParser
   {
       
      
      private var var_549:int;
      
      private var var_613:Array;
      
      public function class_1304()
      {
         super();
      }
      
      public function get synchronizationCount() : int
      {
         return var_549;
      }
      
      public function get playList() : Array
      {
         return var_613;
      }
      
      public function flush() : Boolean
      {
         var_549 = -1;
         var_613 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc2_:String = null;
         var_549 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc7_ = param1.readInteger();
            _loc4_ = param1.readInteger();
            _loc5_ = param1.readString();
            _loc2_ = param1.readString();
            var_613.push(new class_1544(_loc7_,_loc4_,_loc5_,_loc2_));
            _loc6_++;
         }
         return true;
      }
   }
}
