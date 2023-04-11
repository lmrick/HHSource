package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_432 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_432(param1:int, param2:int, param3:int, param4:int)
      {
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2);
         var_45.push(param3);
         var_45.push(param4);
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
      
      public function dispose() : void
      {
         var_45 = null;
      }
   }
}
