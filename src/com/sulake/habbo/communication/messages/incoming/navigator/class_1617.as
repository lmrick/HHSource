package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1617 implements class_13, class_1556
   {
       
      
      private var var_239:Array;
      
      private var _disposed:Boolean;
      
      public function class_1617(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         var_239 = [];
         super();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_239.push(new class_1653(param1));
            _loc3_++;
         }
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_239 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get tags() : Array
      {
         return var_239;
      }
   }
}
