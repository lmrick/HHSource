package package_146
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1406 implements IMessageParser
   {
       
      
      private var var_519:int;
      
      private var _officialSongId:String;
      
      public function class_1406()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_519 = 0;
         _officialSongId = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _officialSongId = param1.readString();
         var_519 = param1.readInteger();
         return true;
      }
      
      public function get songId() : int
      {
         return var_519;
      }
      
      public function get officialSongId() : String
      {
         return _officialSongId;
      }
   }
}
