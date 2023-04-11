package package_69
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_982 implements IMessageComposer
   {
       
      
      private var var_20:Array;
      
      public function class_982(param1:String)
      {
         var_20 = [];
         super();
         var_20.push(param1);
      }
      
      public function getMessageArray() : Array
      {
         return var_20;
      }
      
      public function dispose() : void
      {
         var_20 = null;
      }
   }
}
