package package_33
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_1006 implements IMessageComposer
   {
       
      
      private var var_930:int;
      
      private var var_1048:int;
      
      public function class_1006(param1:int, param2:int)
      {
         super();
         var_930 = param1;
         var_1048 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [var_930,var_1048];
      }
      
      public function dispose() : void
      {
      }
   }
}
