package package_158
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1282 implements IMessageParser
   {
       
      
      private var var_339:int;
      
      private var var_195:String;
      
      private var var_256:class_24;
      
      public function class_1282()
      {
         super();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get value() : String
      {
         return var_195;
      }
      
      public function get answerCounts() : class_24
      {
         return var_256;
      }
      
      public function flush() : Boolean
      {
         var_339 = -1;
         var_195 = "";
         var_256 = null;
         return false;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc2_:int = 0;
         var_339 = param1.readInteger();
         var_195 = param1.readString();
         var_256 = new class_24();
         var _loc5_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc4_ = param1.readString();
            _loc2_ = param1.readInteger();
            var_256.add(_loc4_,_loc2_);
            _loc3_++;
         }
         return true;
      }
   }
}
