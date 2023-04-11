package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1248 implements IMessageParser
   {
       
      
      private var var_490:int;
      
      private var var_47:Number;
      
      public function class_1248()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_490 = -1;
         var_47 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_490 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_47 = _loc2_ / 100;
         return true;
      }
      
      public function get height() : Number
      {
         return var_47;
      }
      
      public function get furniId() : int
      {
         return var_490;
      }
   }
}
