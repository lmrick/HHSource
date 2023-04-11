package package_153
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1543
   {
       
      
      private var var_484:String;
      
      private var var_853:int;
      
      public function class_1543(param1:String, param2:IMessageDataWrapper)
      {
         super();
         var_484 = "ACH_" + param1 + param2.readInteger();
         var_853 = param2.readInteger();
      }
      
      public function get badgeId() : String
      {
         return var_484;
      }
      
      public function get limit() : int
      {
         return var_853;
      }
   }
}
