package package_78
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1636 implements class_1623
   {
       
      
      private var var_339:int;
      
      private var _userName:String;
      
      public function class_1636(param1:IMessageDataWrapper)
      {
         super();
         var_339 = param1.readInteger();
         _userName = param1.readString();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
