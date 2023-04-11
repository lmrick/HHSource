package package_153
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1108 implements IMessageParser
   {
       
      
      protected var var_775:int;
      
      protected var var_960:int;
      
      private var var_164:class_24;
      
      public function class_1108()
      {
         super();
      }
      
      public function get totalFragments() : int
      {
         return var_775;
      }
      
      public function get fragmentNo() : int
      {
         return var_960;
      }
      
      public function get currentFragment() : class_24
      {
         return var_164;
      }
      
      public function flush() : Boolean
      {
         if(var_164)
         {
            var_164.dispose();
            var_164 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var_775 = param1.readInteger();
         var_960 = param1.readInteger();
         var_164 = new class_24();
         var _loc5_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc2_ = param1.readInteger();
            _loc3_ = param1.readString();
            var_164.add(_loc3_,_loc2_);
            _loc4_++;
         }
         return true;
      }
   }
}
