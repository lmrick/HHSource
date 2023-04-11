package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1549 implements class_13
   {
      
      public static const const_300:int = 1;
      
      public static const const_81:int = 2;
      
      public static const const_130:int = 4;
       
      
      private var _index:int;
      
      private var var_849:String;
      
      private var var_735:String;
      
      private var var_1190:Boolean;
      
      private var var_955:String;
      
      private var var_1248:String;
      
      private var var_1021:int;
      
      private var var_392:int;
      
      private var var_271:int;
      
      private var var_1290:String;
      
      private var var_229:package_11.class_1569;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function class_1549(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_849 = param1.readString();
         var_735 = param1.readString();
         var_1190 = param1.readInteger() == 1;
         var_955 = param1.readString();
         var_1248 = param1.readString();
         var_1021 = param1.readInteger();
         var_392 = param1.readInteger();
         var_271 = param1.readInteger();
         if(var_271 == 1)
         {
            var_1290 = param1.readString();
         }
         else if(var_271 == 2)
         {
            var_229 = new package_11.class_1569(param1);
         }
         else
         {
            _open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_229 != null)
         {
            this.var_229.dispose();
            this.var_229 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get popupCaption() : String
      {
         return var_849;
      }
      
      public function get popupDesc() : String
      {
         return var_735;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1190;
      }
      
      public function get picText() : String
      {
         return var_955;
      }
      
      public function get picRef() : String
      {
         return var_1248;
      }
      
      public function get folderId() : int
      {
         return var_1021;
      }
      
      public function get tag() : String
      {
         return var_1290;
      }
      
      public function get userCount() : int
      {
         return var_392;
      }
      
      public function get guestRoomData() : package_11.class_1569
      {
         return var_229;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == 1)
         {
            return 0;
         }
         if(this.type == 2)
         {
            return this.var_229.maxUserCount;
         }
         return 0;
      }
   }
}
