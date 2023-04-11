package com.sulake.habbo.ui.widget.furniture.contextmenu
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.widgets.class_3308;
   import com.sulake.room.object.IRoomObject;
   import package_109.class_639;
   import package_34.class_172;
   
   public class PurchasableClothingConfirmationView implements class_13
   {
      
      private static const PRODUCT_PAGE_UKNOWN:int = -1;
      
      private static const PRODUCT_PAGE_CLOTHING:int = 0;
      
      private static const const_563:String = "header_button_close";
      
      private static const const_526:String = "save_button";
      
      private static const const_530:String = "cancel_text";
      
      private static const const_515:String = "ok_button";
      
      private static const const_948:String = "avatar_preview";
       
      
      private var _window:class_3151;
      
      private var var_311:Boolean = false;
      
      private var var_1429:com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
      
      private var _windowManager:class_1684;
      
      private var _assets:class_21;
      
      private var var_2944:int = -1;
      
      private var var_1807:class_3148;
      
      private var _newFigureString:String;
      
      public function PurchasableClothingConfirmationView(param1:com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget)
      {
         super();
         var_1429 = param1;
         _windowManager = param1.windowManager;
         _assets = var_1429.assets;
      }
      
      public function dispose() : void
      {
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function open(param1:int) : void
      {
         var _loc7_:Array = null;
         var _loc5_:int = var_1429.handler.roomSession.roomId;
         var _loc6_:IRoomObject;
         if((_loc6_ = var_1429.handler.roomEngine.getRoomObject(_loc5_,param1,10)) != null)
         {
            var_1807 = var_1429.handler.getFurniData(_loc6_);
            var_2944 = _loc6_.getId();
            var _loc3_:int = -1;
            var _loc2_:Vector.<int> = new Vector.<int>(0);
            switch(-23)
            {
               case 0:
                  _loc3_ = 0;
                  _loc7_ = var_1807.customParams.split(",");
                  for each(var _loc4_ in _loc7_)
                  {
                     if(var_1429.handler.container.avatarRenderManager.isValidFigureSetForGender(parseInt(_loc4_),var_1429.handler.container.sessionDataManager.gender))
                     {
                        _loc2_.push(parseInt(_loc4_));
                     }
                  }
                  break;
               default:
                  class_14.log("[PurchasableClothingConfirmationView.open()] Unsupported furniture category: undefined");
            }
            _newFigureString = var_1429.handler.container.avatarRenderManager.getFigureStringWithFigureIds(var_1429.handler.container.sessionDataManager.figure,var_1429.handler.container.sessionDataManager.gender,_loc2_);
            if(var_1429.handler.container.inventory.hasBoundFigureSetFurniture(var_1807.className))
            {
               var_1429.handler.container.connection.send(new class_639(_newFigureString,var_1429.handler.container.sessionDataManager.gender));
            }
            else
            {
               setWindowContent(_loc3_);
               _window.visible = true;
            }
            return;
         }
      }
      
      private function setWindowContent(param1:int) : void
      {
         var _loc3_:String = null;
         var_1429.localizations.registerParameter("useproduct.widget.title.bind_clothing","name",var_1807.localizedName);
         if(!_window)
         {
            _loc3_ = "use_product_widget_frame_plant_seed_xml";
            _window = _windowManager.buildFromXML(_assets.getAssetByName(_loc3_).content as XML) as class_3151;
            addClickListener("header_button_close");
            _window.center();
         }
         _window.caption = "${useproduct.widget.title.bind_clothing}";
         var_1429.localizations.registerParameter("useproduct.widget.text.bind_clothing","productName",var_1807.localizedName);
         var _loc2_:class_3281 = _window as class_3281;
         _loc2_.content.removeChildAt(0);
         var _loc4_:class_3151 = createWindow(param1);
         _loc2_.content.addChild(_loc4_);
         switch(param1)
         {
            case 0:
               addClickListener("save_button");
               addClickListener("cancel_text");
               refreshAvatar();
               _window.invalidate();
               return;
            default:
               throw new Error("Invalid type for use product confirmation content apply: " + param1);
         }
      }
      
      private function createWindow(param1:int) : class_3151
      {
         var _loc2_:IAsset = null;
         var _loc3_:* = null;
         switch(param1)
         {
            case 0:
               _loc2_ = _assets.getAssetByName("use_product_controller_purchasable_clothing_xml");
               return _windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
            default:
               throw new Error("Invalid type for view content creation: " + param1);
         }
      }
      
      private function refreshAvatar() : void
      {
         var _loc1_:class_3217 = class_3217(_window.findChildByName("avatar_preview"));
         var _loc2_:class_3308 = class_3308(_loc1_.widget);
         _loc2_.figure = _newFigureString;
      }
      
      public function close() : void
      {
         if(_window != null)
         {
            _window.visible = false;
         }
      }
      
      private function addClickListener(param1:String) : void
      {
         _window.findChildByName(param1).addEventListener("WME_CLICK",onMouseClick);
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "header_button_close":
            case "cancel_text":
            case "ok_button":
               close();
               break;
            case "save_button":
               var_1429.handler.container.connection.send(new class_172(var_2944));
               var_1429.handler.container.connection.send(new class_639(_newFigureString,var_1429.handler.container.sessionDataManager.gender));
               close();
         }
      }
   }
}
