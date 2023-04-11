package package_41
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1576
   {
       
      
      private var var_332:int;
      
      private var _name:String;
      
      private var var_262:int;
      
      private var var_427:String;
      
      private var var_466:String;
      
      public function class_1576(param1:IMessageDataWrapper)
      {
         super();
         var_332 = param1.readInteger();
         _name = param1.readString();
         var_262 = param1.readInteger();
         var_427 = param1.readString();
         var_466 = param1.readString();
      }
      
      public function dispose() : void
      {
         var_332 = 0;
         _name = "";
         var_262 = 0;
         var_427 = "";
         var_466 = "";
      }
      
      public function get webId() : int
      {
         return var_332;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get level() : int
      {
         return var_262;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get owner() : String
      {
         return var_466;
      }
   }
}
