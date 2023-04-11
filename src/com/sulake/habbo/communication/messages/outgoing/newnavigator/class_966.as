package package_37
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_966 implements IMessageComposer
   {
       
      
      private var var_205:Array;
      
      public function class_966(param1:String)
      {
         var_205 = [];
         super();
         var_205.push(param1);
      }
      
      public function getMessageArray() : Array
      {
         return var_205;
      }
      
      public function dispose() : void
      {
         var_205 = null;
      }
   }
}
