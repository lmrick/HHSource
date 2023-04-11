package package_64
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_376 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_376(param1:String)
      {
         super();
         var_45 = [];
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
