package package_134
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1301 implements IMessageParser
   {
       
      
      private var var_783:int;
      
      private var var_421:int;
      
      private var var_883:Boolean;
      
      private var var_712:Boolean;
      
      private var var_878:Boolean;
      
      private var _hasBreedingPermission:Boolean;
      
      public function class_1301()
      {
         super();
      }
      
      public function get roomIndex() : int
      {
         return var_783;
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get canBreed() : Boolean
      {
         return var_883;
      }
      
      public function get canHarvest() : Boolean
      {
         return var_712;
      }
      
      public function get canRevive() : Boolean
      {
         return var_878;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasBreedingPermission() : Boolean
      {
         return _hasBreedingPermission;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_783 = param1.readInteger();
         var_421 = param1.readInteger();
         var_883 = param1.readBoolean();
         var_712 = param1.readBoolean();
         var_878 = param1.readBoolean();
         _hasBreedingPermission = param1.readBoolean();
         return true;
      }
   }
}
