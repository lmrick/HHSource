package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.avatar.class_3241;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetClothingChangeUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetClothingChangeMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.events.Event;
   
   public class FurnitureClothingChangeWidgetHandler implements IRoomWidgetHandler, class_3241
   {
      
      private static const DEFAULT_BOY_CLOTHES:String = "hd-99999-99999.lg-270-62";
      
      private static const DEFAULT_GIRL_CLOTHES:String = "hd-99999-99999.ch-630-62.lg-695-62";
       
      
      private var var_311:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_347:int = -1;
      
      public function FurnitureClothingChangeWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get type() : String
      {
         return "RWE_CLOTHING_CHANGE";
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function dispose() : void
      {
         if(_container && false)
         {
            _container.avatarEditor.close(1);
         }
         var_311 = true;
         _container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         return ["RWFWM_MESSAGE_REQUEST_CLOTHING_CHANGE","RWCCM_REQUEST_EDITOR","RWCM_OPEN_AVATAR_EDITOR"];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc6_:RoomWidgetFurniToWidgetMessage = null;
         var _loc3_:Boolean = false;
         var _loc7_:RoomWidgetClothingChangeMessage = null;
         var _loc5_:String = null;
         var _loc8_:String = null;
         var _loc4_:IRoomObject = null;
         var _loc9_:IRoomObjectModel = null;
         var _loc2_:RoomWidgetClothingChangeUpdateEvent = null;
         switch(param1.type)
         {
            case "RWFWM_MESSAGE_REQUEST_CLOTHING_CHANGE":
               _loc6_ = param1 as RoomWidgetFurniToWidgetMessage;
               if((_loc4_ = _container.roomEngine.getRoomObject(_loc6_.roomId,_loc6_.id,_loc6_.category)) != null)
               {
                  if((_loc9_ = _loc4_.getModel()) != null)
                  {
                     _loc3_ = _container.roomSession.isRoomOwner || _container.sessionDataManager.isAnyRoomController || _container.roomSession.roomControllerLevel >= 1;
                     if(_loc3_)
                     {
                        _loc2_ = new RoomWidgetClothingChangeUpdateEvent("RWCCUE_SHOW_GENDER_SELECTION",_loc6_.id,_loc6_.category,_loc6_.roomId);
                        _container.events.dispatchEvent(_loc2_);
                        break;
                     }
                     break;
                  }
                  break;
               }
               break;
            case "RWCCM_REQUEST_EDITOR":
               _loc7_ = param1 as RoomWidgetClothingChangeMessage;
               if((_loc4_ = _container.roomEngine.getRoomObject(_loc7_.roomId,_loc7_.objectId,_loc7_.objectCategory)) != null)
               {
                  if((_loc9_ = _loc4_.getModel()) != null)
                  {
                     var_347 = _loc7_.objectId;
                     _loc5_ = "M";
                     if((_loc8_ = String(_loc9_.getString("furniture_clothing_boy"))) == null || _loc8_ == "")
                     {
                        _loc8_ = "hd-99999-99999.lg-270-62";
                     }
                     if(_loc7_.gender == "F")
                     {
                        _loc5_ = "F";
                        if((_loc8_ = String(_loc9_.getString("furniture_clothing_girl"))) == null || _loc8_ == "")
                        {
                           _loc8_ = "hd-99999-99999.ch-630-62.lg-695-62";
                        }
                     }
                     if(_container.avatarEditor.openEditor(1,this,["torso","legs"],false,"${widget.furni.clothingchange.editor.title}"))
                     {
                        _container.avatarEditor.loadAvatarInEditor(1,_loc8_,_loc5_,0);
                        _loc2_ = new RoomWidgetClothingChangeUpdateEvent("RWCCUE_SHOW_GENDER_SELECTION",_loc7_.objectId,_loc7_.objectCategory,_loc7_.roomId);
                        _container.events.dispatchEvent(_loc2_);
                        break;
                     }
                     break;
                  }
                  break;
               }
         }
         return null;
      }
      
      public function update() : void
      {
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function saveFigure(param1:String, param2:String) : void
      {
         if(_container == null)
         {
            return;
         }
         _container.roomSession.sendUpdateClothingChangeFurniture(var_347,param2,param1);
         _container.avatarEditor.close(1);
      }
   }
}
