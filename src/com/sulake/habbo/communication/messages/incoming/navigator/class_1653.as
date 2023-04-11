package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1653
   {
       
      
      private var var_1069:String;
      
      private var var_392:int;
      
      public function class_1653(param1:IMessageDataWrapper)
      {
         super();
         var_1069 = param1.readString();
         var_392 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return var_1069;
      }
      
      public function get userCount() : int
      {
         return var_392;
      }
   }
}
