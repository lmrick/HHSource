package package_133
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1347 implements IMessageParser
   {
       
      
      private var var_689:int;
      
      private var var_753:int;
      
      private var _isAmbassador:Boolean;
      
      public function class_1347()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_689 = param1.readInteger();
         var_753 = param1.readInteger();
         _isAmbassador = param1.readBoolean();
         return true;
      }
      
      public function get clubLevel() : int
      {
         return var_689;
      }
      
      public function get securityLevel() : int
      {
         return var_753;
      }
      
      public function get isAmbassador() : Boolean
      {
         return _isAmbassador;
      }
   }
}
