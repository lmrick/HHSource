package package_41
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1596
   {
       
      
      private var var_454:int;
      
      private var var_270:Array;
      
      public function class_1596(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         super();
         var_454 = param1.readInteger();
         var_270 = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_270.push(param1.readInteger());
            _loc3_++;
         }
      }
      
      public function dispose() : void
      {
         var_454 = -1;
         var_270 = [];
      }
      
      public function get chance() : int
      {
         return var_454;
      }
      
      public function get breeds() : Array
      {
         return var_270;
      }
   }
}
