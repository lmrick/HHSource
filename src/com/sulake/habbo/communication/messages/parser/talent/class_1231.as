package package_149
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1231 implements IMessageParser
   {
       
      
      private var var_455:String;
      
      private var var_262:int;
      
      private var var_948:int;
      
      public function class_1231()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_455 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_455 = param1.readString();
         var_262 = param1.readInteger();
         var_948 = param1.readInteger();
         return true;
      }
      
      public function get talentTrackName() : String
      {
         return var_455;
      }
      
      public function get level() : int
      {
         return var_262;
      }
      
      public function get maxLevel() : int
      {
         return var_948;
      }
   }
}
