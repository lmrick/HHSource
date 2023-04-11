package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.class_3268;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import com.sulake.habbo.window.enum.class_3315;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import package_5.class_149;
   import package_5.class_579;
   import package_7.class_197;
   
   public class BadgeImageWidget implements class_3366
   {
      
      public static const TYPE:String = "badge_image";
      
      private static const const_924:String = "badge_image:type";
      
      private static const const_802:String = "badge_image:badge_id";
      
      private static const TYPE_DEFAULT:PropertyStruct = new PropertyStruct("badge_image:type","normal","String",false,class_3315.ALL);
      
      private static const ID_DEFAULT:PropertyStruct = new PropertyStruct("badge_image:badge_id","","String");
       
      
      private var _disposed:Boolean;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_2711:Boolean;
      
      private var var_464:class_3151;
      
      private var _bitmap:IStaticBitmapWrapperWindow;
      
      private var _region:IRegionWindow;
      
      private var var_271:String;
      
      private var var_484:String;
      
      private var _groupId:int;
      
      private var var_2894:class_149;
      
      private var var_2559:class_579;
      
      public function BadgeImageWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         var_271 = "null";
         var_484 = "null";
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("badge_image_xml").content as XML) as class_3151;
         _bitmap = var_464.findChildByName("bitmap") as IStaticBitmapWrapperWindow;
         _region = var_464.findChildByName("region") as IRegionWindow;
         _region.addEventListener("WME_CLICK",onClick);
         var_1547.rootWindow = var_464;
         var_464.width = var_1547.width;
         var_464.height = var_1547.height;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            groupId = 0;
            if(_region != null)
            {
               _region.removeEventListener("WME_CLICK",onClick);
               _region.dispose();
               _region = null;
            }
            _bitmap = null;
            if(var_464 != null)
            {
               var_464.dispose();
               var_464 = null;
            }
            if(var_1547 != null)
            {
               var_1547.rootWindow = null;
               var_1547 = null;
            }
            _windowManager = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get iterator() : IIterator
      {
         return EmptyIterator.INSTANCE;
      }
      
      public function get properties() : Array
      {
         var _loc2_:* = [];
         if(_disposed)
         {
            return _loc2_;
         }
         _loc2_.push(TYPE_DEFAULT.withValue(var_271));
         _loc2_.push(ID_DEFAULT.withValue(var_484));
         for each(var _loc1_ in _bitmap.properties)
         {
            if(_loc1_.key != "asset_uri")
            {
               _loc2_.push(_loc1_.withNameSpace("badge_image"));
            }
         }
         return _loc2_;
      }
      
      public function set properties(param1:Array) : void
      {
         var_2711 = true;
         var _loc3_:* = [];
         for each(var _loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "badge_image:type":
                  type = String(_loc2_.value);
                  break;
               case "badge_image:badge_id":
                  badgeId = String(_loc2_.value);
            }
            if(_loc2_.key != "badge_image:asset_uri")
            {
               _loc3_.push(_loc2_.withoutNameSpace());
            }
         }
         _bitmap.properties = _loc3_;
         var_2711 = false;
         refresh();
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function set type(param1:String) : void
      {
         var_271 = param1;
         refresh();
      }
      
      public function get badgeId() : String
      {
         return var_484;
      }
      
      public function set badgeId(param1:String) : void
      {
         var_484 = param1;
         refresh();
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function set groupId(param1:int) : void
      {
         _groupId = param1;
         var _loc2_:Boolean = var_271 == "group" && _groupId > 0;
         if(_windowManager != null && false)
         {
            if(!_loc2_ && var_2559 != null)
            {
               _windowManager.communication.removeHabboConnectionMessageEvent(var_2894);
               _windowManager.communication.removeHabboConnectionMessageEvent(var_2559);
               var_2894 = null;
               var_2559 = null;
            }
            else if(_loc2_ && var_2559 == null)
            {
               var_2894 = new class_149(onGroupDetailsChanged);
               var_2559 = new class_579(onHabboGroupBadges);
               _windowManager.communication.addHabboConnectionMessageEvent(var_2894);
               _windowManager.communication.addHabboConnectionMessageEvent(var_2559);
            }
         }
      }
      
      public function get bitmapData() : BitmapData
      {
         return class_3268(_bitmap).bitmapData;
      }
      
      public function get pivotPoint() : uint
      {
         return _bitmap.pivotPoint;
      }
      
      public function set pivotPoint(param1:uint) : void
      {
         _bitmap.pivotPoint = param1;
         _bitmap.invalidate();
      }
      
      public function get stretchedX() : Boolean
      {
         return _bitmap.stretchedX;
      }
      
      public function set stretchedX(param1:Boolean) : void
      {
         _bitmap.stretchedX = param1;
         _bitmap.invalidate();
      }
      
      public function get stretchedY() : Boolean
      {
         return _bitmap.stretchedY;
      }
      
      public function set stretchedY(param1:Boolean) : void
      {
         _bitmap.stretchedY = param1;
         _bitmap.invalidate();
      }
      
      public function get zoomX() : Number
      {
         return _bitmap.zoomX;
      }
      
      public function set zoomX(param1:Number) : void
      {
         _bitmap.zoomX = param1;
         _bitmap.invalidate();
      }
      
      public function get zoomY() : Number
      {
         return _bitmap.zoomY;
      }
      
      public function set zoomY(param1:Number) : void
      {
         _bitmap.zoomY = param1;
         _bitmap.invalidate();
      }
      
      public function get greyscale() : Boolean
      {
         return _bitmap.greyscale;
      }
      
      public function set greyscale(param1:Boolean) : void
      {
         _bitmap.greyscale = param1;
         _bitmap.invalidate();
      }
      
      public function get etchingColor() : uint
      {
         return _bitmap.etchingColor;
      }
      
      public function set etchingColor(param1:uint) : void
      {
         _bitmap.etchingColor = param1;
         _bitmap.invalidate();
      }
      
      public function get fitSizeToContents() : Boolean
      {
         return _bitmap.fitSizeToContents;
      }
      
      public function set fitSizeToContents(param1:Boolean) : void
      {
         _bitmap.fitSizeToContents = param1;
         _bitmap.invalidate();
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         if(_groupId > 0)
         {
            _windowManager.communication.connection.send(new class_197(_groupId,true));
         }
      }
      
      private function refresh() : void
      {
         if(var_2711)
         {
            return;
         }
         _bitmap.assetUri = assetUri;
         _bitmap.invalidate();
      }
      
      private function get assetUri() : String
      {
         var _loc1_:String = "";
         if(var_484 != null && false)
         {
            switch(var_271)
            {
               case "normal":
                  _loc1_ = "${image.library.url}album1584/" + var_484 + ".png";
                  break;
               case "group":
                  _loc1_ = _windowManager.getProperty("group.badge.url").replace("%imagerdata%",var_484);
                  break;
               case "perk":
                  _loc1_ = "${image.library.url}perk/" + var_484 + ".png";
            }
         }
         return _loc1_;
      }
      
      private function forceRefresh(param1:int, param2:String) : void
      {
         if(param1 != _groupId)
         {
            return;
         }
         var_484 = param2;
         _windowManager.resourceManager.removeAsset(assetUri);
         refresh();
      }
      
      private function onGroupDetailsChanged(param1:class_149) : void
      {
         forceRefresh(param1.groupId,var_484);
      }
      
      private function onHabboGroupBadges(param1:class_579) : void
      {
         if(param1.badges.hasKey(_groupId))
         {
            forceRefresh(_groupId,param1.badges[_groupId]);
         }
      }
      
      public function get etchingPoint() : Point
      {
         return new Point(0,1);
      }
      
      public function get wrapX() : Boolean
      {
         return false;
      }
      
      public function set wrapX(param1:Boolean) : void
      {
      }
      
      public function get wrapY() : Boolean
      {
         return false;
      }
      
      public function set wrapY(param1:Boolean) : void
      {
      }
   }
}
