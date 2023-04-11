package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.room.object.IRoomObject;
   
   public class PetMenuView extends AvatarContextInfoButtonView
   {
      
      protected static const MODE_NORMAL:uint = 0;
      
      private static const MODE_SADDLED_UP:int = 1;
      
      private static const MODE_RIDING:int = 2;
      
      private static const MODE_MONSTER_PLANT:int = 3;
       
      
      private var var_45:com.sulake.habbo.ui.widget.avatarinfo.PetInfoData;
      
      private var var_773:int = 0;
      
      public function PetMenuView(param1:AvatarInfoWidget)
      {
         super(param1);
         var_1566 = false;
      }
      
      public static function setup(param1:PetMenuView, param2:int, param3:String, param4:int, param5:int, param6:com.sulake.habbo.ui.widget.avatarinfo.PetInfoData) : void
      {
         param1.var_45 = param6;
         var _loc7_:Boolean = param1.widget.hasFreeSaddle;
         var _loc8_:Boolean = param1.widget.isRiding;
         if(param1.widget.isMonsterPlant())
         {
            param1.var_773 = 3;
         }
         else if(_loc7_ && !_loc8_)
         {
            param1.var_773 = 1;
         }
         else if(_loc8_)
         {
            param1.var_773 = 2;
         }
         else
         {
            param1.var_773 = 0;
         }
         AvatarContextInfoButtonView.setup(param1,param2,param3,param4,param5,false);
      }
      
      override public function dispose() : void
      {
         if(_window)
         {
            _window.removeEventListener("WME_OVER",onMouseHoverEvent);
            _window.removeEventListener("WME_OUT",onMouseHoverEvent);
         }
         var_45 = null;
         super.dispose();
      }
      
      protected function updateButtons() : void
      {
         var _loc8_:int = 0;
         var _loc1_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc2_:AvatarInfoWidgetHandler = null;
         var _loc3_:int = 0;
         var _loc11_:IRoomObject = null;
         var _loc5_:int = 0;
         if(!_window || !var_45)
         {
            return;
         }
         var _loc4_:IItemListWindow;
         if(!(_loc4_ = _window.findChildByName("buttons") as IItemListWindow))
         {
            return;
         }
         _loc4_.procedure = buttonEventProc;
         _loc4_.autoArrangeItems = false;
         var _loc7_:int = _loc4_.numListItems;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc4_.getListItemAt(_loc8_).visible = false;
            _loc8_++;
         }
         var _loc10_:IRoomSession = widget.handler.roomSession;
         var _loc6_:ISessionDataManager = widget.handler.container.sessionDataManager;
         if(_loc10_.isRoomOwner || _loc6_.isAnyRoomController || _loc10_.roomControllerLevel >= 1)
         {
            showButton("pick_up");
         }
         switch(var_773)
         {
            case 0:
               showButton("respect",false);
               break;
            case 1:
               if(widget.configuration.getBoolean("sharedhorseriding.enabled"))
               {
                  showButton("mount");
               }
               showButton("respect",false);
               break;
            case 2:
               if(widget.configuration.getBoolean("sharedhorseriding.enabled"))
               {
                  showButton("dismount");
               }
               showButton("respect",false);
               break;
            case 3:
               if(true)
               {
                  showButton("respect",false);
                  _loc1_ = var_45.energy as Number;
                  _loc9_ = var_45.energyMax as Number;
                  showButton("treat",true,_loc1_ / _loc9_ < 0.98);
                  break;
               }
         }
         widget.localizations.registerParameter("infostand.button.petrespect","count",var_45.petRespectLeft.toString());
         if(widget.configuration.getBoolean("handitem.give.pet.enabled"))
         {
            _loc2_ = widget.handler;
            _loc3_ = _loc2_.container.roomSession.ownUserRoomId;
            if((_loc11_ = _loc2_.container.roomEngine.getRoomObject(_loc2_.roomSession.roomId,_loc3_,100)) != null)
            {
               if((_loc5_ = int(_loc11_.getModel().getNumber("figure_carry_object"))) > 0 && _loc5_ < 999999)
               {
                  showButton("pass_handitem");
               }
            }
         }
         _loc4_.autoArrangeItems = true;
         _loc4_.visible = true;
      }
      
      override protected function updateWindow() : void
      {
         var _loc1_:XML = null;
         if(!var_1429 || true || true)
         {
            return;
         }
         if(var_1726)
         {
            activeView = getMinimizedView();
         }
         else
         {
            if(!_window)
            {
               _loc1_ = XmlAsset(var_1429.assets.getAssetByName("pet_menu")).content as XML;
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
         var _loc4_:RoomWidgetMessage = null;
         if(param1.type == "WME_CLICK")
         {
            if(param2.name == "button")
            {
               _loc3_ = true;
               switch(param2.parent.name)
               {
                  case "mount":
                     _loc4_ = new RoomWidgetUserActionMessage("RWUAM_MOUNT_PET",userId);
                     break;
                  case "dismount":
                     _loc4_ = new RoomWidgetUserActionMessage("RWUAM_DISMOUNT_PET",userId);
                     break;
                  case "respect":
                     var_45.petRespectLeft = -1;
                     updateButtons();
                     _loc4_ = new RoomWidgetUserActionMessage(" RWUAM_RESPECT_PET",userId);
                     break;
                  case "treat":
                     _loc4_ = new RoomWidgetUserActionMessage("RWUAM_TREAT_PET",userId);
                     break;
                  case "pass_handitem":
                     _loc4_ = new RoomWidgetUserActionMessage("RWUAM_GIVE_CARRY_ITEM_TO_PET",userId);
                     break;
                  case "pick_up":
                     _loc4_ = new RoomWidgetUserActionMessage("RWUAM_PICKUP_PET",userId);
               }
            }
            if(param2.name == "profile_link")
            {
               _loc4_ = new RoomWidgetOpenProfileMessage("RWOPEM_OPEN_USER_PROFILE",var_339,"petContextMenu");
            }
            if(_loc4_ != null)
            {
               var_1429.messageListener.processWidgetMessage(_loc4_);
            }
            updateButtons();
         }
         else
         {
            super.buttonEventProc(param1,param2);
         }
         if(_loc3_)
         {
            var_1429.removeView(this,false);
         }
      }
      
      private function get widget() : AvatarInfoWidget
      {
         return var_1429 as AvatarInfoWidget;
      }
   }
}
