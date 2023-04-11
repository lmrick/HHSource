package package_8
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1539
   {
       
      
      private var _offerId:int;
      
      private var var_1096:Boolean;
      
      private var var_858:Boolean;
      
      private var var_1306:int;
      
      public function class_1539(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1096 = param1.readBoolean();
         var_1306 = param1.readInteger();
         var_858 = param1.readBoolean();
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get isVip() : Boolean
      {
         return var_1096;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_858;
      }
      
      public function get daysRequired() : int
      {
         return var_1306;
      }
   }
}
