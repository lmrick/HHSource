package package_62
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_229 implements IMessageComposer
   {
       
      
      private var var_339:int;
      
      private var var_354:int = 0;
      
      private var var_969:int;
      
      public function class_229(param1:int, param2:int, param3:int = 0)
      {
         super();
         var_339 = param1;
         var_354 = param3;
         var_969 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_339,var_354,var_969];
      }
   }
}
