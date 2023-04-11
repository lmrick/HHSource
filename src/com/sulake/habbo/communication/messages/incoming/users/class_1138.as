package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import flash.utils.Dictionary;
   
   [SecureSWF(rename="true")]
   public class class_1138
   {
       
      
      private var _groupId:int;
      
      private var _groupName:String;
      
      private var var_708:int;
      
      private var var_331:String;
      
      private var var_606:int;
      
      private var var_83:Array;
      
      private var var_1077:Boolean;
      
      private var var_671:int;
      
      private var var_559:int;
      
      private var var_804:int;
      
      private var var_938:String;
      
      private var var_275:Dictionary;
      
      public function class_1138(param1:IMessageDataWrapper)
      {
         var _loc4_:int = 0;
         var _loc3_:class_1174 = null;
         var_275 = new Dictionary();
         super();
         _groupId = param1.readInteger();
         _groupName = param1.readString();
         var_708 = param1.readInteger();
         var_331 = param1.readString();
         var_606 = param1.readInteger();
         var_83 = [];
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = new class_1174(param1);
            var_83.push(_loc3_);
            var_275[_loc3_.userId] = _loc3_;
            _loc4_++;
         }
         var_1077 = param1.readBoolean();
         var_671 = param1.readInteger();
         var_559 = param1.readInteger();
         var_804 = param1.readInteger();
         var_938 = param1.readString();
      }
      
      private static function removeFromArray(param1:int, param2:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:class_1174 = null;
         while(_loc4_ < param2.length)
         {
            _loc3_ = param2[_loc4_];
            if(_loc3_.userId == param1)
            {
               param2.splice(_loc4_,1);
            }
            else
            {
               _loc4_++;
            }
         }
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function get groupName() : String
      {
         return _groupName;
      }
      
      public function get baseRoomId() : int
      {
         return var_708;
      }
      
      public function get badgeCode() : String
      {
         return var_331;
      }
      
      public function get totalEntries() : int
      {
         return var_606;
      }
      
      public function get pageSize() : int
      {
         return var_671;
      }
      
      public function get pageIndex() : int
      {
         return var_559;
      }
      
      public function get searchType() : int
      {
         return var_804;
      }
      
      public function get entries() : Array
      {
         return var_83;
      }
      
      public function get allowedToManage() : Boolean
      {
         return var_1077;
      }
      
      public function get userNameFilter() : String
      {
         return var_938;
      }
      
      public function get totalPages() : int
      {
         return Math.max(1,Math.ceil(var_606 / var_671));
      }
      
      public function update(param1:class_1174) : void
      {
         var _loc3_:int = 0;
         var _loc2_:class_1174 = null;
         var_275[param1.userId] = param1;
         while(_loc3_ < var_83.length)
         {
            _loc2_ = var_83[_loc3_];
            if(_loc2_.userId == param1.userId)
            {
               var_83[_loc3_] = param1;
               return;
            }
            _loc3_++;
         }
         var_83.push(param1);
      }
      
      public function remove(param1:int) : void
      {
         removeFromArray(param1,var_83);
         delete var_275[param1];
      }
      
      public function getUser(param1:int) : class_1174
      {
         return var_275[param1];
      }
   }
}
