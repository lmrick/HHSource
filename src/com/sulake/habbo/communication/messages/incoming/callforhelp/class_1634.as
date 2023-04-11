package package_36
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   import package_50.class_1631;
   
   [SecureSWF(rename="true")]
   public class class_1634 implements class_1631, class_13
   {
       
      
      private var _name:String;
      
      private var var_314:Vector.<package_36.class_1671>;
      
      private var _disposed:Boolean;
      
      public function class_1634(param1:IMessageDataWrapper)
      {
         var _loc2_:int = 0;
         super();
         var_314 = new Vector.<package_36.class_1671>();
         _name = param1.readString();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_314.push(new package_36.class_1671(param1));
            _loc2_++;
         }
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_314 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get topics() : Vector.<package_36.class_1671>
      {
         return var_314;
      }
   }
}
