package package_149
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1643
   {
       
      
      private var var_850:String;
      
      public function class_1643(param1:IMessageDataWrapper)
      {
         super();
         var_850 = param1.readString();
      }
      
      public function get perkId() : String
      {
         return var_850;
      }
   }
}
