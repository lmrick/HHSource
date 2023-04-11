package package_141
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1071 implements IMessageParser
   {
       
      
      private var var_339:int = 0;
      
      private var var_951:int = 0;
      
      public function class_1071()
      {
         super();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get danceStyle() : int
      {
         return var_951;
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
         var_951 = param1.readInteger();
         return true;
      }
   }
}
