package package_18
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1597
   {
       
      
      private var var_247:int;
      
      private var var_932:String;
      
      private var var_979:String;
      
      private var _localization:String;
      
      public function class_1597(param1:IMessageDataWrapper)
      {
         super();
         var_247 = param1.readInteger();
         var_932 = param1.readString();
         var_979 = param1.readString();
         _localization = param1.readString();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get searchCode() : String
      {
         return var_932;
      }
      
      public function get filter() : String
      {
         return var_979;
      }
      
      public function get localization() : String
      {
         return _localization;
      }
   }
}
