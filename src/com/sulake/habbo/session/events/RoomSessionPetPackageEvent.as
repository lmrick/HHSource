package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   import package_144.class_1552;
   
   public class RoomSessionPetPackageEvent extends RoomSessionEvent
   {
      
      public static const ROOM_SESSION_OPEN_PET_PACKAGE_REQUESTED:String = "RSOPPE_OPEN_PET_PACKAGE_REQUESTED";
      
      public static const ROOM_SESSION_OPEN_PET_PACKAGE_RESULT:String = "RSOPPE_OPEN_PET_PACKAGE_RESULT";
       
      
      private var var_347:int = -1;
      
      private var var_117:class_1552;
      
      private var _nameValidationStatus:int = 0;
      
      private var _nameValidationInfo:String = null;
      
      public function RoomSessionPetPackageEvent(param1:String, param2:IRoomSession, param3:int, param4:class_1552, param5:int, param6:String, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param2,param7,param8);
         var_347 = param3;
         var_117 = param4;
         _nameValidationStatus = param5;
         _nameValidationInfo = param6;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get figureData() : class_1552
      {
         return var_117;
      }
      
      public function get nameValidationStatus() : int
      {
         return _nameValidationStatus;
      }
      
      public function get nameValidationInfo() : String
      {
         return _nameValidationInfo;
      }
   }
}
