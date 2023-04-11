package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1577
   {
       
      
      private var var_247:int;
      
      private var _fileName:String;
      
      private var _maskFileName:String;
      
      public function class_1577(param1:IMessageDataWrapper = null)
      {
         super();
         var_247 = param1.readInteger();
         _fileName = param1.readString();
         _maskFileName = param1.readString();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get fileName() : String
      {
         return _fileName;
      }
      
      public function get maskFileName() : String
      {
         return _maskFileName;
      }
   }
}
