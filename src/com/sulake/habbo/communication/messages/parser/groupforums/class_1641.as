package package_155
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1641
   {
       
      
      private var _groupId:int;
      
      private var _name:String;
      
      private var _description:String;
      
      private var _icon:String;
      
      private var var_151:int;
      
      private var var_1397:int;
      
      private var var_113:int;
      
      private var var_68:int;
      
      private var var_220:int;
      
      private var var_182:int;
      
      private var var_188:String;
      
      private var var_184:int;
      
      public function class_1641()
      {
         super();
      }
      
      public static function readFromMessage(param1:IMessageDataWrapper) : class_1641
      {
         return fillFromMessage(new class_1641(),param1);
      }
      
      internal static function fillFromMessage(param1:class_1641, param2:IMessageDataWrapper) : class_1641
      {
         param1._groupId = param2.readInteger();
         param1._name = param2.readString();
         param1._description = param2.readString();
         param1._icon = param2.readString();
         param1.var_151 = param2.readInteger();
         param1.var_1397 = param2.readInteger();
         param1.var_113 = param2.readInteger();
         param1.var_68 = param2.readInteger();
         param1.var_220 = param2.readInteger();
         param1.var_182 = param2.readInteger();
         param1.var_188 = param2.readString();
         param1.var_184 = param2.readInteger();
         return param1;
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function get icon() : String
      {
         return _icon;
      }
      
      public function get totalThreads() : int
      {
         return var_151;
      }
      
      public function get leaderboardScore() : int
      {
         return var_1397;
      }
      
      public function get totalMessages() : int
      {
         return var_113;
      }
      
      public function get unreadMessages() : int
      {
         return var_68;
      }
      
      public function get lastMessageId() : int
      {
         return var_220;
      }
      
      public function get lastMessageAuthorId() : int
      {
         return var_182;
      }
      
      public function get lastMessageAuthorName() : String
      {
         return var_188;
      }
      
      public function get lastMessageTimeAsSecondsAgo() : int
      {
         return var_184;
      }
      
      public function updateFrom(param1:class_1641) : void
      {
         var_151 = param1.var_151;
         var_113 = param1.var_113;
         var_68 = param1.var_68;
         var_182 = param1.var_182;
         var_188 = param1.var_188;
         var_220 = param1.var_220;
         var_184 = param1.var_184;
      }
      
      public function get lastReadMessageId() : int
      {
         return var_113 - var_68;
      }
      
      public function set lastReadMessageId(param1:int) : void
      {
         var_68 = var_113 - param1;
         if(var_68 < 0)
         {
            var_68 = 0;
         }
      }
      
      public function addNewThread(param1:class_1629) : void
      {
         var_182 = param1.lastMessageAuthorId;
         var_188 = param1.lastMessageAuthorName;
         var_220 = param1.lastMessageId;
         var_184 = param1.lastMessageTimeAsSecondsAgo;
         var_151++;
         var_113++;
         var_68 = 0;
      }
   }
}
