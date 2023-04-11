package package_157
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1619
   {
       
      
      private var var_339:int;
      
      private var var_522:int;
      
      private var var_967:int;
      
      private var _name:String;
      
      private var var_427:String;
      
      private var var_122:String;
      
      public function class_1619(param1:IMessageDataWrapper)
      {
         super();
         var_339 = param1.readInteger();
         var_522 = param1.readInteger();
         var_967 = param1.readInteger();
         _name = param1.readString();
         var_427 = param1.readString();
         var_122 = param1.readString();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get score() : int
      {
         return var_522;
      }
      
      public function get rank() : int
      {
         return var_967;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function get name() : String
      {
         return _name;
      }
   }
}
