package package_24
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1602
   {
       
      
      private var var_1094:int;
      
      private var _avatarName:String;
      
      private var var_1340:String;
      
      private var var_1343:Boolean;
      
      private var var_1348:Boolean;
      
      private var var_1359:int;
      
      private var var_1345:String;
      
      private var var_1416:String;
      
      private var _realName:String;
      
      public function class_1602(param1:IMessageDataWrapper)
      {
         super();
         this.var_1094 = param1.readInteger();
         this._avatarName = param1.readString();
         this.var_1340 = param1.readString();
         this.var_1343 = param1.readBoolean();
         this.var_1348 = param1.readBoolean();
         param1.readString();
         this.var_1359 = param1.readInteger();
         this.var_1345 = param1.readString();
         this._realName = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_1094;
      }
      
      public function get avatarName() : String
      {
         return this._avatarName;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1340;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_1343;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_1348;
      }
      
      public function get avatarGender() : int
      {
         return this.var_1359;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1345;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_1416;
      }
      
      public function get realName() : String
      {
         return this._realName;
      }
   }
}
