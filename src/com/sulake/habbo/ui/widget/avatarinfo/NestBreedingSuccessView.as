package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.pets.PetFigureData;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class NestBreedingSuccessView implements class_13, class_3158
   {
      
      private static const const_563:String = "header_button_close";
      
      private static const const_813:String = "cancel_button";
      
      private static const const_515:String = "button.ok";
       
      
      private var _window:class_3281;
      
      private var var_311:Boolean = false;
      
      private var var_1429:com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
      
      private var _windowManager:class_1684;
      
      private var _assets:class_21;
      
      private var var_296:class_3259;
      
      private var var_421:int;
      
      private var var_2446:class_24;
      
      private var var_479:int;
      
      public function NestBreedingSuccessView(param1:com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget)
      {
         super();
         var_1429 = param1;
         _windowManager = param1.windowManager;
         _assets = var_1429.assets;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         var_311 = true;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function open(param1:int, param2:int) : void
      {
         var_421 = param1;
         var_296 = var_1429.handler.roomSession.userDataManager.getUserDataByIndex(param1);
         if(var_296 == null)
         {
            class_14.log("Couldn\'t find the correct pet.");
            return;
         }
         var_479 = param2;
         setWindowContent();
         _window.visible = true;
      }
      
      private function setWindowContent() : void
      {
         if(!_window)
         {
            _window = _windowManager.buildFromXML(_assets.getAssetByName("nestBreedingSuccess_xml").content as XML) as class_3281;
            addClickListener("header_button_close");
         }
         _window.center();
         _window.visible = true;
         addClickListener("button.ok");
         _window.findChildByName("pet.name").caption = var_296.name;
         _window.findChildByName("pet.raritycategory").caption = "${breedpets.nestbreeding.success.raritycategory." + var_479 + "}";
         var _loc1_:BitmapData = resolvePreviewImage(var_296.figure,"pet_image");
         updatePreviewImage(_loc1_ != null ? _loc1_ : new BitmapData(10,10),"pet_image");
         _window.invalidate();
      }
      
      public function close() : void
      {
         if(_window)
         {
            _window.visible = false;
         }
      }
      
      private function addClickListener(param1:String) : void
      {
         var _loc2_:class_3127 = _window.findChildByName(param1);
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onMouseClick);
         }
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "header_button_close":
            case "cancel_button":
               close();
               break;
            case "button.ok":
               close();
         }
      }
      
      private function resolvePreviewImage(param1:String, param2:String, param3:int = 64) : BitmapData
      {
         var _loc8_:BitmapData = null;
         var _loc7_:int = 0;
         var _loc4_:PetFigureData = new PetFigureData(param1);
         var _loc6_:class_3266;
         if((_loc6_ = var_1429.handler.roomEngine.getPetImage(_loc4_.typeId,_loc4_.paletteId,_loc4_.color,new Vector3d(90),param3,this,true,0,_loc4_.customParts,"std")) != null)
         {
            if((_loc7_ = _loc6_.id) > 0)
            {
               var_2446.add(_loc7_,param2);
            }
            _loc8_ = _loc6_.data;
         }
         return _loc8_;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(disposed)
         {
            return;
         }
         var _loc3_:String = var_2446.getValue(param1);
         if(_loc3_ != null)
         {
            updatePreviewImage(param2,_loc3_);
         }
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      private function updatePreviewImage(param1:BitmapData, param2:String) : void
      {
         if(!_window || !param1)
         {
            return;
         }
         var _loc4_:class_3282;
         (_loc4_ = _window.findChildByName(param2) as class_3282).bitmap = new BitmapData(_loc4_.width,_loc4_.height,true,16777215);
         var _loc3_:Point = new Point((_loc4_.width - param1.width) / 2,(_loc4_.height - param1.height) / 2);
         _loc4_.bitmap.copyPixels(param1,param1.rect,_loc3_,null,null,true);
      }
   }
}
