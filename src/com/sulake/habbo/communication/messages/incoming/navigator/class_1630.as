package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1630 implements class_13, class_1556
   {
       
      
      private var var_804:int;
      
      private var var_1203:String;
      
      private var _rooms:Array;
      
      private var var_226:package_11.class_1549;
      
      private var _disposed:Boolean;
      
      public function class_1630(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         _rooms = [];
         super();
         var_804 = param1.readInteger();
         var_1203 = param1.readString();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _rooms.push(new class_1569(param1));
            _loc3_++;
         }
         var _loc4_:Boolean;
         if(_loc4_ = param1.readBoolean())
         {
            var_226 = new package_11.class_1549(param1);
         }
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this._rooms != null)
         {
            for each(var _loc1_ in this._rooms)
            {
               _loc1_.dispose();
            }
         }
         if(var_226 != null)
         {
            var_226.dispose();
            var_226 = null;
         }
         this._rooms = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get searchType() : int
      {
         return var_804;
      }
      
      public function get searchParam() : String
      {
         return var_1203;
      }
      
      public function get rooms() : Array
      {
         return _rooms;
      }
      
      public function get ad() : package_11.class_1549
      {
         return var_226;
      }
   }
}
