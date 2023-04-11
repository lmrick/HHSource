package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1058 implements IMessageParser
   {
       
      
      private var var_391:Boolean = false;
      
      private var var_432:Boolean = false;
      
      private var var_349:int = 0;
      
      public function class_1058()
      {
         super();
      }
      
      public function get notEnoughCredits() : Boolean
      {
         return var_391;
      }
      
      public function get notEnoughActivityPoints() : Boolean
      {
         return var_432;
      }
      
      public function get activityPointType() : int
      {
         return var_349;
      }
      
      public function flush() : Boolean
      {
         var_391 = false;
         var_432 = false;
         var_349 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_391 = param1.readBoolean();
         var_432 = param1.readBoolean();
         if(param1.bytesAvailable)
         {
            var_349 = param1.readInteger();
         }
         return true;
      }
   }
}
