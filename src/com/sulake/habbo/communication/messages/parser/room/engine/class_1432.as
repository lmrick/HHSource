package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1432 implements IMessageParser
   {
       
      
      private var var_247:int = 0;
      
      private var var_384:String;
      
      public function class_1432()
      {
         super();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get itemData() : String
      {
         return var_384;
      }
      
      public function flush() : Boolean
      {
         var_247 = 0;
         var_384 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:String = param1.readString();
         var_247 = int(_loc2_);
         var_384 = param1.readString();
         return true;
      }
   }
}
