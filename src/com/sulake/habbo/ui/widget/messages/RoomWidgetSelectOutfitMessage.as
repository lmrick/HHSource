package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const SELECT_OUTFIT:String = "select_outfit";
       
      
      private var var_3817:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super("select_outfit");
         var_3817 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_3817;
      }
   }
}
