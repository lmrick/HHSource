package package_50
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1660
   {
       
      
      private var var_912:String;
      
      private var var_780:int;
      
      private var var_768:String;
      
      private var _msg:String;
      
      private var var_996:Boolean;
      
      public function class_1660(param1:IMessageDataWrapper)
      {
         super();
         var_912 = param1.readString();
         var_780 = param1.readInteger();
         var_768 = param1.readString();
         _msg = param1.readString();
         var_996 = param1.readBoolean();
      }
      
      public function get timeStamp() : String
      {
         return var_912;
      }
      
      public function get chatterId() : int
      {
         return var_780;
      }
      
      public function get chatterName() : String
      {
         return var_768;
      }
      
      public function get msg() : String
      {
         return _msg;
      }
      
      public function get hasHighlighting() : Boolean
      {
         return var_996;
      }
   }
}
