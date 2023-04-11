package com.sulake.habbo.help.guidehelp
{
   public class GuideSessionData
   {
      
      public static const ROLE_UNDECIDED:uint = 0;
      
      public static const ROLE_GUIDE:uint = 1;
      
      public static const ROLE_USER:uint = 2;
      
      public static const const_790:int = 0;
      
      public static const const_496:int = 1;
      
      public static const const_1056:int = 2;
       
      
      private var var_3525:uint = 0;
      
      private var var_1991:String = "";
      
      private var var_2366:uint = 0;
      
      private var _requestDescription:String = "";
      
      private var var_339:uint = 0;
      
      private var _userName:String = "";
      
      private var var_4204:String = "";
      
      private var var_2656:uint = 0;
      
      private var _guideName:String = "";
      
      private var var_1036:String = "";
      
      public function GuideSessionData()
      {
         super();
      }
      
      public function isActiveSession() : Boolean
      {
         return isActiveUserSession() || isActiveGuideSession();
      }
      
      public function isActiveUserSession() : Boolean
      {
         return var_3525 == 2 && (var_1991 == "user_create" || var_1991 == "user_pending" || var_1991 == "user_ongoing" || var_1991 == "user_feedback");
      }
      
      public function isActiveGuideSession() : Boolean
      {
         return var_3525 == 1 && (var_1991 == "guide_accept" || var_1991 == "guide_ongoing" || var_1991 == "guide_closed");
      }
      
      public function isOnGoingSession() : Boolean
      {
         return var_1991 == "guide_ongoing" || var_1991 == "user_ongoing";
      }
      
      public function set role(param1:uint) : void
      {
         var_3525 = param1;
      }
      
      public function get activeWindow() : String
      {
         return var_1991;
      }
      
      public function set activeWindow(param1:String) : void
      {
         var_1991 = param1;
      }
      
      public function get requestType() : uint
      {
         return var_2366;
      }
      
      public function set requestType(param1:uint) : void
      {
         var_2366 = param1;
      }
      
      public function get requestDescription() : String
      {
         return _requestDescription;
      }
      
      public function set requestDescription(param1:String) : void
      {
         _requestDescription = param1;
      }
      
      public function get userId() : uint
      {
         return var_339;
      }
      
      public function set userId(param1:uint) : void
      {
         var_339 = param1;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function set userName(param1:String) : void
      {
         _userName = param1;
      }
      
      public function get userFigure() : String
      {
         return var_4204;
      }
      
      public function set userFigure(param1:String) : void
      {
         var_4204 = param1;
      }
      
      public function get guideId() : uint
      {
         return var_2656;
      }
      
      public function set guideId(param1:uint) : void
      {
         var_2656 = param1;
      }
      
      public function get guideName() : String
      {
         return _guideName;
      }
      
      public function set guideName(param1:String) : void
      {
         _guideName = param1;
      }
      
      public function get guideFigure() : String
      {
         return var_1036;
      }
      
      public function set guideFigure(param1:String) : void
      {
         var_1036 = param1;
      }
   }
}
