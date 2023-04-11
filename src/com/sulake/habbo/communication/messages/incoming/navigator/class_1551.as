package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1551
   {
       
      
      private var var_415:int;
      
      private var var_815:String;
      
      private var var_805:Boolean;
      
      public function class_1551(param1:IMessageDataWrapper)
      {
         super();
         var_415 = param1.readInteger();
         var_815 = param1.readString();
         var_805 = param1.readBoolean();
      }
      
      public function get categoryId() : int
      {
         return var_415;
      }
      
      public function get categoryName() : String
      {
         return var_815;
      }
      
      public function get visible() : Boolean
      {
         return var_805;
      }
   }
}
