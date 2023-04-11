package package_52
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_695 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_695(param1:int)
      {
         var_45 = [];
         super();
         var_45.push(param1);
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
