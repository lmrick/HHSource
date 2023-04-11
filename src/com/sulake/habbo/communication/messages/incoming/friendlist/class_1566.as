package package_24
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1566
   {
       
      
      private var var_1323:int;
      
      private var var_413:int;
      
      public function class_1566(param1:IMessageDataWrapper)
      {
         super();
         this.var_1323 = param1.readInteger();
         this.var_413 = param1.readInteger();
      }
      
      public function get senderId() : int
      {
         return this.var_1323;
      }
      
      public function get errorCode() : int
      {
         return this.var_413;
      }
   }
}
