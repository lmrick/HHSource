package package_88
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_998 implements IMessageComposer
   {
       
      
      private var var_1193:String;
      
      public function class_998(param1:String)
      {
         super();
         var_1193 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(var_1193);
         return _loc1_;
      }
   }
}
