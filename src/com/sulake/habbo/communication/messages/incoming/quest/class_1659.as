package package_83
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1659 implements class_1658
   {
       
      
      private var var_339:int;
      
      private var _userName:String;
      
      private var var_427:String;
      
      private var var_967:int;
      
      private var var_1245:int;
      
      public function class_1659(param1:IMessageDataWrapper)
      {
         super();
         var_339 = param1.readInteger();
         _userName = param1.readString();
         var_427 = param1.readString();
         var_967 = param1.readInteger();
         var_1245 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get rank() : int
      {
         return var_967;
      }
      
      public function get currentScore() : int
      {
         return var_1245;
      }
   }
}
