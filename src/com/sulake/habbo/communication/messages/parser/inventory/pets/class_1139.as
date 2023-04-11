package package_144
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1139 implements IMessageParser
   {
       
      
      protected var var_775:int;
      
      protected var var_960:int;
      
      private var var_149:class_24;
      
      public function class_1139()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         if(var_149)
         {
            var_149.dispose();
            var_149 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:class_1572 = null;
         var_775 = param1.readInteger();
         var_960 = param1.readInteger();
         var_149 = new class_24();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new class_1572(param1);
            var_149.add(_loc4_.id,_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function get petListFragment() : class_24
      {
         return var_149;
      }
      
      public function get totalFragments() : int
      {
         return var_775;
      }
      
      public function get fragmentNo() : int
      {
         return var_960;
      }
   }
}
