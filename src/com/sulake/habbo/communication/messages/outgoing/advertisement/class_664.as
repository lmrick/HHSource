package package_32
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_664 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_664()
      {
         var_45 = [];
         super();
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
