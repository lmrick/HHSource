package package_148
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1545
   {
       
      
      private var var_343:String;
      
      private var var_552:String;
      
      public function class_1545(param1:IMessageDataWrapper)
      {
         super();
         var_343 = param1.readString();
         var_552 = param1.readString();
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get furnitureClassName() : String
      {
         return var_552;
      }
   }
}
