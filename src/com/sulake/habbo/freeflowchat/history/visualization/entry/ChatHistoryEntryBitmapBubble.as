package com.sulake.habbo.freeflowchat.history.visualization.entry
{
   import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
   import com.sulake.habbo.freeflowchat.data.ChatItem;
   import com.sulake.habbo.freeflowchat.history.visualization.enum.class_3355;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class ChatHistoryEntryBitmapBubble implements class_3299
   {
       
      
      private var _bitmap:BitmapData;
      
      private var _overlap:Rectangle;
      
      private var var_339:int;
      
      private var var_354:int;
      
      private var var_4171:Boolean;
      
      private var _userName:String;
      
      public function ChatHistoryEntryBitmapBubble(param1:ChatItem, param2:Boolean, param3:String, param4:BitmapData, param5:Rectangle = null)
      {
         super();
         _overlap = param5;
         var_339 = param1.userId;
         var_354 = param1.roomId;
         var _loc6_:TextField;
         (_loc6_ = new TextField()).defaultTextFormat = class_3355.TEXT_FORMAT_TIMESTAMP;
         _loc6_.text = HabboFreeFlowChat.getTimeStampNow();
         _loc6_.thickness = -15;
         _loc6_.sharpness = 80;
         _loc6_.antiAliasType = "advanced";
         _loc6_.embedFonts = true;
         _loc6_.gridFitType = "pixel";
         var _loc8_:int = param4.height;
         var _loc9_:int = Math.max(3,3 + param5.top);
         _bitmap = new BitmapData(62 + param4.width,_loc8_,true,0);
         _bitmap.draw(_loc6_,new Matrix(1,0,0,1,0,_loc9_));
         _bitmap.copyPixels(param4,param4.rect,new Point(62,0));
         var_4171 = param2;
         _userName = param3;
      }
      
      public function get bitmap() : BitmapData
      {
         return _bitmap;
      }
      
      public function get overlap() : Rectangle
      {
         return _overlap;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get canIgnore() : Boolean
      {
         return var_4171;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
