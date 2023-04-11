package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1529 implements IMessageParser
   {
       
      
      private var _pageName:String;
      
      private var var_344:int;
      
      private var var_965:int;
      
      private var var_973:String;
      
      public function class_1529()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_344 = param1.readInteger();
         _pageName = param1.readString();
         var_965 = param1.readInteger();
         var_973 = param1.readString();
         return true;
      }
      
      public function get pageName() : String
      {
         return _pageName;
      }
      
      public function get pageId() : int
      {
         return var_344;
      }
      
      public function get secondsToExpiry() : int
      {
         return var_965;
      }
      
      public function get image() : String
      {
         return var_973;
      }
   }
}
