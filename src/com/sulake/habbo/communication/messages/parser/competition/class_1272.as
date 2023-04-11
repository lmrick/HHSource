package package_129
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1272 implements IMessageParser
   {
       
      
      private var var_1267:Boolean;
      
      private var var_882:int;
      
      public function class_1272()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1267 = param1.readBoolean();
         var_882 = param1.readInteger();
         return true;
      }
      
      public function get isPartOf() : Boolean
      {
         return var_1267;
      }
      
      public function get targetId() : int
      {
         return var_882;
      }
   }
}
