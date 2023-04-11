package package_155
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1629
   {
       
      
      private var var_284:int;
      
      private var var_892:int;
      
      private var var_1301:String;
      
      private var var_1243:int;
      
      private var _header:String;
      
      private var var_681:int;
      
      private var var_1042:int;
      
      private var var_220:int;
      
      private var var_182:int;
      
      private var var_188:String;
      
      private var var_184:int;
      
      private var var_159:int;
      
      private var var_1046:int;
      
      private var var_1276:String;
      
      private var var_1206:int;
      
      private var var_830:Boolean;
      
      private var var_1297:Boolean;
      
      public function class_1629()
      {
         super();
      }
      
      public static function readFromMessage(param1:IMessageDataWrapper) : class_1629
      {
         var _loc2_:class_1629 = new class_1629();
         _loc2_.threadId = param1.readInteger();
         _loc2_.threadAuthorId = param1.readInteger();
         _loc2_.threadAuthorName = param1.readString();
         _loc2_.header = param1.readString();
         _loc2_.isSticky = param1.readBoolean();
         _loc2_.isLocked = param1.readBoolean();
         _loc2_.creationTimeAsSecondsAgo = param1.readInteger();
         _loc2_.nMessages = param1.readInteger();
         _loc2_.nUnreadMessages = param1.readInteger();
         _loc2_.lastMessageId = param1.readInteger();
         _loc2_.lastMessageAuthorId = param1.readInteger();
         _loc2_.lastMessageAuthorName = param1.readString();
         _loc2_.lastMessageTimeAsSecondsAgo = param1.readInteger();
         _loc2_.state = param1.readByte();
         _loc2_.adminId = param1.readInteger();
         _loc2_.adminName = param1.readString();
         _loc2_.adminOperationTimeAsSecondsAgo = param1.readInteger();
         return _loc2_;
      }
      
      public function get adminOperationTimeAsSecondsAgo() : int
      {
         return var_1206;
      }
      
      public function set adminOperationTimeAsSecondsAgo(param1:int) : void
      {
         var_1206 = param1;
      }
      
      public function get lastMessageTimeAsSecondsAgo() : int
      {
         return var_184;
      }
      
      public function set lastMessageTimeAsSecondsAgo(param1:int) : void
      {
         var_184 = param1;
      }
      
      public function get threadId() : int
      {
         return var_284;
      }
      
      public function set threadId(param1:int) : void
      {
         var_284 = param1;
      }
      
      public function get threadAuthorId() : int
      {
         return var_892;
      }
      
      public function set threadAuthorId(param1:int) : void
      {
         var_892 = param1;
      }
      
      public function get threadAuthorName() : String
      {
         return var_1301;
      }
      
      public function set threadAuthorName(param1:String) : void
      {
         var_1301 = param1;
      }
      
      public function get creationTimeAsSecondsAgo() : int
      {
         return var_1243;
      }
      
      public function set creationTimeAsSecondsAgo(param1:int) : void
      {
         var_1243 = param1;
      }
      
      public function get header() : String
      {
         return _header;
      }
      
      public function set header(param1:String) : void
      {
         _header = param1;
      }
      
      public function get lastMessageId() : int
      {
         return var_220;
      }
      
      public function set lastMessageId(param1:int) : void
      {
         var_220 = param1;
      }
      
      public function get lastMessageAuthorId() : int
      {
         return var_182;
      }
      
      public function set lastMessageAuthorId(param1:int) : void
      {
         var_182 = param1;
      }
      
      public function get lastMessageAuthorName() : String
      {
         return var_188;
      }
      
      public function set lastMessageAuthorName(param1:String) : void
      {
         var_188 = param1;
      }
      
      public function get nMessages() : int
      {
         return var_681;
      }
      
      public function set nMessages(param1:int) : void
      {
         var_681 = param1;
      }
      
      public function get nUnreadMessages() : int
      {
         return var_1042;
      }
      
      public function set nUnreadMessages(param1:int) : void
      {
         var_1042 = param1;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function set state(param1:int) : void
      {
         var_159 = param1;
      }
      
      public function get adminId() : int
      {
         return var_1046;
      }
      
      public function set adminId(param1:int) : void
      {
         var_1046 = param1;
      }
      
      public function get adminName() : String
      {
         return var_1276;
      }
      
      public function set adminName(param1:String) : void
      {
         var_1276 = param1;
      }
      
      public function get isSticky() : Boolean
      {
         return var_830;
      }
      
      public function set isSticky(param1:Boolean) : void
      {
         var_830 = param1;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1297;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1297 = param1;
      }
   }
}
