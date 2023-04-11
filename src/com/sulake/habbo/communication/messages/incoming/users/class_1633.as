package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1633
   {
       
      
      private var _groupId:int;
      
      private var _groupName:String;
      
      private var var_331:String;
      
      private var _primaryColor:String;
      
      private var _secondaryColor:String;
      
      private var var_799:Boolean;
      
      private var var_684:int;
      
      private var var_1128:Boolean;
      
      public function class_1633(param1:IMessageDataWrapper)
      {
         super();
         _groupId = param1.readInteger();
         _groupName = param1.readString();
         var_331 = param1.readString();
         _primaryColor = param1.readString();
         _secondaryColor = param1.readString();
         var_799 = param1.readBoolean();
         var_684 = param1.readInteger();
         var_1128 = param1.readBoolean();
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function get groupName() : String
      {
         return _groupName;
      }
      
      public function get badgeCode() : String
      {
         return var_331;
      }
      
      public function get primaryColor() : String
      {
         return _primaryColor;
      }
      
      public function get secondaryColor() : String
      {
         return _secondaryColor;
      }
      
      public function get favourite() : Boolean
      {
         return var_799;
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function get hasForum() : Boolean
      {
         return var_1128;
      }
   }
}
