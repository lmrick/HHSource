package package_43
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_188 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_188(param1:Vector.<class_1156>)
      {
         var_20 = [];
         super();
         var_20.push(param1.length * 3);
         for each(var _loc2_ in param1)
         {
            var_20.push(_loc2_.dayIndex);
            var_20.push(_loc2_.stepIndex);
            var_20.push(_loc2_.giftIndex);
         }
      }
      
      public function getMessageArray() : Array
      {
         return this.var_20;
      }
      
      public function dispose() : void
      {
         this.var_20 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
