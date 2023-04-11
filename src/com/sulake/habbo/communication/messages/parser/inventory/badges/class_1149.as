package package_153
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1149 implements IMessageParser
   {
       
      
      private var var_45:Array;
      
      public function class_1149()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_45 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = param1.readInteger();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1.readString();
            _loc2_ = param1.readInteger();
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               var_45.push(new class_1543(_loc6_,param1));
               _loc3_++;
            }
            _loc5_++;
         }
         return true;
      }
      
      public function get data() : Array
      {
         return var_45;
      }
   }
}
