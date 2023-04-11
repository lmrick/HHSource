package package_147
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1412 implements IMessageParser
   {
       
      
      private var var_271:String;
      
      private var _parameters:class_24;
      
      public function class_1412()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_271 = null;
         _parameters = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc5_:String = null;
         var _loc4_:String = null;
         var_271 = param1.readString();
         _parameters = new class_24();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = param1.readString();
            _loc4_ = param1.readString();
            _parameters.add(_loc5_,_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get parameters() : class_24
      {
         return _parameters;
      }
   }
}
