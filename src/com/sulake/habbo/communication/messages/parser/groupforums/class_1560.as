package package_155
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1560
   {
       
      
      private var _groupId:int;
      
      private var var_251:int;
      
      private var var_765:int;
      
      private var var_794:int;
      
      private var var_284:int;
      
      private var _creationTime:int;
      
      private var var_330:String;
      
      private var var_1241:String;
      
      private var var_974:String;
      
      private var var_159:int;
      
      private var var_1046:int;
      
      private var var_1276:String;
      
      private var var_730:int;
      
      private var var_1207:int;
      
      public function class_1560()
      {
         super();
      }
      
      public static function readFromMessage(param1:IMessageDataWrapper) : class_1560
      {
         var _loc2_:class_1560 = new class_1560();
         _loc2_.messageId = param1.readInteger();
         _loc2_.messageIndex = param1.readInteger();
         _loc2_.authorId = param1.readInteger();
         _loc2_.authorName = param1.readString();
         _loc2_.authorFigure = param1.readString();
         _loc2_.creationTimeAsSecondsAgo = param1.readInteger();
         _loc2_.messageText = param1.readString();
         _loc2_.state = param1.readByte();
         _loc2_.adminId = param1.readInteger();
         _loc2_.adminName = param1.readString();
         _loc2_.adminOperationTimeAsSeccondsAgo = param1.readInteger();
         _loc2_.authorPostCount = param1.readInteger();
         return _loc2_;
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
      
      public function get adminOperationTimeAsSeccondsAgo() : int
      {
         return var_730;
      }
      
      public function set adminOperationTimeAsSeccondsAgo(param1:int) : void
      {
         var_730 = param1;
      }
      
      public function get MessageId() : int
      {
         return var_251;
      }
      
      public function set MessageId(param1:int) : void
      {
         var_251 = param1;
      }
      
      public function get creationTime() : int
      {
         return _creationTime;
      }
      
      public function set creationTime(param1:int) : void
      {
         _creationTime = param1;
      }
      
      public function get authorName() : String
      {
         return var_1241;
      }
      
      public function set authorName(param1:String) : void
      {
         var_1241 = param1;
      }
      
      public function get authorFigure() : String
      {
         return var_974;
      }
      
      public function set authorFigure(param1:String) : void
      {
         var_974 = param1;
      }
      
      public function get threadId() : int
      {
         return var_284;
      }
      
      public function set threadId(param1:int) : void
      {
         var_284 = param1;
      }
      
      public function get messageId() : int
      {
         return var_251;
      }
      
      public function set messageId(param1:int) : void
      {
         var_251 = param1;
      }
      
      public function get messageIndex() : int
      {
         return var_765;
      }
      
      public function set messageIndex(param1:int) : void
      {
         var_765 = param1;
      }
      
      public function set groupID(param1:int) : void
      {
         _groupId = param1;
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function get authorId() : int
      {
         return var_794;
      }
      
      public function set authorId(param1:int) : void
      {
         var_794 = param1;
      }
      
      public function get creationTimeAsSecondsAgo() : int
      {
         return _creationTime;
      }
      
      public function set creationTimeAsSecondsAgo(param1:int) : void
      {
         _creationTime = param1;
      }
      
      public function get messageText() : String
      {
         return var_330;
      }
      
      public function set messageText(param1:String) : void
      {
         var_330 = param1;
      }
      
      public function get authorPostCount() : int
      {
         return var_1207;
      }
      
      public function set authorPostCount(param1:int) : void
      {
         var_1207 = param1;
      }
   }
}
