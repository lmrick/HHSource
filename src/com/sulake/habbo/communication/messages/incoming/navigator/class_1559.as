package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1559
   {
       
      
      private var var_429:int;
      
      private var var_559:int;
      
      private var var_1065:int;
      
      public function class_1559(param1:IMessageDataWrapper, param2:int = 0, param3:int = 0)
      {
         super();
         var_429 = param2;
         var_559 = param3;
         if(param1 != null)
         {
            var_429 = param1.readInteger();
            var_559 = param1.readInteger();
            var_1065 = param1.readInteger();
         }
      }
      
      public function get goalId() : int
      {
         return var_429;
      }
      
      public function get pageIndex() : int
      {
         return var_559;
      }
      
      public function get pageCount() : int
      {
         return var_1065;
      }
   }
}
