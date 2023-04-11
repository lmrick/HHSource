package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1522 implements IMessageParser
   {
       
      
      private var var_783:int;
      
      private var var_771:int;
      
      private var _status:int;
      
      private var _habboGroupName:String;
      
      public function class_1522()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_783 = param1.readInteger();
         var_771 = param1.readInteger();
         _status = param1.readInteger();
         _habboGroupName = param1.readString();
         return true;
      }
      
      public function get roomIndex() : int
      {
         return var_783;
      }
      
      public function get habboGroupId() : int
      {
         return var_771;
      }
      
      public function get status() : int
      {
         return _status;
      }
      
      public function get habboGroupName() : String
      {
         return _habboGroupName;
      }
   }
}
