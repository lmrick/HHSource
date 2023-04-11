package com.sulake.habbo.quest.seasonalcalendar
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.quest.HabboQuestEngine;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.roomevents.Util;
   import com.sulake.habbo.session.product.class_1695;
   import com.sulake.habbo.session.product.class_3200;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import package_23.class_276;
   import package_8.class_1608;
   import package_8.class_675;
   import package_8.class_746;
   
   public class CatalogPromo implements class_13, class_3158, class_1695
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var _window:class_3151;
      
      private var _connection:IConnection;
      
      private var var_1439:com.sulake.habbo.quest.seasonalcalendar.MainWindow;
      
      private var var_1008:class_1608 = null;
      
      private var _offerId:int = -1;
      
      private var var_344:int = -1;
      
      private var var_3596:class_675 = null;
      
      private var var_2831:IMessageEvent = null;
      
      private var var_2706:IMessageEvent = null;
      
      public function CatalogPromo(param1:HabboQuestEngine, param2:com.sulake.habbo.quest.seasonalcalendar.MainWindow)
      {
         super();
         _questEngine = param1;
         var_1439 = param2;
      }
      
      public function dispose() : void
      {
         if(_connection)
         {
            if(var_2831)
            {
               _connection.removeMessageEvent(var_2831);
               var_2831 = null;
            }
            if(var_2706)
            {
               _connection.removeMessageEvent(var_2706);
               var_2706 = null;
            }
            _connection = null;
         }
         _questEngine = null;
      }
      
      public function get disposed() : Boolean
      {
         return _questEngine == null;
      }
      
      public function onActivityPoints(param1:int, param2:int) : void
      {
         if(param1 == getActivityPointType())
         {
            _questEngine.localization.registerParameter("quests.seasonalcalendar.promo.balance","amount","" + param2);
            if(_window != null)
            {
               refresh();
            }
         }
      }
      
      private function getActivityPointType() : int
      {
         var _loc1_:String = String(_questEngine.configuration.getProperty("seasonalQuestCalendar.currency"));
         return isNaN(Number(_loc1_)) ? 0 : int(_loc1_);
      }
      
      public function prepare(param1:class_3281) : void
      {
         _window = class_3151(param1.findChildByName("catalog_promo_cont"));
         _window.findChildByName("buy_button").disable();
         _window.findChildByName("buy_button").procedure = onBuyButton;
         _connection = _questEngine.communication.connection;
         if(_connection != null)
         {
            var_2831 = new class_675(onDailyOfferMessage);
            var_2706 = new class_746(onCatalogPublished);
            _connection.addMessageEvent(var_2831);
            _connection.addMessageEvent(var_2706);
            _connection.send(new class_276());
         }
      }
      
      public function refresh() : void
      {
         var _loc5_:* = null;
         var _loc2_:class_3266 = null;
         var _loc4_:ITextWindow = ITextWindow(_window.findChildByName("your_balance_txt"));
         var _loc1_:class_3151 = class_3151(_window.findChildByName("currency_icon_cont"));
         _loc1_.x = _loc4_.x + _loc4_.width;
         Util.hideChildren(_loc1_);
         var _loc3_:class_3127 = _loc1_.findChildByName("currency_icon_" + getActivityPointType());
         if(_loc3_ != null)
         {
            _loc3_.visible = true;
         }
         if(var_1008 != null)
         {
            _loc5_ = null;
            _loc2_ = null;
            if(false)
            {
               _loc2_ = _questEngine.roomEngine.getWallItemImage(var_1008.furniClassId,new Vector3d(90,0,0),64,this,0,var_1008.extraParam);
            }
            else if(false)
            {
               _loc2_ = _questEngine.roomEngine.getFurnitureImage(var_1008.furniClassId,new Vector3d(90,0,0),64,this);
            }
            if(_loc2_ != null && _loc2_.data != null)
            {
               setPromoFurniImage(_loc2_.data);
            }
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         setPromoFurniImage(param2);
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      private function onBuyButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            class_14.log("Buy button clicked");
            if(_offerId != -1)
            {
               _questEngine.catalog.openCatalogPageById(var_344,_offerId,"NORMAL");
            }
         }
      }
      
      private function onDailyOfferMessage(param1:class_675) : void
      {
         _window.findChildByName("buy_button").enable();
         var _loc2_:class_3200 = _questEngine.sessionDataManager.getProductData(param1.offer.localizationId);
         if(_loc2_ != null)
         {
            ITextWindow(_window.findChildByName("promo_info")).text = _loc2_.name;
            var_344 = param1.pageId;
            _offerId = param1.offer.offerId;
            if(param1.offer.products.length > 0)
            {
               var_1008 = class_1608(param1.offer.products[0]);
               refresh();
            }
         }
         else if(var_3596 == null)
         {
            var_3596 = param1;
            _questEngine.sessionDataManager.addProductsReadyEventListener(this);
         }
      }
      
      public function productDataReady() : void
      {
         onDailyOfferMessage(var_3596);
      }
      
      private function setPromoFurniImage(param1:BitmapData) : void
      {
         var _loc5_:class_3282 = class_3282(_window.findChildByName("furni_preview"));
         var _loc2_:BitmapData = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         var _loc3_:Rectangle = param1.rect;
         if(_loc3_.width > _loc2_.rect.width)
         {
            _loc3_.x = (_loc3_.width - _loc2_.rect.width) / 2;
            _loc3_.width = _loc2_.rect.width;
         }
         if(_loc3_.height > _loc2_.rect.height)
         {
            _loc3_.y = (_loc3_.height - _loc2_.rect.height) / 2;
            _loc3_.height = _loc2_.rect.height;
         }
         var _loc4_:Point = new Point(0,0);
         if(_loc2_.rect.width > _loc3_.width)
         {
            _loc4_.x = (_loc2_.rect.width - _loc3_.width) / 2;
         }
         if(_loc2_.rect.height > _loc3_.height)
         {
            _loc4_.y = (_loc2_.rect.height - _loc3_.height) / 2;
         }
         _loc2_.copyPixels(param1,_loc3_,_loc4_);
         _loc5_.bitmap = _loc2_;
      }
      
      private function onCatalogPublished(param1:IMessageEvent) : void
      {
         if(_connection != null)
         {
            _connection.send(new class_276());
         }
      }
   }
}
