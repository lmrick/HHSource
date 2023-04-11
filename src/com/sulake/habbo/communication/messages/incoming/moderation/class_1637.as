package package_50
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1637 implements class_13
   {
       
      
      private var _flatId:int;
      
      private var var_392:int;
      
      private var var_895:Boolean;
      
      private var var_684:int;
      
      private var _ownerName:String;
      
      private var var_189:package_50.class_1655;
      
      private var _disposed:Boolean;
      
      public function class_1637(param1:IMessageDataWrapper)
      {
         super();
         _flatId = param1.readInteger();
         var_392 = param1.readInteger();
         var_895 = param1.readBoolean();
         var_684 = param1.readInteger();
         _ownerName = param1.readString();
         var_189 = new package_50.class_1655(param1);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_189 != null)
         {
            var_189.dispose();
            var_189 = null;
         }
      }
      
      public function get flatId() : int
      {
         return _flatId;
      }
      
      public function get userCount() : int
      {
         return var_392;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_895;
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get room() : package_50.class_1655
      {
         return var_189;
      }
   }
}
