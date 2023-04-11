package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_11.class_1551;
   
   [SecureSWF(rename="true")]
   public class class_1061 implements IMessageParser
   {
       
      
      private var var_293:Array;
      
      public function class_1061()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var_293 = [];
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_293.push(new class_1551(param1));
            _loc2_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_293 = null;
         return true;
      }
      
      public function get eventCategories() : Array
      {
         return var_293;
      }
   }
}
