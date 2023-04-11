package package_175
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1616
   {
       
      
      private var var_247:int;
      
      private var _name:String;
      
      private var var_904:String;
      
      private var var_122:String;
      
      private var var_427:String;
      
      public function class_1616(param1:IMessageDataWrapper)
      {
         super();
         var_247 = param1.readInteger();
         _name = param1.readString();
         var_904 = param1.readString();
         var_122 = param1.readString();
         var_427 = param1.readString();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_904;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
   }
}
