package com.sulake.habbo.ui.widget.messages
{
   import com.sulake.core.window.class_3151;
   
   public class RoomWidgetAvatarEditorMessage extends RoomWidgetMessage
   {
      
      public static const const_703:String = "RWCM_OPEN_AVATAR_EDITOR";
      
      public static const WIDGET_MESSAGE_GET_WARDROBE:String = "RWCM_GET_WARDROBE";
      
      public static const const_1157:String = "RWAEM_AVATAR_EDITOR_VIEW_DISPOSED";
       
      
      private var _context:class_3151;
      
      public function RoomWidgetAvatarEditorMessage(param1:String, param2:class_3151 = null)
      {
         super(param1);
         _context = param2;
      }
      
      public function get context() : class_3151
      {
         return _context;
      }
   }
}
