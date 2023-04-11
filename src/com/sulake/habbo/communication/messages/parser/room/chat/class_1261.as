package package_164
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1261 implements IMessageParser
   {
       
      
      private var var_339:int = 0;
      
      private var _text:String = "";
      
      private var var_321:Array;
      
      private var var_535:int = 0;
      
      private var var_1100:int = -1;
      
      private var var_696:int = 0;
      
      public function class_1261()
      {
         super();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      public function get links() : Array
      {
         return var_321;
      }
      
      public function get gesture() : int
      {
         return var_535;
      }
      
      public function get trackingId() : int
      {
         return var_1100;
      }
      
      public function get styleId() : int
      {
         return var_696;
      }
      
      public function flush() : Boolean
      {
         var_339 = 0;
         _text = "";
         var_535 = 0;
         var_321 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         if(param1 == null)
         {
            return false;
         }
         var_339 = param1.readInteger();
         _text = param1.readString();
         var_535 = param1.readInteger();
         var_696 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         if(_loc2_ > 0)
         {
            var_321 = [];
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               var_321.push([param1.readString(),param1.readString(),param1.readBoolean()]);
               _loc3_++;
            }
         }
         var_1100 = param1.readInteger();
         return true;
      }
   }
}
