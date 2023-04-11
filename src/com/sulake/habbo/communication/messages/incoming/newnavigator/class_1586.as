package package_18
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1586
   {
       
      
      private var _flatId:int;
      
      private var var_1291:int;
      
      private var var_973:String;
      
      private var _caption:String;
      
      public function class_1586(param1:IMessageDataWrapper)
      {
         super();
         _flatId = param1.readInteger();
         var_1291 = param1.readInteger();
         var_973 = param1.readString();
         _caption = param1.readString();
      }
      
      public function get flatId() : int
      {
         return _flatId;
      }
      
      public function get areaId() : int
      {
         return var_1291;
      }
      
      public function get image() : String
      {
         return var_973;
      }
      
      public function get caption() : String
      {
         return _caption;
      }
   }
}
