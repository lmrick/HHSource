package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ILabelWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import package_7.class_313;
   
   public class IlluminaChatBubbleWidget implements IIlluminaChatBubbleWidget
   {
      
      public static const TYPE:String = "illumina_chat_bubble";
      
      private static const const_882:String = "illumina_chat_bubble:flipped";
      
      private static const USER_NAME_KEY:String = "illumina_chat_bubble:user_name";
      
      private static const FIGURE_KEY:String = "illumina_chat_bubble:figure";
      
      private static const MESSAGE_KEY:String = "illumina_chat_bubble:message";
      
      private static const FLIPPED_DEFAULT:PropertyStruct = new PropertyStruct("illumina_chat_bubble:flipped",false,"Boolean");
      
      private static const USER_NAME_DEFAULT:PropertyStruct = new PropertyStruct("illumina_chat_bubble:user_name","","String");
      
      private static const FIGURE_DEFAULT:PropertyStruct = new PropertyStruct("illumina_chat_bubble:figure","","String");
      
      private static const MESSAGE_DEFAULT:PropertyStruct = new PropertyStruct("illumina_chat_bubble:message","","String");
       
      
      private var _disposed:Boolean;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      private var var_2785:Boolean;
      
      private var _userName:ILabelWindow;
      
      private var var_2411:class_3127;
      
      private var _avatarWidget:com.sulake.habbo.window.widgets.class_3308;
      
      private var var_2733:class_3127;
      
      private var var_357:ITextWindow;
      
      private var _postTime:com.sulake.habbo.window.widgets.class_3368;
      
      private var _offline:IRegionWindow;
      
      private var _arrowPoint:IStaticBitmapWrapperWindow;
      
      private var var_2711:Boolean;
      
      public function IlluminaChatBubbleWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         var_2785 = false;
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("illumina_chat_bubble_xml").content as XML) as class_3151;
         _userName = var_464.findChildByName("user_name") as ILabelWindow;
         var _loc3_:class_3217 = var_464.findChildByName("user_avatar") as class_3217;
         var_2411 = _loc3_.parent;
         _avatarWidget = _loc3_.widget as com.sulake.habbo.window.widgets.class_3308;
         var_2733 = var_464.findChildByName("bubble_wrapper");
         var_357 = var_464.findChildByName("message") as ITextWindow;
         _postTime = class_3217(var_464.findChildByName("post_time")).widget as com.sulake.habbo.window.widgets.class_3368;
         _offline = var_464.findChildByName("offline_placeholder") as IRegionWindow;
         _offline.height = 0;
         _arrowPoint = var_464.findChildByName("arrow_point") as IStaticBitmapWrapperWindow;
         var_464.findChildByName("message_region").setParamFlag(1,false);
         var_464.procedure = rootProcedure;
         userName = "null";
         figure = "null";
         message = "null";
         var_1547.rootWindow = var_464;
         var_1547.setParamFlag(147456);
         var_464.width = var_1547.width;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
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
         var _loc1_:* = [];
         if(_disposed)
         {
            return _loc1_;
         }
         _loc1_.push(FLIPPED_DEFAULT.withValue(flipped));
         _loc1_.push(USER_NAME_DEFAULT.withValue(userName));
         _loc1_.push(FIGURE_DEFAULT.withValue(figure));
         _loc1_.push(MESSAGE_DEFAULT.withValue(message));
         return _loc1_;
      }
      
      public function set properties(param1:Array) : void
      {
         if(_disposed)
         {
            return;
         }
         for each(var _loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "illumina_chat_bubble:flipped":
                  flipped = Boolean(_loc2_.value);
                  break;
               case "illumina_chat_bubble:user_name":
                  userName = String(_loc2_.value);
                  break;
               case "illumina_chat_bubble:figure":
                  figure = String(_loc2_.value);
                  break;
               case "illumina_chat_bubble:message":
                  message = String(_loc2_.value);
                  break;
            }
         }
      }
      
      public function get flipped() : Boolean
      {
         return var_2785;
      }
      
      public function set flipped(param1:Boolean) : void
      {
         var_2785 = param1;
         refresh();
      }
      
      public function get userName() : String
      {
         return _userName.caption.slice(0,-1);
      }
      
      public function set userName(param1:String) : void
      {
         _userName.caption = param1 + ":";
      }
      
      public function get userId() : int
      {
         return _avatarWidget.userId;
      }
      
      public function set userId(param1:int) : void
      {
         _avatarWidget.userId = param1;
      }
      
      public function get figure() : String
      {
         return _avatarWidget.figure;
      }
      
      public function set figure(param1:String) : void
      {
         _avatarWidget.figure = param1;
      }
      
      public function get message() : String
      {
         return var_357.caption;
      }
      
      public function set message(param1:String) : void
      {
         var_357.caption = param1;
      }
      
      public function get timeStamp() : Number
      {
         return _postTime.timeStamp;
      }
      
      public function set timeStamp(param1:Number) : void
      {
         _postTime.timeStamp = param1;
      }
      
      public function set friendOnlineStatus(param1:Boolean) : void
      {
         _offline.height = !param1 ? 16 : 0;
      }
      
      public function refresh() : void
      {
         if(var_2711)
         {
            return;
         }
         var_2711 = true;
         var_464.limits.minWidth = var_464.width;
         var_464.limits.maxWidth = var_464.width;
         var_464.height = var_2733.bottom;
         var_2733.width = 0 - 0;
         var_357.width = var_2733.width;
         _avatarWidget.direction = var_2785 ? 4 : 2;
         if(var_2785)
         {
            var_2411.x = 0 - 0;
            _arrowPoint.zoomX = 1;
            _arrowPoint.x = var_2411.x;
            var_2733.x = 0;
         }
         else
         {
            var_2411.x = 0;
            _arrowPoint.zoomX = -1;
            _arrowPoint.x = 0 - 0;
            var_2733.x = var_2411.right;
         }
         var_464.limits.setEmpty();
         _arrowPoint.invalidate();
         var_2711 = false;
      }
      
      private function rootProcedure(param1:class_3134, param2:class_3127) : void
      {
         switch(param1.type)
         {
            case "WE_RESIZED":
               refresh();
               break;
            case "WE_CHILD_RESIZED":
               refresh();
               break;
            case "WME_CLICK":
               if(userId > 0 && param2.name == "user_name_region")
               {
                  _windowManager.communication.connection.send(new class_313(userId));
                  break;
               }
         }
      }
   }
}
