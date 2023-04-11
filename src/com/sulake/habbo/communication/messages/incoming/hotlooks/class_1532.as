package package_120
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1532
   {
       
      
      private var var_122:String;
      
      private var _figureString:String;
      
      public function class_1532(param1:IMessageDataWrapper)
      {
         super();
         var_122 = param1.readString();
         _figureString = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function get figureString() : String
      {
         return _figureString;
      }
   }
}
