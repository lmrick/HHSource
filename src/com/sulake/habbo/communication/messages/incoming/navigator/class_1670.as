package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1670 implements class_13
   {
       
      
      private var var_713:String;
      
      private var var_1013:String;
      
      private var var_208:package_11.class_1569;
      
      private var _rooms:Array;
      
      private var _open:Boolean;
      
      private var var_819:Boolean;
      
      private var _disposed:Boolean;
      
      public function class_1670(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         _rooms = [];
         super();
         var_713 = param1.readString();
         var_1013 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var_208 = new package_11.class_1569(param1);
         _loc3_ = 1;
         while(_loc3_ < _loc2_)
         {
            _rooms.push(new package_11.class_1569(param1));
            _loc3_++;
         }
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_208)
         {
            var_208.dispose();
            var_208 = null;
         }
         for each(var _loc1_ in rooms)
         {
            _loc1_.dispose();
         }
         _rooms = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get code() : String
      {
         return var_713;
      }
      
      public function get leaderFigure() : String
      {
         return var_1013;
      }
      
      public function get rooms() : Array
      {
         return _rooms;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function set open(param1:Boolean) : void
      {
         _open = param1;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
      
      public function get bestRoom() : package_11.class_1569
      {
         return var_208;
      }
      
      public function get figurePending() : Boolean
      {
         return var_819;
      }
      
      public function set figurePending(param1:Boolean) : void
      {
         var_819 = param1;
      }
   }
}
