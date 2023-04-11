package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1352 implements IMessageParser
   {
       
      
      private var var_413:int;
      
      private var var_1334:Array;
      
      public function class_1352()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1334 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.var_413 = param1.readInteger();
         if(this.var_413 == 1)
         {
            _loc2_ = param1.readInteger();
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               this.var_1334.push(param1.readInteger());
               _loc3_++;
            }
         }
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_413;
      }
      
      public function get failedRecipients() : Array
      {
         return this.var_1334;
      }
   }
}
