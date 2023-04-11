package package_141
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1303 implements IMessageParser
   {
       
      
      private var var_339:int = 0;
      
      private var var_1031:Boolean = false;
      
      public function class_1303()
      {
         super();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get sleeping() : Boolean
      {
         return var_1031;
      }
      
      public function flush() : Boolean
      {
         var_339 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_339 = param1.readInteger();
         var_1031 = param1.readBoolean();
         return true;
      }
   }
}
