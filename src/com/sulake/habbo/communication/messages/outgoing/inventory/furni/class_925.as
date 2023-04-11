package package_70
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_925 implements IMessageComposer
   {
       
      
      private var var_1201:int = 0;
      
      public function class_925(param1:int)
      {
         super();
         var_1201 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(var_1201);
         return _loc1_;
      }
   }
}
