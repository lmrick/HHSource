package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1312 implements IMessageParser
   {
       
      
      private var var_675:Boolean;
      
      private var var_495:int;
      
      private var var_335:String;
      
      private var var_914:Boolean;
      
      private var var_654:int;
      
      private var var_1022:int;
      
      private var var_958:int;
      
      public function class_1312()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_675 = param1.readBoolean();
         var_654 = param1.readInteger();
         var_914 = var_654 === 0;
         var_495 = param1.readInteger();
         var_335 = param1.readString();
         var_1022 = param1.readInteger();
         var_958 = param1.readInteger();
         if(!var_675)
         {
            var_495 = -1;
            var_335 = "";
         }
         return true;
      }
      
      public function get rented() : Boolean
      {
         return var_675;
      }
      
      public function get renterId() : int
      {
         return var_495;
      }
      
      public function get renterName() : String
      {
         return var_335;
      }
      
      public function get canRent() : Boolean
      {
         return var_914;
      }
      
      public function get price() : int
      {
         return var_958;
      }
      
      public function get timeRemaining() : int
      {
         return var_1022;
      }
      
      public function get canRentErrorCode() : int
      {
         return var_654;
      }
   }
}
