package package_48
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_947 implements IMessageComposer
   {
       
      
      private var var_271:int;
      
      public function class_947(param1:int)
      {
         super();
         var_271 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(var_271);
         return _loc1_;
      }
   }
}
