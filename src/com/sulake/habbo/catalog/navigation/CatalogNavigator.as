package com.sulake.habbo.catalog.navigation
{
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.TopViewSelector;
   import com.sulake.habbo.catalog.event.CatalogEvent;
   import com.sulake.habbo.catalog.navigation.events.CatalogPageOpenedEvent;
   import flash.utils.Dictionary;
   import package_8.class_1291;
   
   public class CatalogNavigator implements class_3125
   {
      
      public static const DUMMY_PAGE_ID_FOR_OFFER_SEARCH:int = -12345678;
       
      
      private var _catalog:HabboCatalog;
      
      private var _container:class_3151;
      
      private var var_497:String;
      
      private var var_1995:ITabContextWindow;
      
      private var var_19:IItemListWindow;
      
      private var _index:com.sulake.habbo.catalog.navigation.class_3188;
      
      private var var_1742:Vector.<com.sulake.habbo.catalog.navigation.class_3188>;
      
      private var _offersToNodes:Dictionary;
      
      private var var_3536:class_3127;
      
      private var var_3713:class_3127;
      
      private var var_3742:class_3127;
      
      private var var_2373:TopViewSelector;
      
      public function CatalogNavigator(param1:HabboCatalog, param2:class_3151, param3:String)
      {
         super();
         _catalog = param1;
         _container = param2;
         var_497 = param3;
         var_1742 = new Vector.<com.sulake.habbo.catalog.navigation.class_3188>(0);
         var_19 = _container.findChildByName("navigationList") as IItemListWindow;
         var_3536 = var_19.removeListItem(var_19.getListItemByName(param3.toLowerCase() + "_topitem_template"));
         var_3713 = var_19.removeListItem(var_19.getListItemByName(param3.toLowerCase() + "_subitem_template"));
         var_3742 = var_19.removeListItem(var_19.getListItemByName(param3.toLowerCase() + "_list_template"));
         var_1995 = ITabContextWindow(_container.findChildByName("tab_context"));
         if(var_1995 != null)
         {
            if(_catalog.useNonTabbedCatalog())
            {
               var_1995.visible = false;
            }
            else
            {
               var_2373 = new TopViewSelector(this,var_1995);
            }
         }
      }
      
      private static function searchNodesWith(param1:String, param2:Array, param3:com.sulake.habbo.catalog.navigation.class_3188, param4:Vector.<com.sulake.habbo.catalog.navigation.class_3188>) : void
      {
         var _loc6_:Boolean = false;
         var _loc5_:String = null;
         try
         {
            if(param3.visible && param3.pageId > 0)
            {
               _loc6_ = false;
               if((_loc5_ = (_loc5_ = [param3.pageName,param3.localization].join(" ").toLowerCase()).replace(/ /gi,"")).indexOf(param1) > -1)
               {
                  param4.push(param3);
                  _loc6_ = true;
               }
               if(!_loc6_)
               {
                  for each(var _loc7_ in param2)
                  {
                     if(_loc5_.indexOf(_loc7_) >= 0)
                     {
                        param4.push(param3);
                        break;
                     }
                  }
               }
            }
            for each(var _loc8_ in param3.children)
            {
               searchNodesWith(param1,param2,_loc8_,param4);
            }
         }
         catch(e:Error)
         {
            class_14.log("Error when loading nodes by name " + param1 + ":",e);
         }
      }
      
      public function get initialized() : Boolean
      {
         return _index != null;
      }
      
      public function dispose() : void
      {
         if(_index != null)
         {
            _index.dispose();
         }
         _index = null;
         _offersToNodes = null;
         var_1742 = null;
         _catalog = null;
         _container = null;
         var_19 = null;
      }
      
      public function buildCatalogIndex(param1:class_1291) : void
      {
         _index = null;
         _offersToNodes = new Dictionary();
         _index = buildIndexNode(param1,0,null);
      }
      
      public function showIndex() : void
      {
         if(_index == null)
         {
            return;
         }
         var_19.removeListItems();
         if(var_2373 != null)
         {
            var_2373.clearTabs();
         }
         for each(var _loc1_ in _index.children)
         {
            if(_loc1_.visible)
            {
               if(_catalog.useNonTabbedCatalog())
               {
                  (_loc1_ as CatalogNodeRenderable).addToList(var_19);
               }
               else
               {
                  var_2373.addTabItem(_loc1_);
               }
            }
         }
         if(var_2373 != null)
         {
            var_2373.selectTabByIndex(0);
         }
      }
      
      public function showNodeContent(param1:com.sulake.habbo.catalog.navigation.class_3188) : void
      {
         if(_index == null)
         {
            return;
         }
         var_19.removeListItems();
         if(param1 == null || !param1.visible)
         {
            return;
         }
         if(param1.children.length)
         {
            for each(var _loc2_ in param1.children)
            {
               if(_loc2_.visible)
               {
                  (_loc2_ as CatalogNodeRenderable).addToList(var_19);
               }
            }
            activateNode(param1.children[0]);
         }
         else
         {
            openCatalogPage(param1);
         }
      }
      
      private function openCategoryForNode(param1:com.sulake.habbo.catalog.navigation.class_3188) : com.sulake.habbo.catalog.navigation.class_3188
      {
         var _loc3_:int = 0;
         var _loc2_:com.sulake.habbo.catalog.navigation.class_3188 = param1.parent;
         while(_loc2_ != null && _loc2_.parent != null && _loc2_.parent.pageName != "root")
         {
            _loc2_ = _loc2_.parent;
         }
         if(var_2373 && _loc2_.parent)
         {
            _loc3_ = _loc2_.parent.children.indexOf(_loc2_);
            var_2373.selectTabByIndex(_loc3_);
         }
         showNodeContent(_loc2_);
         return _loc2_;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function activateNode(param1:com.sulake.habbo.catalog.navigation.class_3188) : void
      {
         var _loc3_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:* = var_1742.indexOf(param1) >= 0;
         var _loc2_:Boolean = param1.isOpen;
         var _loc6_:Vector.<com.sulake.habbo.catalog.navigation.class_3188> = new Vector.<com.sulake.habbo.catalog.navigation.class_3188>(0);
         for each(var _loc4_ in var_1742)
         {
            _loc4_.deactivate();
            if(_loc4_.depth < param1.depth)
            {
               _loc6_.push(_loc4_);
            }
            else
            {
               _loc4_.close();
            }
         }
         var_1742 = _loc6_;
         param1.activate();
         if(_loc8_ && _loc2_)
         {
            param1.close();
         }
         else
         {
            param1.open();
         }
         if(var_1742.indexOf(param1) < 0)
         {
            var_1742.push(param1);
         }
         if(param1.isBranch)
         {
            if(param1.parent && param1.parent is CatalogNodeRenderable)
            {
               (param1.parent as CatalogNodeRenderable).updateChildListHeight();
            }
            _loc3_ = 0;
            _loc5_ = 0;
            _loc7_ = 0;
            while(_loc7_ < var_19.numListItems)
            {
               if(var_19.getListItemAt(_loc7_).visible)
               {
                  _loc5_ += var_19.getListItemAt(_loc7_).height;
               }
               _loc7_++;
            }
            for each(param1 in var_1742)
            {
               _loc3_ += param1.offsetV;
            }
            if(_loc3_ - 0 > 0)
            {
               var_19.scrollV = _loc3_ / _loc5_;
            }
         }
         if(param1.pageId > -1)
         {
            openCatalogPage(param1);
         }
      }
      
      private function openCatalogPage(param1:com.sulake.habbo.catalog.navigation.class_3188) : void
      {
         _catalog.loadCatalogPage(param1.pageId,-1,var_497);
         _catalog.events.dispatchEvent(new CatalogPageOpenedEvent(param1.pageId,param1.localization));
      }
      
      public function openPage(param1:String) : void
      {
         var _loc2_:com.sulake.habbo.catalog.navigation.class_3188 = getNodeByName(param1);
         if(_loc2_ != null && _loc2_.visible)
         {
            _catalog.loadCatalogPage(_loc2_.pageId,-1,var_497);
            openNavigatorAtNode(_loc2_);
         }
         else
         {
            if(_loc2_ != null && !_loc2_.visible)
            {
               _catalog.events.dispatchEvent(new CatalogEvent("CATALOG_INVISIBLE_PAGE_VISITED"));
            }
            loadFrontPage();
         }
      }
      
      public function openPageById(param1:int, param2:int) : void
      {
         var _loc3_:com.sulake.habbo.catalog.navigation.class_3188 = null;
         var _loc4_:* = undefined;
         if(!initialized)
         {
            _catalog.openCatalogPageById(param1,param2,var_497);
         }
         else
         {
            if(param1 == -12345678)
            {
               if((_loc4_ = getNodesByOfferId(param2,true)) != null)
               {
                  _loc3_ = _loc4_[0];
               }
            }
            else
            {
               _loc3_ = getNodeById(param1);
            }
            if(_loc3_ != null)
            {
               _catalog.loadCatalogPage(_loc3_.pageId,param2,var_497);
               openNavigatorAtNode(_loc3_);
            }
         }
      }
      
      public function openPageByOfferId(param1:int) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:com.sulake.habbo.catalog.navigation.class_3188 = null;
         if(!initialized)
         {
            _catalog.openCatalogPageById(-12345678,param1,var_497);
         }
         else
         {
            _loc3_ = getNodesByOfferId(param1);
            if(_loc3_ != null)
            {
               _loc2_ = _loc3_[0];
               _catalog.loadCatalogPage(_loc2_.pageId,param1,var_497);
               openNavigatorAtNode(_loc2_);
            }
         }
      }
      
      public function deactivateCurrentNode() : void
      {
         for each(var _loc1_ in var_1742)
         {
            _loc1_.deactivate();
            _loc1_.close();
         }
         var_1742 = new Vector.<com.sulake.habbo.catalog.navigation.class_3188>(0);
      }
      
      public function filter(param1:String, param2:Array) : void
      {
         var _loc4_:Vector.<com.sulake.habbo.catalog.navigation.class_3188> = new Vector.<com.sulake.habbo.catalog.navigation.class_3188>(0);
         searchNodesWith(param1,param2,_index,_loc4_);
         var_19.removeListItems();
         for each(var _loc3_ in _loc4_)
         {
            class_14.log("Found node: " + [_loc3_.pageId,_loc3_.pageName,_loc3_.localization]);
            if(_loc3_.visible)
            {
               (_loc3_ as CatalogNodeRenderable).addToList(var_19);
            }
         }
      }
      
      private function openNavigatorAtNode(param1:com.sulake.habbo.catalog.navigation.class_3188) : void
      {
         if(param1 == null)
         {
            return;
         }
         deactivateCurrentNode();
         var _loc2_:com.sulake.habbo.catalog.navigation.class_3188 = param1.parent;
         while(_loc2_ != null && _loc2_.parent != null)
         {
            _loc2_.open();
            if(_catalog.useNonTabbedCatalog())
            {
               var_1742.push(_loc2_);
            }
            _loc2_ = _loc2_.parent;
         }
         if(!_catalog.useNonTabbedCatalog())
         {
            openCategoryForNode(param1);
         }
         activateNode(param1);
      }
      
      public function loadFrontPage() : void
      {
         if(_index == null)
         {
            return;
         }
         var _loc1_:com.sulake.habbo.catalog.navigation.class_3188 = getFirstNavigable(_index);
         if(_loc1_ == null)
         {
            return;
         }
         class_14.log("Load front page: " + _loc1_.localization + "(" + _loc1_.pageId + ")");
         _catalog.loadCatalogPage(_loc1_.pageId,-1,var_497);
      }
      
      private function getFirstNavigable(param1:com.sulake.habbo.catalog.navigation.class_3188) : com.sulake.habbo.catalog.navigation.class_3188
      {
         var _loc2_:com.sulake.habbo.catalog.navigation.class_3188 = null;
         if(param1.visible && param1 != _index)
         {
            return param1;
         }
         for each(var _loc3_ in param1.children)
         {
            _loc2_ = getFirstNavigable(_loc3_);
            if(_loc2_ != null)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function buildIndexNode(param1:class_1291, param2:int, param3:com.sulake.habbo.catalog.navigation.class_3188) : com.sulake.habbo.catalog.navigation.class_3188
      {
         var _loc4_:com.sulake.habbo.catalog.navigation.class_3188 = null;
         var _loc5_:Boolean;
         if(!(_loc5_ = param1.visible))
         {
            _loc4_ = new CatalogNode(this,param1,param2,param3);
         }
         else
         {
            _loc4_ = new CatalogNodeRenderable(this,param1,param2,param3);
         }
         for each(var _loc6_ in _loc4_.offerIds)
         {
            if(_loc6_ in _offersToNodes)
            {
               _offersToNodes[_loc6_].push(_loc4_);
            }
            else
            {
               _offersToNodes[_loc6_] = new <com.sulake.habbo.catalog.navigation.class_3188>[_loc4_];
            }
         }
         param2++;
         for each(var _loc7_ in param1.children)
         {
            _loc4_.addChild(buildIndexNode(_loc7_,param2,_loc4_));
         }
         return _loc4_;
      }
      
      public function getNodesByOfferId(param1:int, param2:Boolean = false) : Vector.<com.sulake.habbo.catalog.navigation.class_3188>
      {
         var _loc4_:* = undefined;
         if(_offersToNodes != null)
         {
            if(param2)
            {
               _loc4_ = new Vector.<com.sulake.habbo.catalog.navigation.class_3188>(0);
               for each(var _loc3_ in _offersToNodes[param1])
               {
                  if(_loc3_.visible)
                  {
                     _loc4_.push(_loc3_);
                  }
               }
               if(_loc4_.length > 0)
               {
                  return _loc4_;
               }
               return null;
            }
            return _offersToNodes[param1];
         }
         return null;
      }
      
      public function getNodeByName(param1:String) : com.sulake.habbo.catalog.navigation.class_3188
      {
         return _index != null ? getFirstNodeByName(param1,_index) : null;
      }
      
      public function getOptionalNodeByName(param1:String) : com.sulake.habbo.catalog.navigation.class_3188
      {
         return !!_index ? getFirstNodeByName(param1,_index) : null;
      }
      
      public function getNodeById(param1:int, param2:com.sulake.habbo.catalog.navigation.class_3188 = null) : com.sulake.habbo.catalog.navigation.class_3188
      {
         if(param2 == null)
         {
            param2 = _index;
         }
         if(param2 == null)
         {
            return null;
         }
         var _loc3_:* = null;
         if(param2.pageId == param1 && param2 != _index)
         {
            _loc3_ = param2;
         }
         else
         {
            for each(var _loc4_ in param2.children)
            {
               _loc3_ = getNodeById(param1,_loc4_);
               if(_loc3_ != null)
               {
                  break;
               }
            }
         }
         return _loc3_;
      }
      
      private function getFirstNodeByName(param1:String, param2:com.sulake.habbo.catalog.navigation.class_3188) : com.sulake.habbo.catalog.navigation.class_3188
      {
         var _loc3_:* = null;
         try
         {
            if(param2.pageName == param1 && param2 != _index)
            {
               _loc3_ = param2;
            }
            else
            {
               for each(var _loc4_ in param2.children)
               {
                  _loc3_ = getFirstNodeByName(param1,_loc4_);
                  if(_loc3_ != null)
                  {
                     break;
                  }
               }
            }
         }
         catch(e:Error)
         {
            class_14.log("Error when loading node by name " + param1 + ":",e);
         }
         return _loc3_;
      }
      
      public function get listTemplate() : class_3127
      {
         return var_3742;
      }
      
      public function get isDeepHierarchy() : Boolean
      {
         return (_catalog as class_20).getBoolean("catalog.deep.hierarchy");
      }
      
      public function getItemTemplate(param1:int) : class_3127
      {
         if(isDeepHierarchy)
         {
            return param1 > 2 ? var_3713 : var_3536;
         }
         return param1 == 1 ? var_3536 : var_3713;
      }
   }
}
