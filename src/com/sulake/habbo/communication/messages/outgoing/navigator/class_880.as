package package_2
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_880 implements IMessageComposer
   {
       
      
      private var var_20:Array;
      
      public function class_880(param1:int)
      {
         var_20 = [];
         super();
         var_20.push(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_20;
      }
   }
}
