package package_150
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1340 implements IMessageParser
   {
      
      public static const const_78:int = 1;
      
      public static const const_246:int = 2;
      
      public static const const_242:int = 3;
      
      public static const const_193:int = 4;
       
      
      private var var_305:int = 0;
      
      private var var_190:String = "";
      
      public function class_1340()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_305 = 0;
         var_190 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_305 = param1.readInteger();
         if(var_305 == 3)
         {
            var_190 = param1.readString();
         }
         else
         {
            var_190 = "";
         }
         return true;
      }
      
      public function get reason() : int
      {
         return var_305;
      }
      
      public function get parameter() : String
      {
         return var_190;
      }
   }
}
