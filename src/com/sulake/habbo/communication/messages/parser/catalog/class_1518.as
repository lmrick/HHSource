package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1518 implements IMessageParser
   {
       
      
      private var _pageName:String;
      
      private var var_965:int;
      
      private var var_973:String;
      
      public function class_1518()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _pageName = param1.readString();
         var_965 = param1.readInteger();
         var_973 = param1.readString();
         return true;
      }
      
      public function get pageName() : String
      {
         return _pageName;
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
