package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1159 implements IMessageParser
   {
       
      
      private var var_347:int;
      
      private var var_445:int;
      
      private var var_397:String;
      
      private var var_581:int;
      
      private var var_488:Boolean;
      
      private var var_452:Boolean;
      
      public function class_1159()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get guildId() : int
      {
         return var_445;
      }
      
      public function get guildName() : String
      {
         return var_397;
      }
      
      public function get guildHomeRoomId() : int
      {
         return var_581;
      }
      
      public function get userIsMember() : Boolean
      {
         return var_488;
      }
      
      public function get guildHasReadableForum() : Boolean
      {
         return var_452;
      }
      
      public function flush() : Boolean
      {
         var_347 = -1;
         var_445 = -1;
         var_397 = "";
         var_581 = -1;
         var_488 = false;
         var_452 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_347 = param1.readInteger();
         var_445 = param1.readInteger();
         var_397 = param1.readString();
         var_581 = param1.readInteger();
         var_488 = param1.readBoolean();
         var_452 = param1.readBoolean();
         return true;
      }
   }
}
