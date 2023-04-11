package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1557 implements class_13, class_1556
   {
       
      
      private var var_83:Array;
      
      private var _disposed:Boolean;
      
      public function class_1557(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         var_83 = [];
         super();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_83.push(new class_1549(param1));
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
         if(var_83 != null)
         {
            for each(var _loc1_ in var_83)
            {
               _loc1_.dispose();
            }
         }
         var_83 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get entries() : Array
      {
         return var_83;
      }
   }
}
