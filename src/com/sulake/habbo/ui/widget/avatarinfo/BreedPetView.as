package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.ui.widget.events.UseProductItem;
   
   public class BreedPetView extends AvatarContextInfoButtonView
   {
      
      private static const MODE_NORMAL:int = 0;
       
      
      private var var_773:int;
      
      private var var_1848:UseProductItem;
      
      private var var_883:Boolean;
      
      public function BreedPetView(param1:AvatarInfoWidget)
      {
         super(param1);
         var_1566 = false;
      }
      
      public static function setup(param1:BreedPetView, param2:int, param3:String, param4:int, param5:int, param6:UseProductItem, param7:Boolean) : void
      {
         param1.var_1848 = param6;
         param1.var_883 = param7;
         AvatarContextInfoButtonView.setup(param1,param2,param3,param4,param5,false);
      }
      
      public function get objectId() : int
      {
         return var_1848.id;
      }
      
      public function get requestRoomObjectId() : int
      {
         return var_1848.requestRoomObjectId;
      }
      
      override public function dispose() : void
      {
         if(_window)
         {
            _window.removeEventListener("WME_OVER",onMouseHoverEvent);
            _window.removeEventListener("WME_OUT",onMouseHoverEvent);
         }
         if(var_1848)
         {
            var_1848.dispose();
         }
         var_1848 = null;
         super.dispose();
      }
      
      private function resolveMode() : void
      {
         var _loc1_:int = widget.handler.roomSession.roomId;
         var_773 = 0;
      }
      
      override protected function updateWindow() : void
      {
         var _loc1_:XML = null;
         if(!var_1429 || true || true)
         {
            return;
         }
         resolveMode();
         if(var_1726)
         {
            activeView = getMinimizedView();
         }
         else
         {
            if(!_window)
            {
               _loc1_ = XmlAsset(var_1429.assets.getAssetByName("breed_pet_menu")).content as XML;
               _window = var_1429.windowManager.buildFromXML(_loc1_,0) as class_3151;
               if(!_window)
               {
                  return;
               }
               _window.addEventListener("WME_OVER",onMouseHoverEvent);
               _window.addEventListener("WME_OUT",onMouseHoverEvent);
               _window.findChildByName("minimize").addEventListener("WME_CLICK",onMinimize);
               _window.findChildByName("minimize").addEventListener("WME_OVER",onMinimizeHover);
               _window.findChildByName("minimize").addEventListener("WME_OUT",onMinimizeHover);
            }
            _buttons = _window.findChildByName("buttons") as IItemListWindow;
            _buttons.procedure = buttonEventProc;
            _window.findChildByName("name").caption = _userName;
            _window.visible = false;
            activeView = _window;
            updateButtons();
         }
      }
      
      public function updateButtons() : void
      {
         var _loc2_:int = 0;
         if(!_window || !_buttons)
         {
            return;
         }
         _buttons.autoArrangeItems = false;
         var _loc1_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _buttons.getListItemAt(_loc2_).visible = false;
            _loc2_++;
         }
         switch(var_773)
         {
            case 0:
               if(var_883)
               {
                  showButton("breed");
                  break;
               }
         }
         _buttons.autoArrangeItems = true;
         _buttons.visible = true;
      }
      
      override protected function buttonEventProc(param1:class_3134, param2:class_3127) : void
      {
         if(disposed)
         {
            return;
         }
         if(!_window || false)
         {
            return;
         }
         var _loc3_:Boolean = false;
         if(param1.type == "WME_CLICK")
         {
            if(param2.name == "button")
            {
               _loc3_ = true;
               var _loc5_:* = param2.parent.name;
               if("breed" === _loc5_)
               {
                  widget.showBreedMonsterPlantsConfirmationView(var_1848.requestRoomObjectId,var_1848.targetRoomObjectId,false);
               }
            }
         }
         else
         {
            super.buttonEventProc(param1,param2);
         }
         if(_loc3_)
         {
            widget.removeBreedPetViews();
         }
      }
      
      private function changeMode(param1:int) : void
      {
         var_773 = param1;
         updateButtons();
      }
      
      private function get widget() : AvatarInfoWidget
      {
         return var_1429 as AvatarInfoWidget;
      }
   }
}
