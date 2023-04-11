package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1403 implements IMessageParser
   {
       
      
      protected var var_110:class_24;
      
      public function class_1403()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         if(var_110)
         {
            var_110.dispose();
            var_110 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:String = null;
         var _loc5_:int = 0;
         var _loc4_:int = param1.readInteger();
         var_110 = new class_24();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1.readInteger();
            _loc2_ = param1.readString();
            var_110.add(_loc3_,_loc2_);
            _loc5_++;
         }
         return true;
      }
      
      public function get badges() : class_24
      {
         var _loc1_:int = 0;
         var _loc2_:class_24 = new class_24();
         _loc1_ = 0;
         while(_loc1_ < var_110.length)
         {
            _loc2_.add(var_110.getKey(_loc1_),var_110.getWithIndex(_loc1_));
            _loc1_++;
         }
         return _loc2_;
      }
   }
}
