package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1174
   {
      
      private static const const_169:int = 0;
      
      private static const const_139:int = 1;
      
      private static const const_191:int = 2;
      
      private static const const_208:int = 3;
      
      private static const const_158:int = 4;
       
      
      private var var_271:int;
      
      private var var_339:int;
      
      private var _userName:String;
      
      private var var_427:String;
      
      private var var_870:String;
      
      public function class_1174(param1:IMessageDataWrapper)
      {
         super();
         var_271 = param1.readInteger();
         var_339 = param1.readInteger();
         _userName = param1.readString();
         var_427 = param1.readString();
         var_870 = param1.readString();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get admin() : Boolean
      {
         return var_271 == 1;
      }
      
      public function get owner() : Boolean
      {
         return var_271 == 0;
      }
      
      public function get member() : Boolean
      {
         return var_271 != 3;
      }
      
      public function get blocked() : Boolean
      {
         return var_271 == 4;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get memberSince() : String
      {
         return var_870;
      }
   }
}
