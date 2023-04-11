package package_131
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1178 implements IMessageParser
   {
       
      
      private var var_271:int;
      
      private var var_529:int;
      
      private var _duration:int;
      
      private var var_1110:Boolean;
      
      public function class_1178()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_271 = 0;
         var_529 = 0;
         _duration = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_271 = param1.readInteger();
         var_529 = param1.readInteger();
         _duration = param1.readInteger();
         var_1110 = param1.readBoolean();
         return true;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get subType() : int
      {
         return var_529;
      }
      
      public function get duration() : int
      {
         return _duration;
      }
      
      public function get isPermanent() : Boolean
      {
         return var_1110;
      }
   }
}
