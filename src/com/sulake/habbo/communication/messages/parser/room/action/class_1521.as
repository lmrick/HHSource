package package_141
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1521 implements IMessageParser
   {
       
      
      private var var_339:int = 0;
      
      private var var_261:int;
      
      public function class_1521()
      {
         super();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get itemType() : int
      {
         return var_261;
      }
      
      public function flush() : Boolean
      {
         var_339 = 0;
         var_261 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_339 = param1.readInteger();
         var_261 = param1.readInteger();
         return true;
      }
   }
}
