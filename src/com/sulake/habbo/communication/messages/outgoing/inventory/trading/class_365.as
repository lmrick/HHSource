package package_90
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_365 implements IMessageComposer
   {
       
      
      private var var_20:Array;
      
      public function class_365(param1:Vector.<int>)
      {
         var_20 = [];
         super();
         var_20.push(param1.length);
         for each(var _loc2_ in param1)
         {
            var_20.push(_loc2_);
         }
      }
      
      public function getMessageArray() : Array
      {
         return var_20;
      }
      
      public function dispose() : void
      {
      }
   }
}
