package package_146
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_93.class_1650;
   
   [SecureSWF(rename="true")]
   public class class_1082 implements IMessageParser
   {
       
      
      private var var_604:Array;
      
      public function class_1082()
      {
         super();
      }
      
      public function get songs() : Array
      {
         return var_604;
      }
      
      public function flush() : Boolean
      {
         var_604 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc9_:int = 0;
         var _loc4_:String = null;
         var _loc6_:String = null;
         var _loc2_:String = null;
         var _loc7_:int = 0;
         var _loc3_:String = null;
         var _loc8_:int = 0;
         var _loc10_:class_1650 = null;
         var _loc5_:int = param1.readInteger();
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc9_ = param1.readInteger();
            _loc4_ = param1.readString();
            _loc6_ = param1.readString();
            _loc2_ = param1.readString();
            _loc7_ = param1.readInteger();
            _loc3_ = param1.readString();
            _loc10_ = new class_1650(_loc9_,_loc7_,_loc6_,_loc3_,_loc2_);
            var_604.push(_loc10_);
            _loc8_++;
         }
         return true;
      }
   }
}
