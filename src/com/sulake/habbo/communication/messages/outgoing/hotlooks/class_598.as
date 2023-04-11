package package_108
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.util.Byte;
   
   [SecureSWF(rename="true")]
   public class class_598 implements IMessageComposer
   {
       
      
      private var var_20:Array;
      
      public function class_598(param1:int)
      {
         var_20 = [];
         super();
         var_20.push(new Byte(param1));
      }
      
      public function getMessageArray() : Array
      {
         return var_20;
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
