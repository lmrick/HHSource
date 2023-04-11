package package_26
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1627
   {
      
      public static const const_314:int = 0;
      
      public static const const_395:int = 1;
      
      public static const const_140:int = 2;
       
      
      private var var_247:int;
      
      private var var_462:String;
      
      private var var_917:String;
      
      private var var_971:String;
      
      private var var_1112:int;
      
      private var var_1004:String;
      
      private var var_350:String;
      
      public function class_1627(param1:IMessageDataWrapper)
      {
         super();
         var_247 = param1.readInteger();
         var_462 = param1.readString();
         var_917 = param1.readString();
         var_971 = param1.readString();
         var_1112 = param1.readInteger();
         var_1004 = param1.readString();
         var_350 = param1.readString();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get title() : String
      {
         return var_462;
      }
      
      public function get bodyText() : String
      {
         return var_917;
      }
      
      public function get buttonText() : String
      {
         return var_971;
      }
      
      public function get linkType() : int
      {
         return var_1112;
      }
      
      public function get linkContent() : String
      {
         return var_1004;
      }
      
      public function get imageUrl() : String
      {
         return var_350;
      }
   }
}
