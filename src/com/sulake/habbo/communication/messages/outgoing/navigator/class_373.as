package package_2
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_373 implements IMessageComposer
   {
       
      
      private var var_271:String;
      
      public function class_373(param1:String)
      {
         super();
         var_271 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_271];
      }
      
      public function dispose() : void
      {
         var_271 = null;
      }
   }
}
