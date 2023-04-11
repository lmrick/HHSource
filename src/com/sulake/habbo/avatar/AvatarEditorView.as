package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.common.AvatarEditorGridView;
   import com.sulake.habbo.avatar.common.class_3392;
   import com.sulake.habbo.avatar.effects.AvatarEditorGridViewEffects;
   import com.sulake.habbo.avatar.view.AvatarEditorNameChangeView;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class AvatarEditorView
   {
      
      public static var THUMB_WINDOW:class_3151;
      
      public static var COLOUR_WINDOW:class_3151;
      
      public static var TAB_BACKGROUND_COLOUR:int = 6710886;
      
      private static const SAVE_TIMEOUT_MS:int = 1500;
      
      private static const DEFAULT_LOCATION:Point = new Point(100,30);
       
      
      private var var_1449:com.sulake.habbo.avatar.HabboAvatarEditor;
      
      private var var_1457:class_3151;
      
      private var var_3300:String;
      
      private var var_1699:ITabContextWindow;
      
      private var var_1506:class_3281;
      
      private var var_2198:class_3151;
      
      private var var_1919:Timer;
      
      private var _avatarDirection:int = 4;
      
      private var var_3354:String;
      
      private var _showWardrobeOnUpdate:Boolean = true;
      
      private var var_2977:Array;
      
      private var var_2436:Array;
      
      private var _categoryContainers:Dictionary;
      
      private var var_1584:class_3392;
      
      private var var_3835:class_3392;
      
      private var var_3256:AvatarEditorNameChangeView;
      
      public function AvatarEditorView(param1:com.sulake.habbo.avatar.HabboAvatarEditor, param2:Array)
      {
         var_2977 = [];
         var_2436 = ["generic","head","torso","legs","hotlooks","wardrobe","nfts"];
         super();
         var_1449 = param1;
         var_1919 = new Timer(1500,1);
         var_1919.addEventListener("timer",onUpdate);
         if(param1.manager.getBoolean("effects.in.avatar.editor"))
         {
            var_2436.push("effects");
         }
         if(param2 == null)
         {
            param2 = var_2436;
         }
         for each(var _loc3_ in param2)
         {
            var_2977.push(_loc3_);
         }
         createWindow();
      }
      
      public function dispose() : void
      {
         var _loc3_:class_3151 = null;
         var _loc2_:class_3151 = null;
         var _loc1_:class_3151 = null;
         if(var_1919 != null)
         {
            var_1919.stop();
            var_1919.removeEventListener("timer",onUpdate);
            var_1919 = null;
         }
         if(var_1699)
         {
            var_1699.dispose();
            var_1699 = null;
         }
         if(var_1457)
         {
            var_1457.dispose();
            var_1457 = null;
         }
         if(var_2198 != null)
         {
            var_2198.dispose();
            var_2198 = null;
         }
         if(var_1506)
         {
            var_1506.dispose();
            var_1506 = null;
         }
         if(var_1457 != null)
         {
            _loc3_ = var_1457.findChildByName("figureContainer") as class_3151;
            if(_loc3_ != null)
            {
               while(_loc3_.numChildren > 0)
               {
                  _loc3_.removeChildAt(0);
               }
            }
            _loc2_ = var_1457.findChildByName("contentArea") as class_3151;
            if(_loc2_ != null)
            {
               while(_loc2_.numChildren > 0)
               {
                  _loc2_.removeChildAt(0);
               }
            }
            _loc1_ = var_1457.findChildByName("sideContainer") as class_3151;
            if(_loc1_ != null)
            {
               while(_loc1_.numChildren > 0)
               {
                  _loc1_.removeChildAt(0);
               }
            }
            var_1449 = null;
         }
      }
      
      public function getFrame(param1:Array, param2:String = null) : class_3281
      {
         if(var_1506)
         {
            var_1506.visible = true;
            var_1506.activate();
            return var_1506;
         }
         if(var_1506)
         {
            var_1506.dispose();
            var_1506 = null;
         }
         var _loc3_:XmlAsset = var_1449.manager.assets.getAssetByName("AvatarEditorFrame") as XmlAsset;
         if(_loc3_)
         {
            var_1506 = var_1449.manager.windowManager.buildFromXML(_loc3_.content as XML) as class_3281;
         }
         if(var_1506 == null)
         {
            return null;
         }
         var _loc4_:class_3151 = var_1506.findChildByName("maincontent") as class_3151;
         if(!embedToContext(_loc4_,param1))
         {
            var_1506.dispose();
            var_1506 = null;
            return null;
         }
         if(param2 && false)
         {
            var_1506.header.title.text = param2;
         }
         var_1506.position = DEFAULT_LOCATION;
         var_1506.findChildByName("header_button_close").procedure = windowEventProc;
         return var_1506;
      }
      
      public function embedToContext(param1:class_3151, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         if(!validateAvailableCategories(param2))
         {
            return false;
         }
         if(param1)
         {
            _loc3_ = param1.getChildIndex(var_1457);
            if(_loc3_)
            {
               param1.removeChildAt(_loc3_);
            }
            param1.addChild(var_1457);
         }
         else
         {
            if(var_2198 == null)
            {
               var_2198 = var_1449.manager.windowManager.createWindow("avatarEditorContainer","",4,3,131073,new Rectangle(0,0,2,2),null,0) as class_3151;
               var_2198.addChild(var_1457);
            }
            _loc3_ = var_2198.getChildIndex(var_1457);
            if(_loc3_)
            {
               param1.removeChildAt(_loc3_);
            }
            var_2198.visible = true;
         }
         return true;
      }
      
      public function validateAvailableCategories(param1:Array) : Boolean
      {
         if(param1 == null)
         {
            return validateAvailableCategories(var_2436);
         }
         if(param1.length != var_2977.length)
         {
            return false;
         }
         for each(var _loc2_ in param1)
         {
            if(var_2977.indexOf(_loc2_) < 0)
            {
               return false;
            }
         }
         return true;
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         var_1919.stop();
         if(var_1457)
         {
            var_1457.findChildByName("save").enable();
         }
      }
      
      public function show() : void
      {
         if(var_1506)
         {
            var_1506.visible = true;
         }
         else if(var_1457)
         {
            var_1457.visible = true;
         }
      }
      
      public function hide() : void
      {
         if(var_1506)
         {
            var_1506.visible = false;
         }
         else if(var_1457)
         {
            var_1457.visible = false;
         }
      }
      
      private function createWindow() : void
      {
         var _loc4_:int = 0;
         var _loc3_:ITabButtonWindow = null;
         var _loc5_:int = 0;
         var _loc7_:class_3127 = null;
         if(var_1457 == null)
         {
            var_1457 = var_1449.manager.windowManager.buildFromXML((var_1449.manager.assets.getAssetByName("AvatarEditorContent") as XmlAsset).content as XML) as class_3151;
         }
         if(THUMB_WINDOW == null)
         {
            THUMB_WINDOW = var_1457.findChildByName("thumb_template") as class_3151;
            if(THUMB_WINDOW)
            {
               var_1457.removeChild(THUMB_WINDOW);
            }
         }
         if(COLOUR_WINDOW == null)
         {
            COLOUR_WINDOW = var_1457.findChildByName("palette_template") as class_3151;
            if(COLOUR_WINDOW)
            {
               var_1457.removeChild(COLOUR_WINDOW);
            }
         }
         if(false && var_1449.manager.sessionData != null)
         {
            var_1457.findChildByName("avatar_name").caption = var_1449.manager.sessionData.userName;
            if(var_1449.manager.getBoolean("premium.name.change.enabled"))
            {
               var_1457.findChildByName("avatar_name_change").visible = true;
            }
         }
         var_1457.procedure = windowEventProc;
         var_1699 = var_1457.findChildByName("mainTabs") as ITabContextWindow;
         var _loc1_:Vector.<String> = new Vector.<String>(0);
         _loc4_ = -1;
         while(_loc4_ >= 0)
         {
            _loc3_ = var_1699.getTabItemAt(_loc4_);
            _loc1_.push(_loc3_.name);
            if(_loc3_ != null && var_2977.indexOf(_loc3_.name) < 0)
            {
               var_1699.removeTabItem(_loc3_);
               _loc5_ = _loc4_ + 1;
               while(_loc5_ < var_1699.numTabItems)
               {
                  var_1699.getTabItemAt(_loc5_).x = var_1699.getTabItemAt(_loc5_).x - _loc3_.width;
                  _loc5_++;
               }
            }
            _loc4_--;
         }
         _categoryContainers = new Dictionary();
         var _loc2_:class_3151 = var_1457.findChildByName("contentArea") as class_3151;
         for each(var _loc6_ in _loc1_)
         {
            if(_loc7_ = _loc2_.findChildByName(_loc6_ + "_content"))
            {
               _categoryContainers[_loc6_] = _loc2_.removeChild(_loc7_);
            }
         }
         var_1584 = new AvatarEditorGridView(var_1457.findChildByName("grid_container") as class_3151);
         var_3835 = new AvatarEditorGridViewEffects(var_1457.findChildByName("grid_container") as class_3151);
         var_1699.selector.setSelected(var_1699.getTabItemAt(0));
         update();
      }
      
      public function update() : void
      {
         var _loc1_:class_3127 = var_1457.findChildByName("wardrobeButtonContainer") as class_3127;
         if(_loc1_ && var_1449.manager.sessionData)
         {
            _loc1_.visible = var_1449.manager.sessionData.hasClub && var_1449.isSideContentEnabled();
            _loc1_.visible = var_1449.isSideContentEnabled();
         }
         var _loc2_:String = "nothing";
         if(var_3354 == "wardrobe" || _showWardrobeOnUpdate)
         {
            _loc2_ = "wardrobe";
         }
         if(!var_1449.isSideContentEnabled())
         {
            _loc2_ = "nothing";
         }
         if(var_1449.hasInvalidClubItems())
         {
            var_1449.stripClubItems();
            var_1449.disableClubClothing();
         }
         if(var_1449.hasInvalidSellableItems())
         {
            var_1449.stripInvalidSellableItems();
         }
         setSideContent(_loc2_);
         setViewToCategory(var_3300);
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = false) : void
      {
         if(param2)
         {
         }
         setViewToCategory(param1);
      }
      
      private function toggleWardrobe() : void
      {
         if(var_3354 == "wardrobe")
         {
            _showWardrobeOnUpdate = false;
            setSideContent("nothing");
         }
         else
         {
            setSideContent("wardrobe");
         }
      }
      
      private function setSideContent(param1:String) : void
      {
         var _loc5_:int = 0;
         if(var_3354 == param1)
         {
            return;
         }
         var _loc2_:class_3151 = var_1457.findChildByName("sideContainer") as class_3151;
         if(!_loc2_)
         {
            return;
         }
         var _loc4_:class_3127 = null;
         switch(param1)
         {
            case "nothing":
               break;
            case "wardrobe":
               _loc4_ = var_1449.getSideContentWindowContainer("wardrobe");
         }
         var _loc3_:class_3127 = _loc2_.removeChildAt(0);
         if(_loc3_)
         {
            var_1457.width = 0 - _loc3_.width;
         }
         if(_loc4_)
         {
            _loc2_.addChild(_loc4_);
            _loc4_.visible = true;
            _loc2_.width = _loc4_.width;
         }
         else
         {
            _loc2_.width = 0;
         }
         var_3354 = param1;
         if(var_1506)
         {
            _loc5_ = 8;
            var_1506.content.width = var_1457.width + _loc5_;
         }
      }
      
      private function setViewToCategory(param1:String) : void
      {
         if(param1 == null || param1 == "")
         {
            return;
         }
         var _loc2_:class_3151 = var_1457.findChildByName("contentArea") as class_3151;
         if(_loc2_ == null)
         {
            return;
         }
         effectsParamViewContainer.visible = param1 == "effects";
         if("nfts" == param1)
         {
            _showWardrobeOnUpdate = false;
            var_1457.findChildByName("wardrobe").disable();
            setSideContent("nothing");
         }
         else
         {
            var_1457.findChildByName("wardrobe").enable();
         }
         var _loc4_:class_3127 = _loc2_.getChildAt(0);
         _loc2_.removeChild(_loc4_);
         _loc2_.invalidate();
         var _loc3_:class_3127 = var_1449.getCategoryWindowContainer(param1);
         if(_loc3_ == null)
         {
            return;
         }
         var_1584.window.visible = false;
         _loc3_.visible = true;
         _loc2_.addChild(_loc3_);
         var_1449.activateCategory(param1);
         var_3300 = param1;
         var_1699.selector.setSelected(var_1699.getTabItemByName(param1));
      }
      
      public function windowEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:String = null;
         var _loc6_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         if(param1.type == "WE_SELECTED")
         {
            _loc3_ = String((param2 as ITabContextWindow).selector.getSelected().name);
            if(_loc3_ != var_3300)
            {
               _loc6_ = false;
               _loc4_ = false;
               _loc5_ = false;
               if(_loc3_ != "effects" && _loc3_ != "hotlooks")
               {
                  if(var_1449.hasNftOutfit() && "nfts" == _loc3_)
                  {
                     _loc5_ = true;
                  }
                  else if(var_1449.hasNftOutfit() && _loc3_ != "nfts")
                  {
                     _loc6_ = true;
                  }
                  else if(editor.hasSetNftOutfitInViewer() && _loc3_ != "nfts")
                  {
                     _loc4_ = true;
                  }
               }
               if(var_1449.hasNftOutfit() && _loc3_ == "effects")
               {
                  _loc5_ = true;
               }
               var_1449.toggleAvatarEditorPage(_loc3_);
               if(_loc6_)
               {
                  var_1449.loadFallbackFigure();
               }
               else if(_loc4_)
               {
                  var_1449.loadRollbackFigure();
               }
               else if(_loc5_)
               {
                  var_1449.loadNftFigure();
               }
            }
         }
         else if(param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "save":
                  if(!var_1449.isDevelopmentEditor() && var_1449.hasInvalidSellableItems())
                  {
                     startSellablePurchase();
                     var_1919.start();
                     var_1457.findChildByName("save").disable();
                     return;
                  }
                  if(!var_1449.isDevelopmentEditor() && var_1449.hasInvalidClubItems())
                  {
                     var_1449.openHabboClubAdWindow();
                     var_1919.start();
                     var_1457.findChildByName("save").disable();
                     return;
                  }
                  var_1919.start();
                  var_1457.findChildByName("save").disable();
                  var_1449.saveCurrentSelection();
                  var_1449.manager.close(var_1449.instanceId);
                  break;
               case "cancel":
               case "header_button_close":
                  if(var_1449.hasInvalidClubItems())
                  {
                     var_1449.stripClubItems();
                     var_1449.disableClubClothing();
                  }
                  var_1449.manager.close(var_1449.instanceId);
                  break;
               case "rotate_avatar":
                  _avatarDirection++;
                  if(_avatarDirection > 7)
                  {
                     _avatarDirection = 0;
                  }
                  var_1449.figureData.direction = _avatarDirection;
                  break;
               case "wardrobe":
                  toggleWardrobe();
                  break;
               case "avatar_name_change":
                  if(var_3256 != null)
                  {
                     var_3256.focus();
                     break;
                  }
                  var_3256 = new AvatarEditorNameChangeView(this,NaN,var_1457.y);
                  break;
            }
         }
      }
      
      private function startSellablePurchase() : void
      {
         if(var_1449.manager.catalog)
         {
            var_1449.manager.catalog.openCatalogPage(var_1449.manager.getProperty("catalog.clothes.page"));
         }
      }
      
      public function get effectsParamViewContainer() : class_3151
      {
         return class_3151(var_1457.findChildByName("effectParamsContainer"));
      }
      
      public function getCategoryContainer(param1:String) : class_3127
      {
         return _categoryContainers[param1];
      }
      
      public function get gridView() : class_3392
      {
         return var_1584;
      }
      
      public function getFigureContainer() : class_3217
      {
         return var_1457.findChildByName("avatarWidget") as class_3217;
      }
      
      public function get effectsGridView() : class_3392
      {
         return var_3835;
      }
      
      public function get editor() : com.sulake.habbo.avatar.HabboAvatarEditor
      {
         return var_1449;
      }
      
      public function get avatarEditorNameChangeView() : AvatarEditorNameChangeView
      {
         return var_3256;
      }
      
      public function get currentViewId() : String
      {
         return var_3300;
      }
   }
}
