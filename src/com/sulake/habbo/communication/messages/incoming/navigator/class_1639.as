package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1639 implements class_13, class_1556
   {
       
      
      private var var_374:class_24;
      
      private var var_564:class_24;
      
      private var _disposed:Boolean;
      
      public function class_1639(param1:IMessageDataWrapper)
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var_374 = new class_24();
         var_564 = new class_24();
         super();
         var _loc4_:int = param1.readInteger();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1.readInteger();
            _loc3_ = param1.readInteger();
            _loc2_ = param1.readInteger();
            var_374.add(_loc6_,_loc3_);
            var_564.add(_loc6_,_loc2_);
            _loc5_++;
         }
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_374 = null;
         this.var_564 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryToCurrentUserCountMap() : class_24
      {
         return var_374;
      }
      
      public function get categoryToMaxUserCountMap() : class_24
      {
         return var_564;
      }
   }
}
