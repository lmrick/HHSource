package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1649 implements class_13
   {
       
      
      private var var_269:Array;
      
      private var var_294:Array;
      
      private var var_249:Array;
      
      private var var_1029:Boolean;
      
      private var var_1288:Boolean;
      
      private var var_835:Boolean;
      
      private var var_1250:Boolean;
      
      private var var_899:Boolean;
      
      private var var_950:Boolean;
      
      private var var_721:Boolean;
      
      private var _disposed:Boolean;
      
      public function class_1649(param1:IMessageDataWrapper)
      {
         var _loc4_:int = 0;
         super();
         var _loc2_:class_1515 = new class_1515();
         var_249 = [];
         var_269 = [];
         var_294 = [];
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.parse(param1))
            {
               var_249.push(_loc2_.issueData);
            }
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_269.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            param1.readString();
            _loc4_++;
         }
         var_1029 = param1.readBoolean();
         var_1288 = param1.readBoolean();
         var_835 = param1.readBoolean();
         var_1250 = param1.readBoolean();
         var_899 = param1.readBoolean();
         var_950 = param1.readBoolean();
         var_721 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_294.push(param1.readString());
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_269 = null;
         var_294 = null;
         var_249 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get messageTemplates() : Array
      {
         return var_269;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return var_294;
      }
      
      public function get issues() : Array
      {
         return var_249;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1029;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1288;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_835;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1250;
      }
      
      public function get banPermission() : Boolean
      {
         return var_899;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_950;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_721;
      }
   }
}
