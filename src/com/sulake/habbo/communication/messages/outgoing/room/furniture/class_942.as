package package_21
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_942 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_942(param1:Boolean, param2:int, param3:Boolean)
      {
         super();
         var_45 = [param1,param2,param3];
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
