package package_149
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1088 implements IMessageParser
   {
       
      
      private var var_455:String;
      
      private var var_262:int;
      
      private var var_315:Vector.<package_149.class_1643>;
      
      private var var_304:Vector.<package_149.class_1591>;
      
      public function class_1088()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_455 = null;
         var_315 = null;
         var_304 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_455 = param1.readString();
         var_262 = param1.readInteger();
         var_315 = new Vector.<package_149.class_1643>();
         var _loc4_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            var_315.push(new package_149.class_1643(param1));
            _loc3_++;
         }
         var_304 = new Vector.<package_149.class_1591>();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_304.push(new package_149.class_1591(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get talentTrackName() : String
      {
         return var_455;
      }
      
      public function get level() : int
      {
         return var_262;
      }
      
      public function get rewardPerks() : Vector.<package_149.class_1643>
      {
         return var_315;
      }
      
      public function get rewardProducts() : Vector.<package_149.class_1591>
      {
         return var_304;
      }
   }
}
