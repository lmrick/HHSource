package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_983 implements IMessageComposer
   {
       
      
      private var var_421:int;
      
      private var var_679:Boolean;
      
      public function class_983(param1:int, param2:Boolean)
      {
         super();
         var_421 = param1;
         var_679 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_421,var_679];
      }
   }
}
