package com.sulake.habbo.avatar.figuredata
{
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.room.preview.RoomPreviewer;
   import com.sulake.habbo.window.widgets.IRoomPreviewerWidget;
   
   public class FigureDataView implements class_1870
   {
      
      public static const PREVIEW_AVATAR_DIRECTION:int = 4;
       
      
      private var var_1429:IRoomPreviewerWidget;
      
      private var var_1594:RoomPreviewer;
      
      private var var_1443:com.sulake.habbo.avatar.figuredata.FigureData;
      
      private var _figureString:String;
      
      private var var_311:Boolean;
      
      public function FigureDataView(param1:com.sulake.habbo.avatar.figuredata.FigureData)
      {
         super();
         var_1443 = param1;
         var_1429 = param1.avatarEditor.view.getFigureContainer().widget as IRoomPreviewerWidget;
         var_1594 = var_1429.roomPreviewer;
         var_1594.updateRoomWallsAndFloorVisibility(false,false);
      }
      
      public function update(param1:String, param2:int = 0, param3:int = 4) : void
      {
         var _loc4_:class_3156 = null;
         _figureString = param1;
         if(false)
         {
            var_1594.addAvatarIntoRoom(param1,param2);
            var_1594.updateAvatarDirection(param3,param3);
            var_1594.updatePreviewRoomView(true);
            var_1594.updateRoomEngine();
         }
         else
         {
            _loc4_ = var_1443.avatarEditor.manager.avatarRenderManager.createAvatarImage(param1,"h",null,this);
            var_1429.showPreview(_loc4_.getCroppedImage("full"));
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:class_3156 = null;
         if(param1 == _figureString)
         {
            _loc2_ = var_1443.avatarEditor.manager.avatarRenderManager.createAvatarImage(param1,"h",null,this);
            var_1429.showPreview(_loc2_.getCroppedImage("full"));
         }
      }
      
      public function dispose() : void
      {
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
   }
}
