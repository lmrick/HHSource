package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_213 implements IMessageComposer
   {
       
      
      private var var_29:int;
      
      private var var_28:int;
      
      public function class_213(param1:int, param2:int)
      {
         super();
         var_29 = param1;
         var_28 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_29,var_28];
      }
   }
}
