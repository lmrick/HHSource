package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   
   public class RoomThumbnailWidget implements IRoomThumbnailWidget
   {
      
      public static const TYPE:String = "room_thumbnail";
       
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      public function RoomThumbnailWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("room_thumbnail_xml").content as XML) as class_3151;
         var_1547.rootWindow = var_464;
         var_464.width = var_1547.width;
         var_464.height = var_1547.height;
      }
      
      public function reset() : void
      {
      }
      
      public function set flatId(param1:int) : void
      {
      }
      
      public function get properties() : Array
      {
         return null;
      }
      
      public function set properties(param1:Array) : void
      {
      }
      
      public function dispose() : void
      {
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function get iterator() : IIterator
      {
         return null;
      }
   }
}
