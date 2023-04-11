package package_133
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1188 implements IMessageParser
   {
       
      
      private var var_247:int;
      
      private var _name:String;
      
      private var var_427:String;
      
      private var var_133:String;
      
      private var var_1367:String;
      
      private var _realName:String;
      
      private var var_1400:Boolean;
      
      private var var_702:int;
      
      private var var_1337:int;
      
      private var var_1357:int;
      
      private var var_1374:Boolean;
      
      private var var_1361:String;
      
      private var var_1350:Boolean;
      
      private var var_1342:Boolean = false;
      
      public function class_1188()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_247 = param1.readInteger();
         this._name = param1.readString();
         this.var_427 = param1.readString();
         this.var_133 = param1.readString();
         this.var_1367 = param1.readString();
         this._realName = param1.readString();
         this.var_1400 = param1.readBoolean();
         this.var_702 = param1.readInteger();
         this.var_1337 = param1.readInteger();
         this.var_1357 = param1.readInteger();
         this.var_1374 = param1.readBoolean();
         this.var_1361 = param1.readString();
         this.var_1350 = param1.readBoolean();
         this.var_1342 = param1.readBoolean();
         return true;
      }
      
      public function get id() : int
      {
         return this.var_247;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_427;
      }
      
      public function get sex() : String
      {
         return this.var_133;
      }
      
      public function get customData() : String
      {
         return this.var_1367;
      }
      
      public function get realName() : String
      {
         return this._realName;
      }
      
      public function get directMail() : Boolean
      {
         return this.var_1400;
      }
      
      public function get respectTotal() : int
      {
         return this.var_702;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1337;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_1357;
      }
      
      public function get streamPublishingAllowed() : Boolean
      {
         return this.var_1374;
      }
      
      public function get lastAccessDate() : String
      {
         return this.var_1361;
      }
      
      public function get nameChangeAllowed() : Boolean
      {
         return this.var_1350;
      }
      
      public function get accountSafetyLocked() : Boolean
      {
         return var_1342;
      }
   }
}
