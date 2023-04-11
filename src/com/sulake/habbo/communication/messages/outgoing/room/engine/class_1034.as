package package_13
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_1034 implements IMessageComposer
   {
       
      
      private var var_341:int;
      
      private var var_29:int;
      
      private var var_28:int;
      
      public function class_1034(param1:int, param2:int, param3:int)
      {
         super();
         var_341 = param1;
         var_29 = param2;
         var_28 = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_341,var_29,var_28];
      }
   }
}
