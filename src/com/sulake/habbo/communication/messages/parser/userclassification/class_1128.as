package package_159
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1128 implements IMessageParser
   {
       
      
      private var var_162:class_24;
      
      private var var_137:class_24;
      
      public function class_1128()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         if(var_162)
         {
            var_162.dispose();
            var_162 = null;
         }
         if(var_137)
         {
            var_137.dispose();
            var_137 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc6_:String = null;
         var _loc5_:String = null;
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         var_162 = new class_24();
         var_137 = new class_24();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            _loc6_ = param1.readString();
            _loc5_ = param1.readString();
            var_162.add(_loc4_,_loc6_);
            var_137.add(_loc4_,_loc5_);
            _loc3_++;
         }
         return true;
      }
      
      public function get classifiedUsernameMap() : class_24
      {
         return var_162;
      }
      
      public function get classifiedUserTypeMap() : class_24
      {
         return var_137;
      }
   }
}
