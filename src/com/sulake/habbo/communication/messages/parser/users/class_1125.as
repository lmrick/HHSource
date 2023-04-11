package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_5.class_1174;
   
   [SecureSWF(rename="true")]
   public class class_1125 implements IMessageParser
   {
       
      
      private var var_445:int;
      
      private var var_45:class_1174;
      
      public function class_1125()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_45 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_445 = param1.readInteger();
         var_45 = new class_1174(param1);
         return true;
      }
      
      public function get guildId() : int
      {
         return var_445;
      }
      
      public function get data() : class_1174
      {
         return var_45;
      }
   }
}
