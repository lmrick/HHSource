package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   import package_5.class_1645;
   
   [SecureSWF(rename="true")]
   public class class_1166 implements IMessageParser
   {
       
      
      private var var_339:int;
      
      private var var_165:class_24;
      
      public function class_1166()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         if(var_165)
         {
            var_165.dispose();
            var_165 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:class_1645 = null;
         var_339 = param1.readInteger();
         var_165 = new class_24();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new class_1645(param1);
            var_165.add(_loc4_.relationshipStatusType,_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get relationshipStatusMap() : class_24
      {
         return var_165;
      }
   }
}
