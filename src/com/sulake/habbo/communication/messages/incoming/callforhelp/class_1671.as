package package_36
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import package_50.class_1631;
   
   [SecureSWF(rename="true")]
   public class class_1671 implements class_1631
   {
       
      
      private var var_695:String;
      
      private var var_943:int;
      
      private var var_824:String;
      
      public function class_1671(param1:IMessageDataWrapper)
      {
         super();
         var_695 = param1.readString();
         var_943 = param1.readInteger();
         var_824 = param1.readString();
      }
      
      public function get name() : String
      {
         return var_695;
      }
      
      public function get id() : int
      {
         return var_943;
      }
      
      public function get consequence() : String
      {
         return var_824;
      }
   }
}
