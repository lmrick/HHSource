package package_24
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1599
   {
       
      
      private var var_247:int;
      
      private var _name:String;
      
      private var var_122:int;
      
      private var _online:Boolean;
      
      private var var_1401:Boolean;
      
      private var var_427:String;
      
      private var var_415:int;
      
      private var var_904:String;
      
      private var var_1412:String;
      
      private var _realName:String;
      
      private var var_1373:String;
      
      private var var_1378:Boolean;
      
      private var var_1356:Boolean;
      
      private var var_1376:Boolean;
      
      private var _relationshipStatus:int;
      
      public function class_1599(param1:IMessageDataWrapper)
      {
         super();
         this.var_247 = param1.readInteger();
         this._name = param1.readString();
         this.var_122 = param1.readInteger();
         this._online = param1.readBoolean();
         this.var_1401 = param1.readBoolean();
         this.var_427 = param1.readString();
         this.var_415 = param1.readInteger();
         this.var_904 = param1.readString();
         this._realName = param1.readString();
         this.var_1373 = param1.readString();
         this.var_1378 = param1.readBoolean();
         this.var_1356 = param1.readBoolean();
         this.var_1376 = param1.readBoolean();
         this._relationshipStatus = param1.readShort();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get gender() : int
      {
         return var_122;
      }
      
      public function get online() : Boolean
      {
         return _online;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1401;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get categoryId() : int
      {
         return var_415;
      }
      
      public function get motto() : String
      {
         return var_904;
      }
      
      public function get lastAccess() : String
      {
         return var_1412;
      }
      
      public function get realName() : String
      {
         return _realName;
      }
      
      public function get facebookId() : String
      {
         return var_1373;
      }
      
      public function get persistedMessageUser() : Boolean
      {
         return var_1378;
      }
      
      public function get vipMember() : Boolean
      {
         return var_1356;
      }
      
      public function get pocketHabboUser() : Boolean
      {
         return var_1376;
      }
      
      public function get relationshipStatus() : int
      {
         return _relationshipStatus;
      }
   }
}
