package package_21
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_554 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_554(param1:int, param2:Boolean)
      {
         super();
         var_45 = [param1,param2];
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
