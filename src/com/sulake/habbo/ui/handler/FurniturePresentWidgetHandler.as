package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.avatar.pets.PetFigureData;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.session.product.class_3200;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPresentDataUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetPresentOpenMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class FurniturePresentWidgetHandler implements IRoomWidgetHandler, class_3158
   {
      
      private static const const_453:String = "floor";
      
      private static const TYPE_WALLPAPER:String = "wallpaper";
      
      private static const TYPE_LANDSCAPE:String = "landscape";
      
      private static const TYPE_POSTER:String = "poster";
       
      
      private var var_311:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_347:int = -1;
      
      private var _name:String = "";
      
      public function FurniturePresentWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get type() : String
      {
         return "RWE_FURNI_PRESENT_WIDGET";
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return _container;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function dispose() : void
      {
         var_311 = true;
         _container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         return ["RWFWM_MESSAGE_REQUEST_PRESENT","RWPOM_OPEN_PRESENT"];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc4_:RoomWidgetFurniToWidgetMessage = null;
         var _loc3_:IRoomObject = null;
         var _loc12_:IRoomObjectModel = null;
         var _loc11_:String = null;
         var _loc7_:String = null;
         var _loc13_:String = null;
         var _loc10_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc9_:class_3266 = null;
         var _loc2_:RoomWidgetPresentDataUpdateEvent = null;
         var _loc8_:RoomWidgetPresentOpenMessage = null;
         switch(param1.type)
         {
            case "RWFWM_MESSAGE_REQUEST_PRESENT":
               _loc4_ = param1 as RoomWidgetFurniToWidgetMessage;
               _loc3_ = _container.roomEngine.getRoomObject(_loc4_.roomId,_loc4_.id,_loc4_.category);
               if(_loc3_ != null)
               {
                  if((_loc12_ = _loc3_.getModel()) != null)
                  {
                     var_347 = _loc4_.id;
                     if((_loc11_ = String(_loc12_.getString("furniture_data"))) == null)
                     {
                        _loc11_ = "";
                     }
                     _loc7_ = String(_loc12_.getString("furniture_purchaser_name"));
                     _loc13_ = String(_loc12_.getString("furniture_purchaser_figure"));
                     _loc10_ = int(_loc12_.getNumber("furniture_type_id"));
                     _loc5_ = String(_loc12_.getString("furniture_extras"));
                     _loc6_ = 32;
                     _loc9_ = _container.roomEngine.getFurnitureImage(_loc10_,new Vector3d(180),_loc6_,null,0,_loc5_);
                     _loc2_ = new RoomWidgetPresentDataUpdateEvent("RWPDUE_PACKAGEINFO",_loc4_.id,_loc11_,_container.isOwnerOfFurniture(_loc3_),_loc9_.data,_loc7_,_loc13_);
                     _container.events.dispatchEvent(_loc2_);
                     break;
                  }
                  break;
               }
               break;
            case "RWPOM_OPEN_PRESENT":
               if((_loc8_ = param1 as RoomWidgetPresentOpenMessage).objectId != var_347)
               {
                  return null;
               }
               if(_container != null)
               {
                  if(false)
                  {
                     _container.roomSession.sendPresentOpenMessage(_loc8_.objectId);
                  }
                  if(false)
                  {
                     _container.roomEngine.changeObjectModelData(_container.roomEngine.activeRoomId,_loc8_.objectId,10,"furniture_disable_picking_animation",1);
                     break;
                  }
                  break;
               }
               break;
         }
         return null;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(disposed || _container == null)
         {
            return;
         }
         var _loc3_:RoomWidgetPresentDataUpdateEvent = new RoomWidgetPresentDataUpdateEvent("RWPDUE_CONTENTS_IMAGE",0,_name,false,param2);
         _container.events.dispatchEvent(_loc3_);
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      public function getProcessedEvents() : Array
      {
         return ["RSPE_PRESENT_OPENED"];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc13_:RoomSessionPresentEvent = null;
         var _loc3_:class_3148 = null;
         var _loc5_:* = null;
         var _loc10_:RoomWidgetPresentDataUpdateEvent = null;
         var _loc2_:Boolean = false;
         var _loc11_:IRoomObject = null;
         var _loc6_:class_3200 = null;
         var _loc14_:String = null;
         var _loc4_:String = null;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc12_:PetFigureData = null;
         var _loc16_:int = 0;
         var _loc7_:int = 0;
         var _loc15_:class_3266 = null;
         if(param1 == null)
         {
            return;
         }
         if(_container != null && false && param1 != null)
         {
            var _loc17_:* = param1.type;
            if("RSPE_PRESENT_OPENED" === _loc17_)
            {
               if((_loc13_ = param1 as RoomSessionPresentEvent) != null)
               {
                  _name = "";
                  _loc5_ = null;
                  if(_loc13_.itemType == "s")
                  {
                     _loc3_ = _container.sessionDataManager.getFloorItemData(_loc13_.classId);
                  }
                  else if(_loc13_.itemType == "i")
                  {
                     _loc3_ = _container.sessionDataManager.getWallItemData(_loc13_.classId);
                  }
                  _loc2_ = false;
                  if(_loc13_.placedInRoom)
                  {
                     if((_loc11_ = _container.roomEngine.getRoomObject(_container.roomSession.roomId,_loc13_.placedItemId,10)) != null)
                     {
                        _loc2_ = _container.isOwnerOfFurniture(_loc11_);
                     }
                  }
                  loop0:
                  switch(_loc13_.itemType)
                  {
                     case "i":
                        if(_loc3_ != null)
                        {
                           switch(_loc3_.className)
                           {
                              case "floor":
                                 _loc10_ = new RoomWidgetPresentDataUpdateEvent("RWPDUE_CONTENTS_FLOOR",0,_container.localization.getLocalization("inventory.furni.item.floor.name"),_loc2_,null);
                                 break loop0;
                              case "landscape":
                                 _loc10_ = new RoomWidgetPresentDataUpdateEvent("RWPDUE_CONTENTS_LANDSCAPE",0,_container.localization.getLocalization("inventory.furni.item.landscape.name"),_loc2_,null);
                                 break loop0;
                              case "wallpaper":
                                 _loc10_ = new RoomWidgetPresentDataUpdateEvent("RWPDUE_CONTENTS_WALLPAPER",0,_container.localization.getLocalization("inventory.furni.item.wallpaper.name"),_loc2_,null);
                                 break loop0;
                              case "poster":
                                 _loc14_ = _loc13_.productCode;
                                 _loc4_ = null;
                                 if(_loc14_.indexOf("poster") == 0)
                                 {
                                    _loc4_ = String(_loc8_ = int(_loc14_.replace("poster","")));
                                 }
                                 _loc5_ = _container.roomEngine.getWallItemIcon(_loc13_.classId,this,_loc4_);
                                 if((_loc6_ = _container.sessionDataManager.getProductData(_loc14_)) != null)
                                 {
                                    _name = _loc6_.name;
                                 }
                                 else if(_loc3_ != null)
                                 {
                                    _name = _loc3_.localizedName;
                                 }
                                 if(_loc5_ != null)
                                 {
                                    _loc10_ = new RoomWidgetPresentDataUpdateEvent("RWPDUE_CONTENTS",0,_name,_loc2_,_loc5_.data);
                                    break loop0;
                                 }
                                 break loop0;
                              default:
                                 _loc5_ = _container.roomEngine.getWallItemIcon(_loc13_.classId,this);
                                 if(_loc3_ != null)
                                 {
                                    _name = _loc3_.localizedName;
                                 }
                                 if(_loc5_ != null)
                                 {
                                    _loc10_ = new RoomWidgetPresentDataUpdateEvent("RWPDUE_CONTENTS",0,_name,_loc2_,_loc5_.data);
                                    break loop0;
                                 }
                           }
                        }
                        break;
                     case "h":
                        _loc10_ = new RoomWidgetPresentDataUpdateEvent("RWPDUE_CONTENTS_CLUB",0,_container.localization.getLocalization("widget.furni.present.hc"),false,null);
                        break;
                     default:
                        if(_loc13_.placedItemType == "p")
                        {
                           if((_loc9_ = _loc13_.petFigureString) != null && _loc9_.length > 0)
                           {
                              _loc12_ = new PetFigureData(_loc9_);
                              _loc16_ = 2;
                              _loc7_ = 64;
                              if(_loc12_.typeId == 15)
                              {
                                 _loc7_ = 32;
                              }
                              if((_loc15_ = _container.roomEngine.getPetImage(_loc12_.typeId,_loc12_.paletteId,_loc12_.color,new Vector3d(_loc16_ * 45),_loc7_,this,true,0,_loc12_.customParts)) != null)
                              {
                                 _loc5_ = _loc15_;
                              }
                           }
                        }
                        if(_loc5_ == null)
                        {
                           _loc5_ = _container.roomEngine.getFurnitureImage(_loc13_.classId,new Vector3d(90),64,this);
                        }
                        if((_loc6_ = _container.sessionDataManager.getProductData(_loc13_.productCode)) != null)
                        {
                           _name = _loc6_.name;
                        }
                        else if(_loc3_ != null)
                        {
                           _name = _loc3_.localizedName;
                        }
                        if(_loc5_ != null)
                        {
                           _loc10_ = new RoomWidgetPresentDataUpdateEvent("RWPDUE_CONTENTS",0,_name,_loc2_,_loc5_.data);
                           break;
                        }
                  }
                  if(_loc10_ != null)
                  {
                     _loc10_.classId = _loc13_.classId;
                     _loc10_.itemType = _loc13_.itemType;
                     _loc10_.placedItemId = _loc13_.placedItemId;
                     _loc10_.placedInRoom = _loc13_.placedInRoom;
                     _loc10_.placedItemType = _loc13_.placedItemType;
                     _container.events.dispatchEvent(_loc10_);
                  }
               }
            }
         }
      }
      
      public function update() : void
      {
      }
   }
}
