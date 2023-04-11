package package_147
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_144.class_1552;
   
   [SecureSWF(rename="true")]
   public class class_1335 implements IMessageParser
   {
       
      
      private var var_421:int;
      
      private var var_748:String;
      
      private var var_262:int;
      
      private var var_117:class_1552;
      
      public function class_1335()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_421 = param1.readInteger();
         var_748 = param1.readString();
         var_262 = param1.readInteger();
         var_117 = new class_1552(param1);
         return true;
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get petName() : String
      {
         return var_748;
      }
      
      public function get level() : int
      {
         return var_262;
      }
      
      public function get figureData() : class_1552
      {
         return var_117;
      }
   }
}
