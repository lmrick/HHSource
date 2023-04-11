package package_79
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1554
   {
       
      
      private var var_1079:Boolean;
      
      private var var_927:int;
      
      private var var_601:Array;
      
      private var var_247:int;
      
      private var var_1284:String;
      
      private var var_532:Array;
      
      private var var_845:int;
      
      private var var_407:int;
      
      public function class_1554(param1:IMessageDataWrapper)
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var_601 = [];
         var_532 = [];
         super();
         var_1079 = param1.readBoolean();
         var_927 = param1.readInteger();
         var _loc5_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc2_ = param1.readInteger();
            var_601.push(_loc2_);
            _loc4_++;
         }
         var_845 = param1.readInteger();
         var_247 = param1.readInteger();
         var_1284 = param1.readString();
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_532.push(param1.readInteger());
            _loc4_++;
         }
         var_407 = param1.readInteger();
      }
      
      public function get stuffTypeSelectionEnabled() : Boolean
      {
         return var_1079;
      }
      
      public function get stuffTypeSelectionCode() : int
      {
         return var_407;
      }
      
      public function set stuffTypeSelectionCode(param1:int) : void
      {
         var_407 = param1;
      }
      
      public function get furniLimit() : int
      {
         return var_927;
      }
      
      public function get stuffIds() : Array
      {
         return var_601;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get stringParam() : String
      {
         return var_1284;
      }
      
      public function get intParams() : Array
      {
         return var_532;
      }
      
      public function get code() : int
      {
         return 0;
      }
      
      public function get stuffTypeId() : int
      {
         return var_845;
      }
      
      public function getBoolean(param1:int) : Boolean
      {
         return false;
      }
   }
}
