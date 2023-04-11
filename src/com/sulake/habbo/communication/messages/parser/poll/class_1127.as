package package_158
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1127 implements IMessageParser
   {
       
      
      private var var_247:int = -1;
      
      private var _startMessage:String = "";
      
      private var _endMessage:String = "";
      
      private var var_290:int = 0;
      
      private var _questionArray:Array = null;
      
      private var var_901:Boolean = false;
      
      public function class_1127()
      {
         super();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get startMessage() : String
      {
         return _startMessage;
      }
      
      public function get endMessage() : String
      {
         return _endMessage;
      }
      
      public function get numQuestions() : int
      {
         return var_290;
      }
      
      public function get questionArray() : Array
      {
         return _questionArray;
      }
      
      public function get npsPoll() : Boolean
      {
         return var_901;
      }
      
      public function flush() : Boolean
      {
         var_247 = -1;
         _startMessage = "";
         _endMessage = "";
         var_290 = 0;
         _questionArray = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var _loc4_:class_1558 = null;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var_247 = param1.readInteger();
         _startMessage = param1.readString();
         _endMessage = param1.readString();
         var_290 = param1.readInteger();
         _questionArray = [];
         _loc2_ = 0;
         while(_loc2_ < var_290)
         {
            _loc4_ = parseQuestion(param1);
            _loc5_ = param1.readInteger();
            _loc3_ = 0;
            while(_loc3_ < _loc5_)
            {
               _loc4_.children.push(parseQuestion(param1));
               _loc3_++;
            }
            _questionArray.push(_loc4_);
            _loc2_++;
         }
         var_901 = param1.readBoolean();
         return true;
      }
      
      private function parseQuestion(param1:IMessageDataWrapper) : class_1558
      {
         var _loc2_:int = 0;
         var _loc3_:class_1558 = new class_1558();
         _loc3_.questionId = param1.readInteger();
         _loc3_.sortOrder = param1.readInteger();
         _loc3_.questionType = param1.readInteger();
         _loc3_.questionText = param1.readString();
         _loc3_.questionCategory = param1.readInteger();
         _loc3_.questionAnswerType = param1.readInteger();
         _loc3_.questionAnswerCount = param1.readInteger();
         if(_loc3_.questionType == 1 || _loc3_.questionType == 2)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_.questionAnswerCount)
            {
               _loc3_.questionChoices.push(new class_1579(param1.readString(),param1.readString(),param1.readInteger()));
               _loc2_++;
            }
         }
         return _loc3_;
      }
   }
}
