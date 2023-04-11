package package_158
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import flash.utils.Dictionary;
   
   [SecureSWF(rename="true")]
   public class class_1436 implements IMessageParser
   {
       
      
      private var var_517:String = null;
      
      private var var_382:int = -1;
      
      private var var_327:int = -1;
      
      private var _duration:int = -1;
      
      private var _question:Dictionary = null;
      
      public function class_1436()
      {
         super();
      }
      
      public function get pollType() : String
      {
         return var_517;
      }
      
      public function get pollId() : int
      {
         return var_382;
      }
      
      public function get questionId() : int
      {
         return var_327;
      }
      
      public function get duration() : int
      {
         return _duration;
      }
      
      public function get question() : Dictionary
      {
         return _question;
      }
      
      public function flush() : Boolean
      {
         var_517 = null;
         var_382 = -1;
         var_327 = -1;
         _duration = -1;
         _question = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var_517 = param1.readString();
         var_382 = param1.readInteger();
         var_327 = param1.readInteger();
         _duration = param1.readInteger();
         _question = new Dictionary();
         _question["id"] = param1.readInteger();
         _question["number"] = param1.readInteger();
         _question["type"] = param1.readInteger();
         _question["content"] = param1.readString();
         if(false)
         {
            _question["selection_min"] = param1.readInteger();
            _loc2_ = param1.readInteger();
            var _loc4_:* = [];
            var _loc5_:* = [];
            _question["selections"] = _loc4_;
            _question["selection_values"] = _loc5_;
            _question["selection_count"] = _loc2_;
            _question["selection_max"] = _loc2_;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc5_.push(param1.readString());
               _loc4_.push(param1.readString());
               _loc3_++;
            }
         }
         return true;
      }
   }
}
