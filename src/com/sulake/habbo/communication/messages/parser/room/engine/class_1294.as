package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_17.class_1652;
   
   [SecureSWF(rename="true")]
   public class class_1294 implements IMessageParser
   {
       
      
      private var var_45:class_1652 = null;
      
      public function class_1294()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_45 = null;
         return true;
      }
      
      public function get data() : class_1652
      {
         var _loc1_:class_1652 = var_45;
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
         var_45 = class_1538.parseObjectData(param1);
         return true;
      }
   }
}
