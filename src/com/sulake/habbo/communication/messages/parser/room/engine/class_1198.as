package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1198 implements IMessageParser
   {
       
      
      private var var_247:int;
      
      private var var_427:String;
      
      private var var_133:String;
      
      private var _customInfo:String;
      
      private var _achievementScore:int;
      
      public function class_1198()
      {
         super();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get sex() : String
      {
         return var_133;
      }
      
      public function get customInfo() : String
      {
         return _customInfo;
      }
      
      public function get achievementScore() : int
      {
         return _achievementScore;
      }
      
      public function flush() : Boolean
      {
         var_247 = 0;
         var_427 = "";
         var_133 = "";
         _customInfo = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_247 = param1.readInteger();
         var_427 = param1.readString();
         var_133 = param1.readString();
         _customInfo = param1.readString();
         _achievementScore = param1.readInteger();
         if(var_133)
         {
            var_133 = var_133.toUpperCase();
         }
         return true;
      }
   }
}
