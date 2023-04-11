package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1109 implements IMessageParser
   {
       
      
      private var var_762:Boolean;
      
      private var var_1320:int;
      
      private var var_624:Array;
      
      private var var_630:Array;
      
      private var var_653:Array;
      
      private var var_647:Array;
      
      public function class_1109()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return var_762;
      }
      
      public function get wrappingPrice() : int
      {
         return var_1320;
      }
      
      public function get stuffTypes() : Array
      {
         return var_624;
      }
      
      public function get boxTypes() : Array
      {
         return var_630;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_653;
      }
      
      public function get defaultStuffTypes() : Array
      {
         return var_647;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_624 = [];
         var_630 = [];
         var_653 = [];
         var_647 = [];
         var_762 = param1.readBoolean();
         var_1320 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_624.push(param1.readInteger());
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_630.push(param1.readInteger());
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_653.push(param1.readInteger());
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_647.push(param1.readInteger());
            _loc3_++;
         }
         return true;
      }
   }
}
