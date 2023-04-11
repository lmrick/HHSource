package package_134
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1287 implements IMessageParser
   {
       
      
      private var var_421:int = -1;
      
      private var var_698:int = -1;
      
      private var var_1184:int = 0;
      
      public function class_1287()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get petRoomIndex() : int
      {
         return var_698;
      }
      
      public function get gainedExperience() : int
      {
         return var_1184;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_421 = param1.readInteger();
         var_698 = param1.readInteger();
         var_1184 = param1.readInteger();
         return true;
      }
   }
}
