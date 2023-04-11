package package_27
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_293 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_293(param1:int)
      {
         super();
         var_45 = [param1];
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
