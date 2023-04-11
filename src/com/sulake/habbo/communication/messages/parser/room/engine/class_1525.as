package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_17.class_1600;
   
   [SecureSWF(rename="true")]
   public class class_1525 implements IMessageParser
   {
       
      
      private var var_302:class_1600 = null;
      
      public function class_1525()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_302 = null;
         return true;
      }
      
      public function get data() : class_1600
      {
         var _loc1_:class_1600 = var_302;
         if(_loc1_ != null)
         {
            _loc1_.setReadOnly();
         }
         return _loc1_;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_302 = class_1638.parseItemData(param1);
         var_302.ownerName = param1.readString();
         return true;
      }
   }
}
