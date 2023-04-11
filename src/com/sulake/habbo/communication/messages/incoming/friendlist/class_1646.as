package package_24
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1646
   {
       
      
      private var var_438:int;
      
      private var _requesterName:String;
      
      private var var_984:int;
      
      private var _figureString:String;
      
      public function class_1646(param1:IMessageDataWrapper)
      {
         super();
         var_438 = param1.readInteger();
         _requesterName = param1.readString();
         _figureString = param1.readString();
         var_984 = var_438;
      }
      
      public function get requestId() : int
      {
         return var_438;
      }
      
      public function get requesterName() : String
      {
         return _requesterName;
      }
      
      public function get requesterUserId() : int
      {
         return var_984;
      }
      
      public function get figureString() : String
      {
         return _figureString;
      }
   }
}
