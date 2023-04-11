package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3207;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.preview.RoomPreviewer;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   
   public class RoomPreviewerWidget implements IRoomPreviewerWidget
   {
      
      public static const TYPE:String = "room_previewer";
      
      private static const SCALE_KEY:String = "room_previewer:scale";
      
      private static const const_935:String = "room_previewer:offsetx";
      
      private static const const_814:String = "room_previewer:offsety";
      
      private static const const_952:String = "room_previewer:zoom";
      
      private static const SCALE_DEFAULT:PropertyStruct = new PropertyStruct("room_previewer:scale",64,"int",false,[32,64]);
      
      private static const OFFSET_X_DEFAULT:PropertyStruct = new PropertyStruct("room_previewer:offsetx",0,"int",false);
      
      private static const OFFSET_Y_DEFAULT:PropertyStruct = new PropertyStruct("room_previewer:offsety",0,"int",false);
      
      private static const ZOOM_DEFAULT:PropertyStruct = new PropertyStruct("room_previewer:zoom",1,"int",false);
      
      private static var ROOM_ID_COUNTER:int = 2;
       
      
      private var _disposed:Boolean;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      private var var_1797:class_3207;
      
      private var var_1594:RoomPreviewer;
      
      private var var_757:int;
      
      private var _offsetX:int = 0;
      
      private var _offsetY:int = 0;
      
      private var var_3070:int;
      
      public function RoomPreviewerWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         var_757 = 0;
         var_3070 = 0;
         super();
         var_1547 = param1;
         _windowManager = param2;
         if(param2.roomEngine)
         {
            param2.roomEngine.events.addEventListener("REE_INITIALIZED",onRoomInitialized);
         }
         var_464 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("room_previewer_xml").content as XML) as class_3151;
         var_1797 = var_464.findChildByName("room_canvas") as class_3207;
         var_1594 = new RoomPreviewer(param2.roomEngine,ROOM_ID_COUNTER++);
         var_1594.createRoomForPreviews();
         var_464.addEventListener("WME_CLICK",onClickRoomView);
         var_464.addEventListener("WE_RESIZE",onResizeCanvas);
         var_1547.rootWindow = var_464;
         var_464.width = var_1547.width;
         var_464.height = var_1547.height;
         var_1594.modifyRoomCanvas(var_464.width,var_464.height);
      }
      
      public function get scale() : int
      {
         return var_757;
      }
      
      public function set scale(param1:int) : void
      {
         var_757 = param1;
         refresh();
      }
      
      public function get offsetX() : int
      {
         return _offsetX;
      }
      
      public function set offsetX(param1:int) : void
      {
         _offsetX = param1;
         refresh();
      }
      
      public function get offsetY() : int
      {
         return _offsetY;
      }
      
      public function set offsetY(param1:int) : void
      {
         _offsetY = param1;
         refresh();
      }
      
      public function get zoom() : int
      {
         return var_3070;
      }
      
      public function set zoom(param1:int) : void
      {
         var_3070 = param1;
         refresh();
      }
      
      public function get properties() : Array
      {
         var _loc1_:* = [];
         if(_disposed)
         {
            return _loc1_;
         }
         _loc1_.push(SCALE_DEFAULT.withValue(var_757));
         _loc1_.push(OFFSET_X_DEFAULT.withValue(_offsetX));
         _loc1_.push(OFFSET_Y_DEFAULT.withValue(_offsetY));
         _loc1_.push(ZOOM_DEFAULT.withValue(var_3070));
         return _loc1_;
      }
      
      public function set properties(param1:Array) : void
      {
         for each(var _loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "room_previewer:scale":
                  scale = int(_loc2_.value);
                  break;
               case "room_previewer:offsetx":
                  offsetX = int(_loc2_.value);
                  break;
               case "room_previewer:offsety":
                  offsetY = int(_loc2_.value);
                  break;
               case "room_previewer:zoom":
                  zoom = int(_loc2_.value);
                  break;
            }
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_1594)
            {
               var_1594.dispose();
               var_1594 = null;
            }
            if(var_464 != null)
            {
               var_464.dispose();
               var_464 = null;
            }
            if(var_1547 != null)
            {
               var_1547.rootWindow = null;
               var_1547 = null;
            }
            if(_windowManager && false)
            {
               _windowManager.roomEngine.events.removeEventListener("REE_INITIALIZED",onRoomInitialized);
            }
            _windowManager = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get iterator() : IIterator
      {
         return EmptyIterator.INSTANCE;
      }
      
      private function onRoomInitialized(param1:RoomEngineEvent) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:* = param1.type;
         if("REE_INITIALIZED" === _loc3_)
         {
            if(var_1594 && param1.roomId == var_1594.previewRoomId)
            {
               var_1594.reset(false);
               _loc2_ = var_1594.getRoomCanvas(var_1797.width,var_1797.height);
               if(_loc2_ != null)
               {
                  var_1797.setDisplayObject(_loc2_);
               }
            }
         }
      }
      
      private function refresh() : void
      {
         var _loc1_:DisplayObject = null;
         if(var_1594 && false)
         {
            var_757 == 64 ? var_1594.zoomIn() : var_1594.zoomOut();
            var_1594.addViewOffset = new Point(_offsetX,_offsetY);
            _loc1_ = var_1797.getDisplayObject();
            _loc1_.scaleX = _loc1_.scaleY = zoom;
            _loc1_.x = offsetX;
            _loc1_.y = offsetY;
         }
      }
      
      public function toString() : String
      {
         return "RoomPreviewerWidget";
      }
      
      private function onResizeCanvas(param1:class_3134, param2:class_3127 = null) : void
      {
         var _loc3_:int = param1.window.width;
         var _loc4_:int = param1.window.height;
         var_1594.modifyRoomCanvas(_loc3_,_loc4_);
      }
      
      private function onClickRoomView(param1:WindowMouseEvent) : void
      {
         var_1594.changeRoomObjectState();
      }
      
      public function get roomPreviewer() : RoomPreviewer
      {
         return var_1594;
      }
      
      public function showPreview(param1:BitmapData) : void
      {
         var _loc2_:Bitmap = new Bitmap(param1);
         _loc2_.scaleX = 2;
         _loc2_.scaleY = 2;
         var_1797.setDisplayObject(_loc2_);
      }
   }
}
