package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1625
   {
       
      
      private var var_1139:int;
      
      private var var_677:String;
      
      private var var_805:Boolean;
      
      private var var_1310:Boolean;
      
      private var var_755:String;
      
      private var var_481:String;
      
      private var var_1074:Boolean;
      
      public function class_1625(param1:IMessageDataWrapper)
      {
         super();
         var_1139 = param1.readInteger();
         var_677 = param1.readString();
         var_805 = param1.readBoolean();
         var_1310 = param1.readBoolean();
         var_755 = param1.readString();
         var_481 = param1.readString();
         var_1074 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return var_1139;
      }
      
      public function get nodeName() : String
      {
         return var_677;
      }
      
      public function get visible() : Boolean
      {
         return var_805;
      }
      
      public function get automatic() : Boolean
      {
         return var_1310;
      }
      
      public function get staffOnly() : Boolean
      {
         return var_1074;
      }
      
      public function get automaticCategoryKey() : String
      {
         return var_755;
      }
      
      public function get globalCategoryKey() : String
      {
         return var_481;
      }
      
      public function get visibleName() : String
      {
         return var_481 == "" ? var_677 : "${navigator.flatcategory.global." + var_481 + "}";
      }
   }
}
