package package_7
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_141 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_141()
      {
         var_45 = [];
         super();
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
