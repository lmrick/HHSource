package package_134
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_41.class_1534;
   
   [SecureSWF(rename="true")]
   public class class_1065 implements IMessageParser
   {
       
      
      private var var_963:class_1534;
      
      private var var_1225:class_1534;
      
      public function class_1065()
      {
         super();
      }
      
      public function get resultData() : class_1534
      {
         return var_963;
      }
      
      public function get otherResultData() : class_1534
      {
         return var_1225;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      private function parseResultData(param1:IMessageDataWrapper) : class_1534
      {
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         var _loc4_:String = param1.readString();
         var _loc7_:int = param1.readInteger();
         var _loc6_:String = param1.readString();
         var _loc5_:int = param1.readInteger();
         var _loc8_:Boolean = param1.readBoolean();
         return new class_1534(_loc2_,_loc3_,_loc4_,_loc7_,_loc6_,_loc5_,_loc8_);
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_963 = parseResultData(param1);
         var_1225 = parseResultData(param1);
         return true;
      }
   }
}
