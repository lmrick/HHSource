package package_21
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_909 implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      private var var_445:int;
      
      public function class_909(param1:int, param2:int)
      {
         super();
         var_347 = param1;
         var_445 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_347,var_445];
      }
   }
}
