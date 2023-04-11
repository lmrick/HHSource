package com.sulake.core.window.components
{
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.iterators.ContainerIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.IMargins;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.TextMargins;
   import flash.geom.Rectangle;
   
   public class FrameController extends ContainerController implements class_3281
   {
      
      private static const TAG_TITLE_ELEMENT:String = "_TITLE";
      
      private static const TAG_HEADER_ELEMENT:String = "_HEADER";
      
      private static const TAG_CONTENT_ELEMENT:String = "_CONTENT";
      
      private static const TAG_SCALER_ELEMENT:String = "_SCALER";
       
      
      private var var_462:com.sulake.core.window.components.ILabelWindow;
      
      private var _header:com.sulake.core.window.components.class_3269;
      
      private var _content:class_3151;
      
      private var var_1475:IMargins;
      
      private var var_174:Boolean = false;
      
      private var var_2279:String = "";
      
      private var _helpButtonAction:Function = null;
      
      public function FrameController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:class_3127, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         param4 = uint((param4 |= 1) & -17);
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_174 = true;
         activate();
         setupScaling();
         var _loc12_:class_3127;
         if((_loc12_ = findChildByName("header_button_help")) != null)
         {
            _loc12_.procedure = helpButtonProcedure;
         }
         helpPage = var_2279;
      }
      
      public function get title() : com.sulake.core.window.components.ILabelWindow
      {
         return !!var_462 ? var_462 : (var_462 = com.sulake.core.window.components.ILabelWindow(findChildByTag("_TITLE")));
      }
      
      public function get header() : com.sulake.core.window.components.class_3269
      {
         return !!_header ? _header : (_header = com.sulake.core.window.components.class_3269(findChildByTag("_HEADER")));
      }
      
      public function get content() : class_3151
      {
         return !!_content ? _content : (_content = class_3151(findChildByTag("_CONTENT")));
      }
      
      public function get scaler() : IScalerWindow
      {
         return findChildByTag("_SCALER") as IScalerWindow;
      }
      
      public function get margins() : IMargins
      {
         if(!var_1475)
         {
            var_1475 = new TextMargins(content.left,content.top,content.right,content.bottom,marginsCallback);
         }
         return var_1475;
      }
      
      override public function set caption(param1:String) : void
      {
         super.caption = param1;
         try
         {
            title.text = param1;
         }
         catch(e:Error)
         {
         }
      }
      
      override public function set color(param1:uint) : void
      {
         super.color = param1;
         var _loc2_:* = [];
         groupChildrenWithTag("_COLORIZE",_loc2_);
         for each(var _loc3_ in _loc2_)
         {
            _loc3_.color = param1;
         }
      }
      
      override public function get iterator() : IIterator
      {
         return content != null && var_174 ? content.iterator : new ContainerIterator(this);
      }
      
      private function helpButtonProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK" && var_2279 != "" && _helpButtonAction != null)
         {
            _helpButtonAction(var_2279);
         }
      }
      
      public function set helpButtonAction(param1:Function) : void
      {
         _helpButtonAction = param1;
      }
      
      override public function buildFromXML(param1:XML, param2:class_24 = null) : Boolean
      {
         return context.getWindowParser().parseAndConstruct(param1,content,param2) != null;
      }
      
      override public function setParamFlag(param1:uint, param2:Boolean = true) : void
      {
         super.setParamFlag(param1,param2);
         setupScaling();
      }
      
      private function setupScaling() : void
      {
         var _loc1_:class_3127 = scaler;
         var _loc2_:Boolean = testParamFlag(65536);
         var _loc3_:Boolean = testParamFlag(8192);
         var _loc4_:Boolean = testParamFlag(4096);
         if(_loc1_)
         {
            if(_loc3_ || _loc2_)
            {
               _loc1_.setParamFlag(8192,true);
            }
            else
            {
               _loc1_.setParamFlag(8192,false);
            }
            if(_loc4_ || _loc2_)
            {
               _loc1_.setParamFlag(4096,true);
            }
            else
            {
               _loc1_.setParamFlag(4096,false);
            }
            _loc1_.visible = _loc3_ || _loc4_ || _loc2_;
         }
      }
      
      public function resizeToFitContent() : void
      {
         resizeToAccommodateChildren(content as WindowController);
      }
      
      private function marginsCallback(param1:IMargins) : void
      {
         var _loc2_:class_3127 = content;
         var _loc4_:uint = _loc2_.param;
         var _loc5_:uint;
         if(_loc5_ = uint(_loc2_.param & 3264))
         {
            _loc2_.setParamFlag(3264,false);
         }
         var _loc3_:uint = uint(_loc2_.param & 12582912);
         if(_loc3_)
         {
            _loc2_.setParamFlag(12582912,false);
         }
         _loc2_.rectangle = new Rectangle(param1.left,param1.top,param1.right - param1.left,param1.bottom - param1.top);
         if(_loc5_ || _loc3_)
         {
            _loc2_.setParamFlag(4294967295,false);
            _loc2_.setParamFlag(_loc4_,true);
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         var _loc2_:* = var_1475 != null;
         _loc1_.push(new PropertyStruct("help_page",var_2279,"String",var_2279 != ""));
         _loc1_.push(new PropertyStruct("margin_left",content.left,"int",_loc2_));
         _loc1_.push(new PropertyStruct("margin_top",content.top,"int",_loc2_));
         _loc1_.push(new PropertyStruct("margin_right",var_1436 - 0,"int",_loc2_));
         _loc1_.push(new PropertyStruct("margin_bottom",var_1441 - 0,"int",_loc2_));
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         for each(var _loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "help_page":
                  helpPage = _loc2_.value as String;
                  break;
               case "margin_left":
                  margins.left = _loc2_.value as int;
                  break;
               case "margin_top":
                  margins.top = _loc2_.value as int;
                  break;
               case "margin_right":
                  margins.right = var_1436 - (_loc2_.value as int);
                  break;
               case "margin_bottom":
                  margins.bottom = var_1441 - (_loc2_.value as int);
                  break;
            }
         }
         super.properties = param1;
      }
      
      public function get helpPage() : String
      {
         return var_2279;
      }
      
      public function set helpPage(param1:String) : void
      {
         var_2279 = param1;
         var _loc2_:class_3127 = findChildByName("header_button_help");
         if(_loc2_ != null)
         {
            _loc2_.visible = var_2279 != "";
         }
      }
   }
}
