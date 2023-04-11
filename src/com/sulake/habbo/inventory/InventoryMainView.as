package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ILabelWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.utils.WindowToggle;
   import com.sulake.habbo.window.class_1684;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class InventoryMainView
   {
      
      private static const COUNTER_MARGIN:int = 3;
       
      
      private const DEFAULT_VIEW_LOCATION:Point = new Point(120,150);
      
      private var _windowManager:class_1684;
      
      private var var_2029:class_21;
      
      private var var_1439:class_3281;
      
      private var var_1739:String;
      
      private var var_3373:class_3151;
      
      private var var_2145:String;
      
      private var var_3665:class_3151;
      
      private var var_282:com.sulake.habbo.inventory.HabboInventory;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_2758:class_3151;
      
      private var var_2632:class_3151;
      
      private var var_2701:class_3151;
      
      private var var_2753:class_3151;
      
      private var var_2708:class_3151;
      
      private var var_3710:Dictionary;
      
      public function InventoryMainView(param1:com.sulake.habbo.inventory.HabboInventory, param2:class_1684, param3:class_21)
      {
         super();
         var_282 = param1;
         var_2029 = param3;
         _windowManager = param2;
      }
      
      public function get isVisible() : Boolean
      {
         return !!var_1439 ? var_1439.visible : false;
      }
      
      public function get isActive() : Boolean
      {
         return !!var_1439 ? var_1439.getStateFlag(1) : false;
      }
      
      public function get emptyContainer() : class_3151
      {
         if(!var_1439)
         {
            return null;
         }
         return var_1439.findChildByName("empty_container") as class_3151;
      }
      
      public function get loadingContainer() : class_3151
      {
         if(!var_1439)
         {
            return null;
         }
         return var_1439.findChildByName("loading_container") as class_3151;
      }
      
      public function get mainContainer() : class_3151
      {
         if(!var_1439)
         {
            return null;
         }
         return var_1439.findChildByName("contentArea") as class_3151;
      }
      
      public function dispose() : void
      {
         var_2758 = null;
         var_2632 = null;
         var_2708 = null;
         var_2753 = null;
         var_2701 = null;
         var_282 = null;
         var_3373 = null;
         var_3665 = null;
         if(var_1439)
         {
            var_1439.dispose();
            var_1439 = null;
         }
         if(_toolbar)
         {
            if(false)
            {
               _toolbar.events.removeEventListener("HTE_TOOLBAR_CLICK",onHabboToolbarEvent);
            }
            _toolbar = null;
         }
         _windowManager = null;
         var_2029 = null;
      }
      
      private function getWindow() : class_3281
      {
         var _loc4_:IAsset = null;
         var _loc1_:XmlAsset = null;
         var _loc2_:ITabContextWindow = null;
         var _loc3_:* = null;
         var _loc5_:ITabButtonWindow = null;
         if(!var_1439)
         {
            _loc4_ = var_2029.getAssetByName("inventory_xml");
            _loc1_ = XmlAsset(_loc4_);
            var_3710 = new Dictionary();
            var_1439 = _windowManager.buildFromXML(XML(_loc1_.content)) as class_3281;
            if(var_1439 != null)
            {
               var_1439.position = DEFAULT_VIEW_LOCATION;
               var_1439.visible = false;
               var_1439.procedure = windowEventProc;
               var_1439.setParamFlag(65536,var_282.getBoolean("inventory.allow.scaling"));
               extractWindow("furni");
               extractWindow("pets");
               extractWindow("bots");
               extractWindow("badges");
               _loc2_ = var_1439.findChildByName("tabs") as ITabContextWindow;
               _loc3_ = [];
               while(_loc2_.numTabItems > 0)
               {
                  _loc5_ = _loc2_.getTabItemAt(0);
                  _loc3_.push(_loc5_);
                  _loc2_.removeTabItem(_loc5_);
               }
               for each(_loc5_ in _loc3_)
               {
                  switch(_loc5_.name)
                  {
                     case "bots":
                        if(var_282.getBoolean("inventory.bots.enabled"))
                        {
                           _loc2_.addTabItem(_loc5_);
                        }
                        break;
                     case "rentables":
                        if(var_282.getBoolean("duckets.enabled"))
                        {
                           _loc2_.addTabItem(_loc5_);
                        }
                        break;
                     default:
                        _loc2_.addTabItem(_loc5_);
                        break;
                  }
               }
               var_282.preparingInventoryView();
            }
            var_282.updateUnseenItemCounts();
         }
         if(false)
         {
            var_1439.y = 0;
         }
         if(false)
         {
            var_1439.x = 0;
         }
         return var_1439;
      }
      
      public function getCategoryViewId() : String
      {
         return var_1739;
      }
      
      public function getSubCategoryViewId() : String
      {
         return var_2145;
      }
      
      public function hideInventory() : void
      {
         var_282.closingInventoryView();
         var _loc1_:class_3127 = getWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = false;
      }
      
      public function showInventory() : void
      {
         var _loc1_:class_3127 = getWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         var_282.inventoryViewOpened(var_2145 && false ? var_2145 : var_1739);
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = true, param3:Boolean = false) : Boolean
      {
         var _loc4_:class_3127;
         if((_loc4_ = getWindow()) == null)
         {
            return false;
         }
         if(_loc4_.visible)
         {
            if(var_1739 == param1)
            {
               if(param2)
               {
                  if(!WindowToggle.isHiddenByOtherWindows(_loc4_))
                  {
                     hideInventory();
                     return false;
                  }
                  _loc4_.activate();
               }
            }
            else
            {
               setViewToCategory(param1);
            }
         }
         else
         {
            if(param3 && var_1739 != null && var_1739 != param1)
            {
               setViewToCategory(param1);
            }
            _loc4_.visible = true;
            _loc4_.activate();
            if(param1 != var_1739 || !var_282.isInventoryCategoryInit(param1))
            {
               setViewToCategory(param1);
            }
            var_282.inventoryViewOpened(param1);
         }
         return true;
      }
      
      public function toggleSubCategoryView(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:class_3127 = getWindow();
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.visible)
         {
            if(var_2145 == param1)
            {
               if(param2)
               {
                  _loc3_.visible = false;
               }
            }
            else
            {
               setSubViewToCategory(param1);
            }
         }
         else
         {
            _loc3_.visible = true;
            if(param1 != var_2145)
            {
               setSubViewToCategory(param1);
            }
         }
      }
      
      public function updateSubCategoryView() : void
      {
         if(var_2145 == null)
         {
            return;
         }
         setSubViewToCategory(var_2145);
      }
      
      public function setToolbar(param1:IHabboToolbar) : void
      {
         _toolbar = param1;
         _toolbar.events.addEventListener("HTE_TOOLBAR_CLICK",onHabboToolbarEvent);
      }
      
      public function windowEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:String = null;
         if(param1.type == "WE_SELECTED")
         {
            _loc3_ = String(ITabContextWindow(param2).selector.getSelected().name);
            if(_loc3_ != var_1739)
            {
               resetUnseenCounters(var_1739);
               var_282.toggleInventoryPage(_loc3_);
            }
         }
         else if(param1.type == "WME_CLICK")
         {
            if(param2.name == "header_button_close")
            {
               hideInventory();
            }
            if(param2.name == "open_catalog_btn")
            {
               var_282.catalog.openCatalog();
            }
         }
         else if(param1.type == "WME_DOUBLE_CLICK")
         {
            if(param2.name == "titlebar")
            {
               var_1439.height = var_1439.limits.minHeight;
            }
         }
      }
      
      public function updateUnseenFurniCount(param1:int) : void
      {
         if(!var_1439)
         {
            return;
         }
         if(!var_2758)
         {
            var_2758 = createCounter("furni");
         }
         updateCounter(var_2758,param1);
         var_282.furniModel.updateView();
      }
      
      public function updateUnseenRentedFurniCount(param1:int) : void
      {
         if(!var_1439)
         {
            return;
         }
         if(!var_2632)
         {
            var_2632 = createCounter("rentables");
         }
         updateCounter(var_2632,param1);
         var_282.furniModel.updateView();
      }
      
      public function updateUnseenPetsCount(param1:int) : void
      {
         if(!var_1439)
         {
            return;
         }
         if(!var_2753)
         {
            var_2753 = createCounter("pets");
         }
         updateCounter(var_2753,param1);
         var_282.petsModel.updateView();
      }
      
      public function updateUnseenBadgeCount(param1:int) : void
      {
         if(!var_1439)
         {
            return;
         }
         if(!var_2701)
         {
            var_2701 = createCounter("badges");
         }
         updateCounter(var_2701,param1);
         var_282.badgesModel.updateView();
      }
      
      public function updateUnseenBotCount(param1:int) : void
      {
         if(!var_1439)
         {
            return;
         }
         if(!var_2708)
         {
            var_2708 = createCounter("bots");
         }
         updateCounter(var_2708,param1);
         var_282.botsModel.updateView();
      }
      
      public function getView(param1:String) : class_3151
      {
         return var_3710[param1] as class_3151;
      }
      
      private function extractWindow(param1:String) : void
      {
         var _loc2_:class_3127 = mainContainer.getChildByName(param1);
         if(_loc2_)
         {
            var_3710[param1] = mainContainer.removeChild(_loc2_);
         }
      }
      
      private function resetUnseenCounters(param1:String) : void
      {
         switch(param1)
         {
            case "furni":
               var_282.furniModel.resetUnseenItems();
               break;
            case "rentables":
               var_282.furniModel.resetUnseenItems();
               break;
            case "pets":
               var_282.petsModel.resetUnseenItems();
               break;
            case "badges":
               var_282.badgesModel.resetUnseenItems();
               break;
            case "bots":
               var_282.botsModel.resetUnseenItems();
         }
      }
      
      private function setViewToCategory(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 == "")
         {
            return;
         }
         if(emptyContainer)
         {
            emptyContainer.visible = false;
         }
         if(loadingContainer)
         {
            loadingContainer.visible = false;
         }
         var_282.checkCategoryInitilization(param1);
         if(mainContainer == null)
         {
            return;
         }
         mainContainer.removeChild(var_3373);
         mainContainer.invalidate();
         var _loc2_:class_3151 = var_282.getCategoryWindowContainer(param1);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         mainContainer.addChild(_loc2_);
         _loc2_.height = mainContainer.height;
         var_282.updateView(param1);
         var_3373 = _loc2_;
         var_1739 = param1;
         var _loc3_:ITabContextWindow = var_1439.findChildByName("tabs") as ITabContextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.selector.setSelected(_loc3_.selector.getSelectableByName(param1));
      }
      
      private function enableScaling() : void
      {
         var_1439.height = var_1439.limits.minHeight;
         var_1439.setParamFlag(65536,true);
         var_1439.findChildByName("top_content").setParamFlag(2048,true);
      }
      
      private function disableScaling() : void
      {
         var_1439.height = var_1439.limits.minHeight;
         var_1439.setParamFlag(65536,false);
         var_1439.findChildByName("top_content").setParamFlag(2048,false);
      }
      
      private function setSubViewToCategory(param1:String) : void
      {
         if(param1 == null || param1 == "")
         {
            return;
         }
         var_282.checkCategoryInitilization(param1);
         var _loc2_:class_3151 = var_1439.findChildByName("subContentArea") as class_3151;
         while(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         var _loc3_:class_3151 = var_282.getCategorySubWindowContainer(param1);
         if(_loc3_ != null)
         {
            disableScaling();
            _loc2_.visible = true;
            _loc3_.visible = true;
            _loc2_.height = _loc3_.height;
            _loc2_.addChild(_loc3_);
         }
         else
         {
            enableScaling();
            _loc2_.visible = false;
            _loc2_.height = 0;
         }
         _loc2_.y = var_1439.findChildByName("top_content").rectangle.bottom + 5;
         var_1439.resizeToFitContent();
         if(false)
         {
            if(NaN > var_1439.parent.width)
            {
               var_1439.x = var_1439.parent.width - 0;
            }
            if(NaN > var_1439.parent.height)
            {
               var_1439.y = (var_1439.parent.height - 0) * 0.5;
            }
            if(false)
            {
               var_1439.y = 0;
            }
         }
         var_3665 = _loc3_;
         var_2145 = param1;
      }
      
      private function createCounter(param1:String) : class_3151
      {
         var _loc3_:class_3151 = _windowManager.createUnseenItemCounter();
         var _loc2_:class_3151 = var_1439.findChildByName(param1) as class_3151;
         if(_loc2_)
         {
            _loc2_.addChild(_loc3_);
            _loc3_.x = _loc2_.width - _loc3_.width - 3;
            _loc3_.y = 3;
         }
         return _loc3_;
      }
      
      private function updateCounter(param1:class_3151, param2:int) : void
      {
         var _loc5_:ILabelWindow = null;
         param1.findChildByName("count").caption = param2.toString();
         param1.visible = param2 > 0;
         var _loc3_:String = "";
         switch(param1)
         {
            case var_2708:
               _loc3_ = "bots";
               break;
            case var_2753:
               _loc3_ = "pets";
               break;
            case var_2701:
               _loc3_ = "badges";
               break;
            case var_2758:
               _loc3_ = "furni";
               break;
            case var_2632:
               _loc3_ = "rentables";
         }
         var _loc4_:class_3151;
         if(_loc4_ = var_1439.findChildByName(_loc3_) as class_3151)
         {
            if(_loc5_ = _loc4_.getChildByTag("TITLE") as ILabelWindow)
            {
               if(param1.visible)
               {
                  _loc5_.margins.right = param1.width + 6;
               }
               else
               {
                  _loc5_.margins.right = _loc5_.margins.left;
               }
               _loc4_.width = _loc5_.width;
               param1.x = _loc4_.width - param1.width - 3;
            }
         }
      }
      
      public function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.iconId != "HTIE_ICON_INVENTORY")
         {
            return;
         }
         if(param1.type == "HTE_TOOLBAR_CLICK")
         {
            if(var_1739 == "pets")
            {
               toggleCategoryView("pets");
            }
            else if(var_1739 == "furni")
            {
               toggleCategoryView("furni");
            }
            else if(var_1739 == "rentables")
            {
               toggleCategoryView("rentables");
            }
            else if(var_1739 == "badges")
            {
               toggleCategoryView("badges");
            }
            else if(var_1739 == "bots")
            {
               toggleCategoryView("bots");
            }
            else if(var_282 != null)
            {
               var_282.toggleInventoryPage("furni");
            }
         }
      }
   }
}
