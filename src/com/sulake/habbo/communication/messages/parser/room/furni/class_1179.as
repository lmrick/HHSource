package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_25.class_1620;
   
   [SecureSWF(rename="true")]
   public class class_1179 implements IMessageParser
   {
       
      
      private var var_1005:int = 0;
      
      private var var_193:Array;
      
      public function class_1179()
      {
         var_193 = [];
         super();
      }
      
      public function get presetCount() : int
      {
         return var_193.length;
      }
      
      public function get selectedPresetId() : int
      {
         return var_1005;
      }
      
      public function getPreset(param1:int) : class_1620
      {
         if(param1 < 0 || param1 >= presetCount)
         {
            return null;
         }
         return var_193[param1];
      }
      
      public function flush() : Boolean
      {
         var_193 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:String = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc8_:class_1620 = null;
         var _loc4_:int = param1.readInteger();
         var_1005 = param1.readInteger();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = param1.readInteger();
            _loc9_ = param1.readInteger();
            _loc6_ = param1.readString();
            _loc2_ = parseInt(_loc6_.substr(1),16);
            _loc3_ = param1.readInteger();
            (_loc8_ = new class_1620(_loc7_)).type = _loc9_;
            _loc8_.color = _loc2_;
            _loc8_.light = _loc3_;
            _loc8_.setReadOnly();
            var_193.push(_loc8_);
            _loc5_++;
         }
         return true;
      }
   }
}
