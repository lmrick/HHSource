package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_699 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_699(param1:int, param2:int)
      {
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2);
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
