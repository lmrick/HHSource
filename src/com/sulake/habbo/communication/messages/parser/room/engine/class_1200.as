package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1200 implements IMessageParser
   {
       
      
      private var var_247:int;
      
      private var var_1233:Boolean;
      
      private var var_1228:int;
      
      private var var_408:int;
      
      public function class_1200()
      {
         super();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get isExpired() : Boolean
      {
         return var_1233;
      }
      
      public function get pickerId() : int
      {
         return var_1228;
      }
      
      public function get delay() : int
      {
         return var_408;
      }
      
      public function flush() : Boolean
      {
         var_247 = 0;
         var_408 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_247 = int(param1.readString());
         var_1233 = param1.readBoolean();
         var_1228 = param1.readInteger();
         var_408 = param1.readInteger();
         return true;
      }
   }
}
