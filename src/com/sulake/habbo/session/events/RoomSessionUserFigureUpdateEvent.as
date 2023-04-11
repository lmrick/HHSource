package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const USER_FIGURE:String = "RSUBE_FIGURE";
       
      
      private var var_339:int = 0;
      
      private var var_427:String = "";
      
      private var var_122:String = "";
      
      private var _customInfo:String = "";
      
      private var _achievementScore:int;
      
      public function RoomSessionUserFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:String, param5:String, param6:int, param7:Boolean = false, param8:Boolean = false)
      {
         super("RSUBE_FIGURE",param1,param7,param8);
         var_339 = param2;
         var_427 = param3;
         var_122 = param4;
         _customInfo = param5;
         _achievementScore = param6;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function get customInfo() : String
      {
         return _customInfo;
      }
      
      public function get achievementScore() : int
      {
         return _achievementScore;
      }
   }
}
