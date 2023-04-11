package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_625 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_625(param1:int, param2:class_24)
      {
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2.length * 2);
         for each(var _loc3_ in param2.getKeys())
         {
            var_45.push(_loc3_);
            var_45.push(param2.getValue(_loc3_));
         }
      }
      
      public function dispose() : void
      {
         var_45 = null;
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
   }
}
