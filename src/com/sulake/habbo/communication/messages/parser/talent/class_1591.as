package package_149
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1591
   {
       
      
      private var var_343:String;
      
      private var var_886:int;
      
      public function class_1591(param1:IMessageDataWrapper)
      {
         super();
         var_343 = param1.readString();
         var_886 = param1.readInteger();
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get vipDays() : int
      {
         return var_886;
      }
   }
}
