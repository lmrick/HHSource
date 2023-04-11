package package_165
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_36.class_1634;
   
   [SecureSWF(rename="true")]
   public class class_1168 implements IMessageParser
   {
       
      
      private var var_232:Vector.<class_1634>;
      
      private var _disposed:Boolean;
      
      public function class_1168()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         if(_disposed)
         {
            return true;
         }
         _disposed = true;
         for each(var _loc1_ in var_232)
         {
            _loc1_.dispose();
         }
         var_232 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_232 = new Vector.<class_1634>();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_232.push(new class_1634(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get callForHelpCategories() : Vector.<class_1634>
      {
         return var_232;
      }
   }
}
