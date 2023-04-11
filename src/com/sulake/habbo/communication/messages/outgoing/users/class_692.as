package package_7
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_692 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_692(param1:int)
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
