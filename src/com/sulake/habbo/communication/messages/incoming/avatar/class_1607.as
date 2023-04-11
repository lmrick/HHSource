package package_44
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1607
   {
       
      
      private var var_789:int;
      
      private var _figureString:String;
      
      private var var_122:String;
      
      public function class_1607(param1:IMessageDataWrapper)
      {
         super();
         var_789 = param1.readInteger();
         _figureString = param1.readString();
         var_122 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return var_789;
      }
      
      public function get figureString() : String
      {
         return _figureString;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
   }
}
