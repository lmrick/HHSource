package package_50
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1540
   {
       
      
      private var var_339:int;
      
      private var _userName:String;
      
      private var _rooms:Array;
      
      public function class_1540(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         _rooms = [];
         super();
         var_339 = param1.readInteger();
         _userName = param1.readString();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _rooms.push(new class_1644(param1));
            _loc3_++;
         }
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get rooms() : Array
      {
         return _rooms;
      }
   }
}
