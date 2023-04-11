package com.sulake.habbo.ui.widget.playlisteditor
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.sound.ISongInfo;
   import flash.geom.ColorTransform;
   
   public class PlayListEditorItemListView
   {
       
      
      private var var_2334:IItemListWindow;
      
      private var _items:Array;
      
      private var var_1429:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget;
      
      private var var_1525:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorItem;
      
      private var var_2398:int = -1;
      
      private var var_2879:int = -1;
      
      public function PlayListEditorItemListView(param1:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget, param2:IItemListWindow)
      {
         super();
         var_2334 = param2;
         var_1429 = param1;
         var_1525 = null;
      }
      
      public function get selectedItemIndex() : int
      {
         return var_2398;
      }
      
      public function destroy() : void
      {
         if(var_2334 == null)
         {
            return;
         }
         var_2334.destroyListItems();
      }
      
      public function refresh(param1:Array, param2:int) : void
      {
         var _loc3_:String = null;
         var _loc7_:String = null;
         var _loc5_:ColorTransform = null;
         var _loc4_:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorItem = null;
         if(var_2334 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var_2879 = -1;
         _items = [];
         var_2334.destroyListItems();
         for each(var _loc6_ in param1)
         {
            _loc3_ = String(_loc6_.name);
            _loc7_ = _loc6_.creator;
            _loc5_ = var_1429.getDiskColorTransformFromSongData(_loc6_.songData);
            (_loc4_ = new com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorItem(var_1429,_loc3_,_loc7_,_loc5_)).window.procedure = itemEventProc;
            _loc4_.removeButton.procedure = itemEventProc;
            var_2334.addListItem(_loc4_.window);
            _items.push(_loc4_);
         }
         setItemIndexPlaying(param2);
      }
      
      public function setItemIndexPlaying(param1:int) : void
      {
         var _loc2_:com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorItem = null;
         if(_items == null)
         {
            return;
         }
         if(param1 < 0)
         {
            for each(var _loc3_ in _items)
            {
               _loc3_.setIconState("PLEI_ICON_STATE_NORMAL");
            }
            return;
         }
         if(param1 >= _items.length)
         {
            return;
         }
         if(var_2879 >= 0 && var_2879 < _items.length)
         {
            _loc2_ = _items[var_2879] as com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorItem;
            _loc2_.setIconState("PLEI_ICON_STATE_NORMAL");
         }
         _loc2_ = _items[param1] as com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorItem;
         _loc2_.setIconState("PLEI_ICON_STATE_PLAYING");
         var_2879 = param1;
      }
      
      public function deselectAny() : void
      {
         if(var_1525 != null)
         {
            var_1525.deselect();
            var_1525 = null;
            var_2398 = -1;
         }
      }
      
      private function itemEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1.type == "WME_DOUBLE_CLICK";
         if(param1.type == "WME_CLICK" || _loc3_)
         {
            if(param2.name == "button_remove_from_playlist" || _loc3_)
            {
               if(var_1525 != null)
               {
                  var_1525.deselect();
               }
               if(var_2398 > -1)
               {
                  var_1429.sendRemoveFromPlayListMessage(var_2398);
               }
               var_1525 = null;
               var_2398 = -1;
            }
            else
            {
               if(var_1525 != null)
               {
                  var_1525.deselect();
               }
               if((_loc4_ = var_2334.getListItemIndex(param1.window)) != -1)
               {
                  var_2398 = _loc4_;
                  var_1525 = _items[_loc4_];
                  var_1525.select();
                  if(param2.name == "button_remove_from_playlist")
                  {
                     var_1429.sendRemoveFromPlayListMessage(_loc4_);
                  }
                  if(false)
                  {
                     var_1429.mainWindowHandler.musicInventoryView.deselectAny();
                  }
               }
            }
         }
      }
   }
}
