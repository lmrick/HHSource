package package_171
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1626
   {
       
      
      private var var_247:int;
      
      private var var_45:String;
      
      public function class_1626(param1:IMessageDataWrapper)
      {
         super();
         parse(param1);
      }
      
      public function parse(param1:IMessageDataWrapper) : void
      {
         var_247 = param1.readInteger();
         var_45 = param1.readString();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get data() : String
      {
         return var_45;
      }
   }
}
