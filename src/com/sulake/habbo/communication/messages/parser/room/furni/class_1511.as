package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_144.class_1552;
   
   [SecureSWF(rename="true")]
   public class class_1511 implements IMessageParser
   {
       
      
      private var var_347:int = -1;
      
      private var var_117:class_1552;
      
      public function class_1511()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get figureData() : class_1552
      {
         return var_117;
      }
      
      public function flush() : Boolean
      {
         var_347 = -1;
         var_117 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_347 = param1.readInteger();
         if(!param1.bytesAvailable)
         {
            return true;
         }
         var_117 = new class_1552(param1);
         return true;
      }
   }
}
