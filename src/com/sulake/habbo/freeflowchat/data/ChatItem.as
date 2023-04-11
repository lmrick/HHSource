package com.sulake.habbo.freeflowchat.data
{
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import com.sulake.room.utils.IVector3d;
   
   public class ChatItem
   {
       
      
      private var var_578:int = 0;
      
      private var var_339:int = 0;
      
      private var var_354:int = 0;
      
      private var _text:String = "";
      
      private var var_1898:int = 0;
      
      private var var_321:Array;
      
      private var _style:int;
      
      private var _userLocation:IVector3d;
      
      private var _forcedColor;
      
      private var _forcedScreenLocation;
      
      private var var_4055:String;
      
      private var _forcedUserName:String;
      
      private var var_388:int;
      
      public function ChatItem(param1:RoomSessionChatEvent, param2:int, param3:IVector3d = null, param4:int = 0, param5:* = null, param6:* = null, param7:String = null, param8:String = null)
      {
         super();
         var_578 = param2;
         _userLocation = param3;
         var_339 = param1.userId;
         if(param1.session)
         {
            var_354 = param1.session.roomId;
         }
         else
         {
            var_354 = 1;
         }
         _text = param1.text;
         var_1898 = param1.chatType;
         _style = param1.style;
         var_321 = new Array(param1.links);
         _forcedColor = param6;
         _forcedScreenLocation = param5;
         var_4055 = param7;
         _forcedUserName = param8;
         var_388 = param4;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      public function get chatType() : int
      {
         return var_1898;
      }
      
      public function get links() : Array
      {
         return var_321;
      }
      
      public function get style() : int
      {
         return _style;
      }
      
      public function get timeStamp() : uint
      {
         return var_578;
      }
      
      public function get userLocation() : IVector3d
      {
         return _userLocation;
      }
      
      public function get forcedColor() : *
      {
         return _forcedColor;
      }
      
      public function get forcedScreenLocation() : *
      {
         return _forcedScreenLocation;
      }
      
      public function get forcedFigure() : String
      {
         return var_4055;
      }
      
      public function get forcedUserName() : String
      {
         return _forcedUserName;
      }
      
      public function get extraParam() : int
      {
         return var_388;
      }
      
      public function set text(param1:String) : void
      {
         _text = param1;
      }
   }
}
