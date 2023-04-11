package package_148
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1085 implements IMessageParser
   {
       
      
      private var var_550:Boolean;
      
      private var var_158:int;
      
      public function class_1085()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_158 = param1.readInteger();
         var_550 = param1.readBoolean();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_158 = 0;
         var_550 = false;
         return true;
      }
      
      public function get count() : int
      {
         return var_158;
      }
      
      public function get recipeComplete() : Boolean
      {
         return var_550;
      }
   }
}
