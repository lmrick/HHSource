package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.runtime.class_13;
   import package_11.class_1569;
   import package_78.class_1621;
   import package_78.class_1622;
   
   [SecureSWF(rename="true")]
   public class class_1084 implements IMessageParser, class_13
   {
       
      
      private var var_1389:Boolean;
      
      private var var_1353:Boolean;
      
      private var var_1352:Boolean;
      
      private var var_45:class_1569;
      
      private var var_1391:Boolean;
      
      private var var_412:class_1621;
      
      private var var_569:class_1622;
      
      public function class_1084()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1389 = param1.readBoolean();
         this.var_45 = new class_1569(param1);
         this.var_1353 = param1.readBoolean();
         this.var_1352 = param1.readBoolean();
         this.var_1391 = param1.readBoolean();
         var _loc2_:Boolean = param1.readBoolean();
         this.var_412 = new class_1621(param1);
         this.var_45.allInRoomMuted = _loc2_;
         this.var_45.canMute = param1.readBoolean();
         this.var_569 = new class_1622(param1);
         return true;
      }
      
      public function dispose() : void
      {
         var_412 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_412 == null;
      }
      
      public function get enterRoom() : Boolean
      {
         return var_1389;
      }
      
      public function get data() : class_1569
      {
         return var_45;
      }
      
      public function get roomForward() : Boolean
      {
         return var_1353;
      }
      
      public function get staffPick() : Boolean
      {
         return var_1352;
      }
      
      public function get isGroupMember() : Boolean
      {
         return var_1391;
      }
      
      public function get roomModerationSettings() : class_1621
      {
         return var_412;
      }
      
      public function get chatSettings() : class_1622
      {
         return var_569;
      }
   }
}
