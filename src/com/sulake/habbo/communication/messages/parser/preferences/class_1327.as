package package_174
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1327 implements IMessageParser
   {
       
      
      private var _traxVolume:int;
      
      private var _furniVolume:int;
      
      private var _uiVolume:int;
      
      private var var_483:Boolean;
      
      private var var_1070:Boolean;
      
      private var var_539:Boolean;
      
      private var var_463:int;
      
      private var var_345:int;
      
      public function class_1327()
      {
         super();
      }
      
      public function get traxVolume() : int
      {
         return _traxVolume;
      }
      
      public function get furniVolume() : int
      {
         return _furniVolume;
      }
      
      public function get uiVolume() : int
      {
         return _uiVolume;
      }
      
      public function get freeFlowChatDisabled() : Boolean
      {
         return var_483;
      }
      
      public function get roomInvitesIgnored() : Boolean
      {
         return var_1070;
      }
      
      public function get roomCameraFollowDisabled() : Boolean
      {
         return var_539;
      }
      
      public function get uiFlags() : int
      {
         return var_463;
      }
      
      public function get preferedChatStyle() : int
      {
         return var_345;
      }
      
      public function flush() : Boolean
      {
         var_483 = false;
         var_539 = false;
         var_463 = 0;
         var_345 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _uiVolume = param1.readInteger();
         _furniVolume = param1.readInteger();
         _traxVolume = param1.readInteger();
         var_483 = param1.readBoolean();
         var_1070 = param1.readBoolean();
         var_539 = param1.readBoolean();
         var_463 = param1.readInteger();
         var_345 = param1.readInteger();
         return true;
      }
   }
}
