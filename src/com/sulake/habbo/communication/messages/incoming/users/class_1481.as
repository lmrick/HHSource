package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1481
   {
       
      
      private var var_339:int;
      
      private var _userName:String;
      
      private var var_427:String;
      
      private var var_904:String;
      
      private var var_1033:String;
      
      private var _achievementScore:int;
      
      private var var_734:int;
      
      private var var_1087:Boolean;
      
      private var var_329:Boolean;
      
      private var var_1328:Boolean;
      
      private var var_292:Array;
      
      private var var_877:int;
      
      private var var_945:Boolean;
      
      private var var_1383:Boolean;
      
      private var var_1147:int;
      
      private var var_1377:int;
      
      private var var_1120:int;
      
      private var var_1385:Boolean;
      
      private var var_1339:Boolean;
      
      public function class_1481(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         var_292 = [];
         super();
         var_339 = param1.readInteger();
         _userName = param1.readString();
         var_427 = param1.readString();
         var_904 = param1.readString();
         var_1033 = param1.readString();
         _achievementScore = param1.readInteger();
         var_734 = param1.readInteger();
         var_1087 = param1.readBoolean();
         var_329 = param1.readBoolean();
         var_1328 = param1.readBoolean();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_292.push(new class_1633(param1));
            _loc3_++;
         }
         var_877 = param1.readInteger();
         var_945 = param1.readBoolean();
         if(param1.bytesAvailable)
         {
            var_1383 = param1.readBoolean();
            var_1147 = param1.readInteger();
            var_1377 = param1.readInteger();
            var_1120 = param1.readInteger();
            var_1385 = param1.readBoolean();
            var_1339 = param1.readBoolean();
         }
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get motto() : String
      {
         return var_904;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get creationDate() : String
      {
         return var_1033;
      }
      
      public function get achievementScore() : int
      {
         return _achievementScore;
      }
      
      public function get friendCount() : int
      {
         return var_734;
      }
      
      public function get isFriend() : Boolean
      {
         return var_1087;
      }
      
      public function get isFriendRequestSent() : Boolean
      {
         return var_329;
      }
      
      public function get isOnline() : Boolean
      {
         return var_1328;
      }
      
      public function get guilds() : Array
      {
         return var_292;
      }
      
      public function set isFriendRequestSent(param1:Boolean) : void
      {
         var_329 = param1;
      }
      
      public function get lastAccessSinceInSeconds() : int
      {
         return var_877;
      }
      
      public function get openProfileWindow() : Boolean
      {
         return var_945;
      }
      
      public function get accountLevel() : int
      {
         return var_1147;
      }
      
      public function get starGemCount() : int
      {
         return var_1120;
      }
   }
}
