package package_147
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import flash.utils.Dictionary;
   
   [SecureSWF(rename="true")]
   public class class_1252 implements IMessageParser
   {
       
      
      private var var_590:Dictionary;
      
      public function class_1252()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_590 = new Dictionary();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readInteger();
            _loc2_ = param1.readInteger();
            var_590[_loc5_] = _loc2_;
            _loc4_++;
         }
         return true;
      }
      
      public function get points() : Dictionary
      {
         return var_590;
      }
   }
}
