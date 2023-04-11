package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetPetCommandMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.room.object.IRoomObject;
   
   public class OwnPetMenuView extends AvatarContextInfoButtonView
   {
      
      private static const MODE_NORMAL:int = 0;
      
      private static const MODE_SADDLED_UP:int = 1;
      
      private static const MODE_RIDING:int = 2;
      
      private static const MODE_MONSTERPLANT:int = 3;
       
      
      private var var_45:com.sulake.habbo.ui.widget.avatarinfo.PetInfoData;
      
      private var var_773:int;
      
      private var var_2468:class_3148;
      
      private var var_3227:class_3148;
      
      protected var _catalog:IHabboCatalog;
      
      protected var _habboTracking:class_1693;
      
      public function OwnPetMenuView(param1:AvatarInfoWidget, param2:IHabboCatalog)
      {
         super(param1);
         var_1566 = false;
         _habboTracking = HabboTracking.getInstance();
         _catalog = param2;
      }
      
      public static function setup(param1:OwnPetMenuView, param2:int, param3:String, param4:int, param5:int, param6:com.sulake.habbo.ui.widget.avatarinfo.PetInfoData) : void
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
         var_45 = null;
         var_2468 = null;
         var_3227 = null;
         _catalog = null;
         _habboTracking = null;
         super.dispose();
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
               _loc1_ = XmlAsset(var_1429.assets.getAssetByName("own_pet_menu")).content as XML;
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
         var _loc6_:int = 0;
         var _loc2_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc3_:int = 0;
         var _loc8_:IRoomObject = null;
         var _loc4_:int = 0;
         if(!_window || !var_45 || !_buttons)
         {
            return;
         }
         _buttons.autoArrangeItems = false;
         var _loc5_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _buttons.getListItemAt(_loc6_).visible = false;
            _loc6_++;
         }
         var_2468 = null;
         var _loc1_:AvatarInfoWidgetHandler = widget.handler;
         switch(var_773)
         {
            case 0:
               showButton("respect",false);
               showButton("train");
               showButton("pick_up");
               if(false)
               {
                  var_2468 = findFurnitureData(16,15);
                  if(var_2468 != null)
                  {
                     showButton("buy_saddle");
                  }
               }
               if(widget.configuration.getBoolean("nest.breeding.bear.enabled"))
               {
                  if(false)
                  {
                     showButton("breed");
                  }
               }
               if(widget.configuration.getBoolean("nest.breeding.terrier.enabled"))
               {
                  if(false)
                  {
                     showButton("breed");
                  }
               }
               if(widget.configuration.getBoolean("nest.breeding.cat.enabled"))
               {
                  if(false)
                  {
                     showButton("breed");
                  }
               }
               if(widget.configuration.getBoolean("nest.breeding.dog.enabled"))
               {
                  if(false)
                  {
                     showButton("breed");
                  }
               }
               if(widget.configuration.getBoolean("nest.breeding.pig.enabled"))
               {
                  if(false)
                  {
                     showButton("breed");
                     break;
                  }
                  break;
               }
               break;
            case 1:
               showButton("mount");
               if(widget.configuration.getBoolean("sharedhorseriding.enabled"))
               {
                  showButton("toggle_riding_permission");
                  enableCheckbox("toggle_riding_permission",var_45 != null ? false : false);
               }
               showButton("respect",false);
               showButton("train");
               showButton("pick_up");
               showButton("saddle_off");
               break;
            case 2:
               showButton("dismount");
               showButton("respect",false);
               break;
            case 3:
               showButton("pick_up");
               if(false)
               {
                  var_3227 = findFurnitureData(20,16);
                  showButton("revive");
                  if(widget.configuration.getBoolean("monsterplants.composting.enabled") && _loc1_.container.roomSession.isRoomOwner)
                  {
                     showButton("compost");
                     break;
                  }
                  break;
               }
               _loc2_ = var_45.energy as Number;
               _loc7_ = var_45.energyMax as Number;
               showButton("treat",true,_loc2_ / _loc7_ < 0.98);
               if(true)
               {
                  if(false)
                  {
                     showButton("toggle_breeding_permission");
                     enableCheckbox("toggle_breeding_permission",var_45.hasBreedingPermission);
                     showButton("breed");
                     break;
                  }
                  break;
               }
               break;
         }
         if(widget.configuration.getBoolean("handitem.give.pet.enabled"))
         {
            _loc3_ = _loc1_.container.roomSession.ownUserRoomId;
            if((_loc8_ = _loc1_.container.roomEngine.getRoomObject(_loc1_.roomSession.roomId,_loc3_,100)) != null)
            {
               if((_loc4_ = int(_loc8_.getModel().getNumber("figure_carry_object"))) > 0 && _loc4_ < 999999)
               {
                  showButton("pass_handitem");
               }
            }
         }
         widget.localizations.registerParameter("infostand.button.petrespect","count",var_45.petRespectLeft.toString());
         _buttons.autoArrangeItems = true;
         _buttons.visible = true;
      }
      
      private function findFurnitureData(param1:int, param2:int) : class_3148
      {
         var _loc3_:Array = null;
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc7_:Array = widget.handler.container.sessionDataManager.getFloorItemsDataByCategory(param1);
         for each(var _loc5_ in _loc7_)
         {
            _loc3_ = _loc5_.customParams.split(" ");
            if((_loc6_ = _loc3_ && _loc3_.length >= 1 ? parseInt(_loc3_[0]) : -1) == param2)
            {
               _loc4_ = _loc5_;
               break;
            }
         }
         return _loc4_;
      }
      
      private function openCatalogPage(param1:class_3148) : Boolean
      {
         if(_catalog == null || param1 == null || param1.purchaseOfferId < 0)
         {
            return false;
         }
         _catalog.openCatalogPageByOfferId(param1.purchaseOfferId,"NORMAL");
         if(_habboTracking)
         {
            _habboTracking.trackGoogle("infostandCatalogButton","offer",param1.purchaseOfferId);
         }
         return true;
      }
      
      private function findRoomObject(param1:class_3148) : IRoomObject
      {
         var _loc5_:int = 0;
         var _loc3_:IRoomObject = null;
         var _loc7_:int = 0;
         if(widget == null || param1 == null)
         {
            return null;
         }
         var _loc2_:IRoomWidgetHandlerContainer = widget.handler.container;
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc6_:IRoomEngine;
         if((_loc6_ = _loc2_.roomEngine) == null)
         {
            return null;
         }
         var _loc8_:int = _loc2_.roomSession.roomId;
         var _loc4_:int = _loc6_.getRoomObjectCount(_loc8_,10);
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = _loc6_.getRoomObjectWithIndex(_loc8_,_loc5_,10);
            if(_loc3_ != null)
            {
               if((_loc7_ = int(_loc3_.getModel().getNumber("furniture_type_id"))) == param1.id)
               {
                  return _loc3_;
               }
            }
            _loc5_++;
         }
         return null;
      }
      
      private function enableCheckbox(param1:String, param2:Boolean) : void
      {
         var _loc3_:class_3176 = getCheckbox(param1);
         if(!_loc3_)
         {
            return;
         }
         if(param2)
         {
            _loc3_.select();
         }
         else
         {
            _loc3_.unselect();
         }
      }
      
      private function getCheckbox(param1:String) : class_3176
      {
         if(!_buttons)
         {
            return null;
         }
         var _loc2_:class_3151 = _buttons.getListItemByName(param1) as class_3151;
         if(!_loc2_)
         {
            return null;
         }
         return _loc2_.findChildByName(param1 + "_checkbox") as class_3176;
      }
      
      override protected function buttonEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc8_:RoomWidgetMessage = null;
         var _loc5_:class_3176 = null;
         var _loc9_:int = 0;
         var _loc6_:String = null;
         var _loc4_:String = null;
         var _loc7_:Boolean = false;
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
               class_14.log("Own pet menu was clicked: " + param2.parent.name);
               switch(param2.parent.name)
               {
                  case "respect":
                     var_45.petRespectLeft = -1;
                     updateButtons();
                     _loc8_ = new RoomWidgetUserActionMessage(" RWUAM_RESPECT_PET",petId);
                     break;
                  case "treat":
                     _loc8_ = new RoomWidgetUserActionMessage("RWUAM_TREAT_PET",petId);
                     break;
                  case "pass_handitem":
                     _loc8_ = new RoomWidgetUserActionMessage("RWUAM_GIVE_CARRY_ITEM_TO_PET",petId);
                     break;
                  case "train":
                     widget.openTrainingView();
                     break;
                  case "pick_up":
                     _loc8_ = new RoomWidgetUserActionMessage("RWUAM_PICKUP_PET",petId);
                     widget.closeTrainingView();
                     break;
                  case "mount":
                     _loc8_ = new RoomWidgetUserActionMessage("RWUAM_MOUNT_PET",petId);
                     break;
                  case "toggle_riding_permission":
                     _loc8_ = new RoomWidgetUserActionMessage("RWUAM_TOGGLE_PET_RIDING_PERMISSION",petId);
                     if((_loc5_ = getCheckbox("toggle_riding_permission")) != null)
                     {
                        enableCheckbox("toggle_riding_permission",!_loc5_.isSelected);
                        break;
                     }
                     break;
                  case "toggle_breeding_permission":
                     _loc8_ = new RoomWidgetUserActionMessage("RWUAM_TOGGLE_PET_BREEDING_PERMISSION",petId);
                     if((_loc5_ = getCheckbox("toggle_breeding_permission")) != null)
                     {
                        enableCheckbox("toggle_breeding_permission",!_loc5_.isSelected);
                        break;
                     }
                     break;
                  case "dismount":
                     _loc8_ = new RoomWidgetUserActionMessage("RWUAM_DISMOUNT_PET",petId);
                     break;
                  case "saddle_off":
                     _loc8_ = new RoomWidgetUserActionMessage("RWUAM_SADDLE_OFF",petId);
                     break;
                  case "breed":
                     if(var_773 == 0)
                     {
                        _loc9_ = 46;
                        _loc6_ = "pet.command." + _loc9_;
                        _loc4_ = String(var_1429.catalog.localization.getLocalization(_loc6_));
                        _loc8_ = new RoomWidgetPetCommandMessage("RWPCM_PET_COMMAND",var_45.id,"undefined " + _loc4_);
                        break;
                     }
                     if(var_773 == 3)
                     {
                        _loc8_ = new RoomWidgetUserActionMessage("RWUAM_REQUEST_BREED_PET",petId);
                        break;
                     }
                     break;
                  case "harvest":
                     _loc8_ = new RoomWidgetUserActionMessage("RWUAM_HARVEST_PET",petId);
                     break;
                  case "revive":
                     if(_loc7_ = openCatalogPage(var_3227))
                     {
                     }
                     _loc8_ = new RoomWidgetUserActionMessage("RWUAM_REVIVE_PET",petId);
                     break;
                  case "compost":
                     _loc8_ = new RoomWidgetUserActionMessage("RWUAM_COMPOST_PLANT",petId);
                     break;
                  case "buy_saddle":
                     openCatalogPage(var_2468);
               }
            }
            else if(param2.name == "profile_link")
            {
               _loc8_ = new RoomWidgetOpenProfileMessage("RWOPEM_OPEN_USER_PROFILE",petId,"ownPetContextMenu");
            }
            else if(param2.name == "toggle_riding_permission_checkbox")
            {
               _loc3_ = true;
               _loc8_ = new RoomWidgetUserActionMessage("RWUAM_TOGGLE_PET_RIDING_PERMISSION",petId);
            }
            else if(param2.name == "toggle_breeding_permission_checkbox")
            {
               _loc3_ = true;
               _loc8_ = new RoomWidgetUserActionMessage("RWUAM_TOGGLE_PET_BREEDING_PERMISSION",petId);
            }
            if(_loc8_)
            {
               var_1429.messageListener.processWidgetMessage(_loc8_);
            }
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
      
      public function get widget() : AvatarInfoWidget
      {
         return var_1429 as AvatarInfoWidget;
      }
      
      private function changeMode(param1:int) : void
      {
         var_773 = param1;
         updateButtons();
      }
      
      public function get petId() : int
      {
         return userId;
      }
   }
}
