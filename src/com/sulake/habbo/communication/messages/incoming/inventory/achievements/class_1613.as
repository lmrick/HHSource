package package_101
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1613
   {
      
      public static const const_404:int = 0;
       
      
      private var var_442:int;
      
      private var var_262:int;
      
      private var var_484:String;
      
      private var var_409:int;
      
      private var var_159:int;
      
      public function class_1613(param1:IMessageDataWrapper)
      {
         super();
         var_442 = param1.readInteger();
         var_262 = param1.readInteger();
         var_484 = param1.readString();
         var_409 = param1.readInteger();
         var_159 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         var_442 = 0;
         var_262 = 0;
         var_484 = "";
         var_409 = 0;
      }
      
      public function get achievementId() : int
      {
         return var_442;
      }
      
      public function get level() : int
      {
         return var_262;
      }
      
      public function get badgeId() : String
      {
         return var_484;
      }
      
      public function get requiredLevel() : int
      {
         return var_409;
      }
      
      public function get enabled() : Boolean
      {
         return var_159 == 0;
      }
      
      public function get state() : int
      {
         return var_159;
      }
   }
}
