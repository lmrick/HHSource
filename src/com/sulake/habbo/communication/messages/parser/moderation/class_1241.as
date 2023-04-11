package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1241 implements IMessageParser
   {
       
      
      private var var_357:String;
      
      private var var_90:String;
      
      public function class_1241()
      {
         super();
      }
      
      public function get message() : String
      {
         return var_357;
      }
      
      public function get url() : String
      {
         return var_90;
      }
      
      public function ModerationCautionParser() : *
      {
      }
      
      public function flush() : Boolean
      {
         var_357 = "";
         var_90 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_357 = param1.readString();
         var_90 = param1.readString();
         return true;
      }
   }
}
