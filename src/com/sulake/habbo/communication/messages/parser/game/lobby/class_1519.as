package package_173
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1519 implements IMessageParser
   {
       
      
      private var _stuffId:int;
      
      private var var_442:int;
      
      private var var_548:String;
      
      private var var_486:int;
      
      private var var_334:int;
      
      private var _endTime:int;
      
      public function class_1519()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _stuffId = -1;
         var_442 = 0;
         var_548 = "";
         var_486 = 0;
         var_334 = 0;
         _endTime = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _stuffId = param1.readInteger();
         var_442 = param1.readInteger();
         var_548 = param1.readString();
         var_486 = param1.readInteger();
         var_334 = param1.readInteger();
         _endTime = param1.readInteger();
         return true;
      }
      
      public function get stuffId() : int
      {
         return _stuffId;
      }
      
      public function get achievementId() : int
      {
         return var_442;
      }
      
      public function get requiredLevelBadgeCode() : String
      {
         return var_548;
      }
      
      public function get userProgress() : int
      {
         return var_486;
      }
      
      public function get totalProgress() : int
      {
         return var_334;
      }
      
      public function get endTime() : int
      {
         return _endTime;
      }
   }
}
