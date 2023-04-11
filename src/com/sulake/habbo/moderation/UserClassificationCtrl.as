package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.userclassification.UserClassificationData;
   import com.sulake.habbo.util.VisitUserUtil;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class UserClassificationCtrl implements class_13, ITrackedWindow
   {
      
      private static var CLASSIFICATION_ROW_POOL:Array = [];
      
      private static var CLASSIFICATION_ROW_POOL_MAX_SIZE:int = 200;
       
      
      private var _main:com.sulake.habbo.moderation.ModerationManager;
      
      private var _frame:class_3281;
      
      private var var_19:IItemListWindow;
      
      private var var_3533:int;
      
      private var var_4269:Array;
      
      private var _disposed:Boolean;
      
      private var var_2321:class_3151;
      
      private var var_2004:Timer;
      
      private var var_3044:Array;
      
      public function UserClassificationCtrl(param1:com.sulake.habbo.moderation.ModerationManager, param2:int)
      {
         var_3044 = [];
         super();
         _main = param1;
         var_3533 = param2;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function show() : void
      {
         var_2004 = new Timer(300,1);
         var_2004.addEventListener("timer",onResizeTimer);
         _main.messageHandler.addUserClassificationListener(this);
         _frame = class_3281(_main.getXmlWindow("userclassification_frame"));
         var_19 = IItemListWindow(_frame.findChildByName("userclassification_list"));
         var_2321 = var_19.getListItemAt(0) as class_3151;
         var_19.removeListItems();
         _frame.procedure = onWindow;
         var _loc1_:class_3127 = _frame.findChildByTag("close");
         _loc1_.procedure = onClose;
      }
      
      public function onUserClassification(param1:int, param2:Array) : void
      {
         if(param1 != var_3533)
         {
            return;
         }
         if(_disposed)
         {
            return;
         }
         this.var_4269 = param2;
         _frame.caption = "";
         populate();
         onResizeTimer(null);
         _frame.visible = true;
         _main.messageHandler.removeUserClassificationListener(this);
      }
      
      private function populate() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = true;
         for each(_loc2_ in var_4269)
         {
            populateRoomRow(_loc2_,_loc1_);
            _loc1_ = !_loc1_;
         }
      }
      
      private function populateRoomRow(param1:UserClassificationData, param2:Boolean) : void
      {
         var _loc5_:class_3151 = getRoomRowWindow();
         var _loc3_:uint = param2 ? 4288861930 : 4294967295;
         _loc5_.color = _loc3_;
         var _loc6_:class_3127;
         (_loc6_ = _loc5_.findChildByName("user_name_txt")).caption = param1.username;
         _loc6_.color = _loc3_;
         var _loc4_:ITextWindow;
         (_loc4_ = ITextWindow(_loc5_.findChildByName("visit_room_txt"))).color = _loc3_;
         var _loc7_:ITextWindow;
         (_loc7_ = ITextWindow(_loc5_.findChildByName("user_classification_txt"))).text = param1.classType;
         if(!_main || true)
         {
            _loc7_.visible = false;
            _loc4_.visible = false;
         }
         addClassificationRowToList(_loc5_,var_19);
         if(_main && false)
         {
            new OpenUserInfo(_frame,_main,_loc6_,param1.userId);
            new VisitUserUtil(_main,_loc4_,param1.userId);
         }
      }
      
      private function addClassificationRowToList(param1:class_3151, param2:IItemListWindow) : void
      {
         param2.addListItem(param1);
         var_3044.push(param1);
      }
      
      private function getRoomRowWindow() : class_3151
      {
         if(false)
         {
            return CLASSIFICATION_ROW_POOL.pop() as class_3151;
         }
         return class_3151(var_2321.clone());
      }
      
      private function storeClassificationRowWindow(param1:class_3151) : void
      {
         var _loc3_:class_3127 = null;
         var _loc2_:class_3127 = null;
         if(CLASSIFICATION_ROW_POOL.length < CLASSIFICATION_ROW_POOL_MAX_SIZE)
         {
            _loc3_ = param1.findChildByName("user_name_txt");
            _loc3_.procedure = null;
            _loc2_ = param1.findChildByName("visit_room_txt");
            _loc2_.procedure = null;
            param1.width = var_2321.width;
            param1.height = var_2321.height;
            CLASSIFICATION_ROW_POOL.push(param1);
         }
         else
         {
            param1.dispose();
         }
      }
      
      private function onClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         dispose();
      }
      
      private function onWindow(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WE_RESIZED" || param2 != _frame)
         {
            return;
         }
         if(!this.var_2004.running)
         {
            this.var_2004.reset();
            this.var_2004.start();
         }
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         var _loc3_:class_3151 = class_3151(var_19.parent);
         var _loc5_:class_3127 = _loc3_.getChildByName("scroller") as class_3127;
         var _loc4_:* = var_19.scrollableRegion.height > var_19.height;
         if(_loc5_.visible)
         {
            if(!_loc4_)
            {
               _loc5_.visible = false;
               var_19.width = NaN;
            }
         }
         else if(_loc4_)
         {
            _loc5_.visible = true;
            var_19.width = -17;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_19 != null)
         {
            var_19.removeListItems();
            var_19.dispose();
            var_19 = null;
         }
         if(_frame != null)
         {
            _frame.destroy();
            _frame = null;
         }
         _main = null;
         if(var_2004 != null)
         {
            var_2004.stop();
            var_2004.removeEventListener("timer",onResizeTimer);
            var_2004 = null;
         }
         for each(_loc1_ in var_3044)
         {
            storeClassificationRowWindow(_loc1_);
         }
         if(var_2321 != null)
         {
            var_2321.dispose();
            var_2321 = null;
         }
         var_3044 = [];
      }
      
      public function getType() : int
      {
         return 6;
      }
      
      public function getId() : String
      {
         return "" + var_3533;
      }
      
      public function getFrame() : class_3281
      {
         return _frame;
      }
   }
}
