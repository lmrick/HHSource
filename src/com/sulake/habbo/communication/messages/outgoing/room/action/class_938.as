package package_62
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_938 implements IMessageComposer
   {
       
      
      private var var_20:Array;
      
      public function class_938(param1:int, param2:int)
      {
         var_20 = [];
         super();
         var_20.push(param1);
         var_20.push(param2);
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
