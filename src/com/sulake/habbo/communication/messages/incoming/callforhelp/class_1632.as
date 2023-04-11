package package_36
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import package_50.class_1631;
   
   [SecureSWF(rename="true")]
   public class class_1632 implements class_1631
   {
       
      
      private var _name:String;
      
      private var var_1083:int;
      
      private var var_1368:int;
      
      private var var_1047:Boolean;
      
      private var var_1093:String = "";
      
      private var var_766:String = "";
      
      public function class_1632(param1:IMessageDataWrapper)
      {
         super();
         _name = param1.readString();
         var_1083 = param1.readInteger();
         var_1368 = param1.readInteger();
         var_1047 = param1.readBoolean();
         if(param1.bytesAvailable)
         {
            var_1093 = param1.readString();
         }
         if(param1.bytesAvailable)
         {
            var_766 = param1.readString();
         }
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get sanctionLengthInHours() : int
      {
         return var_1083;
      }
      
      public function get avatarOnly() : Boolean
      {
         return var_1047;
      }
      
      public function get tradeLockInfo() : String
      {
         return var_1093;
      }
      
      public function get machineBanInfo() : String
      {
         return var_766;
      }
   }
}
