package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1091 implements IMessageParser
   {
       
      
      private var var_1142:Boolean;
      
      private var _newFurniDataHash:String;
      
      public function class_1091()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1142 = param1.readBoolean();
         if(param1.bytesAvailable)
         {
            _newFurniDataHash = param1.readString();
         }
         return true;
      }
      
      public function get instantlyRefreshCatalogue() : Boolean
      {
         return var_1142;
      }
      
      public function get newFurniDataHash() : String
      {
         return _newFurniDataHash;
      }
   }
}
