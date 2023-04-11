package package_49
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_475 implements IMessageComposer
   {
       
      
      private var var_861:int;
      
      private var var_1127:int;
      
      private var var_1316:int;
      
      public function class_475(param1:int, param2:int, param3:int)
      {
         super();
         var_861 = param1;
         var_1127 = param2;
         var_1316 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_861,var_1127,var_1316];
      }
      
      public function dispose() : void
      {
      }
   }
}
