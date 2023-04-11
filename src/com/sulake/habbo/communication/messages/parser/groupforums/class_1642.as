package package_155
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1642 extends class_1641
   {
       
      
      private var var_1372:int;
      
      private var var_1390:int;
      
      private var var_1392:int;
      
      private var var_1341:int;
      
      private var var_779:String;
      
      private var var_754:String;
      
      private var var_1090:String;
      
      private var var_1204:String;
      
      private var var_1396:String;
      
      private var var_1363:Boolean;
      
      private var var_1347:Boolean;
      
      public function class_1642()
      {
         super();
      }
      
      public static function readFromMessage(param1:IMessageDataWrapper) : class_1642
      {
         var _loc2_:class_1642 = new class_1642();
         class_1641.fillFromMessage(_loc2_,param1);
         _loc2_.var_1372 = param1.readInteger();
         _loc2_.var_1390 = param1.readInteger();
         _loc2_.var_1392 = param1.readInteger();
         _loc2_.var_1341 = param1.readInteger();
         _loc2_.var_779 = param1.readString();
         _loc2_.var_754 = param1.readString();
         _loc2_.var_1090 = param1.readString();
         _loc2_.var_1204 = param1.readString();
         _loc2_.var_1396 = param1.readString();
         _loc2_.var_1363 = param1.readBoolean();
         _loc2_.var_1347 = param1.readBoolean();
         return _loc2_;
      }
      
      public function get readPermissions() : int
      {
         return var_1372;
      }
      
      public function get postMessagePermissions() : int
      {
         return var_1390;
      }
      
      public function get postThreadPermissions() : int
      {
         return var_1392;
      }
      
      public function get moderatePermissions() : int
      {
         return var_1341;
      }
      
      public function get canRead() : Boolean
      {
         return false;
      }
      
      public function get canReport() : Boolean
      {
         return true;
      }
      
      public function get canPostMessage() : Boolean
      {
         return false;
      }
      
      public function get canPostThread() : Boolean
      {
         return false;
      }
      
      public function get canModerate() : Boolean
      {
         return false;
      }
      
      public function get canChangeSettings() : Boolean
      {
         return var_1363;
      }
      
      public function get isStaff() : Boolean
      {
         return var_1347;
      }
      
      public function get readPermissionError() : String
      {
         return var_779;
      }
      
      public function get postMessagePermissionError() : String
      {
         return var_754;
      }
      
      public function get postThreadPermissionError() : String
      {
         return var_1090;
      }
      
      public function get moderatePermissionError() : String
      {
         return var_1204;
      }
      
      public function get reportPermissionError() : String
      {
         return var_1396;
      }
   }
}
