package package_167
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1196 implements IMessageParser
   {
       
      
      private var var_790:int;
      
      private var var_170:Boolean;
      
      public function class_1196()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_790 = param1.readByte();
         var_170 = param1.readBoolean();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get rewardCategory() : int
      {
         return var_790;
      }
      
      public function get result() : Boolean
      {
         return var_170;
      }
   }
}
