package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ILabelWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   
   public class IlluminaInputWidget implements IIlluminaInputWidget
   {
      
      public static const TYPE:String = "illumina_input";
      
      private static const const_632:String = "illumina_input:button_caption";
      
      private static const const_1094:String = "illumina_input:empty_message";
      
      private static const MULTILINE_KEY:String = "illumina_input:multiline";
      
      private static const MAX_CHARS_KEY:String = "illumina_input:max_chars";
      
      private static const BUTTON_CAPTION_DEFAULT:PropertyStruct = new PropertyStruct("illumina_input:button_caption","${widgets.chatinput.say}","String");
      
      private static const EMPTY_MESSAGE_DEFAULT:PropertyStruct = new PropertyStruct("illumina_input:empty_message","","String");
      
      private static const MULTILINE_DEFAULT:PropertyStruct = new PropertyStruct("illumina_input:multiline",false,"Boolean");
      
      private static const MAX_CHARS_DEFAULT:PropertyStruct = new PropertyStruct("illumina_input:max_chars",0,"int");
      
      private static const SINGLE_LINE_HEIGHT:int = 28;
       
      
      private var _disposed:Boolean;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      private var _submitButton:class_3140;
      
      private var var_1437:ITextFieldWindow;
      
      private var _emptyMessageLabel:ILabelWindow;
      
      private var var_3401:com.sulake.habbo.window.widgets.IIlluminaInputHandler;
      
      public function IlluminaInputWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("illumina_input_xml").content as XML) as class_3151;
         var_464.width = var_1547.width;
         _submitButton = var_464.findChildByName("submit") as class_3140;
         var_1437 = var_464.findChildByName("input") as ITextFieldWindow;
         _emptyMessageLabel = var_464.findChildByName("empty_message") as ILabelWindow;
         buttonCaption = "null";
         emptyMessage = "null";
         multiline = false;
         maxChars = 0;
         refresh();
         var_464.procedure = widgetProcedure;
         var_1547.rootWindow = var_464;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_1437 != null)
            {
               var_1437 = null;
            }
            _submitButton = null;
            _emptyMessageLabel = null;
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
         _loc1_.push(BUTTON_CAPTION_DEFAULT.withValue(buttonCaption));
         _loc1_.push(EMPTY_MESSAGE_DEFAULT.withValue(emptyMessage));
         _loc1_.push(MULTILINE_DEFAULT.withValue(multiline));
         _loc1_.push(MAX_CHARS_DEFAULT.withValue(maxChars));
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
               case "illumina_input:button_caption":
                  buttonCaption = String(_loc2_.value);
                  break;
               case "illumina_input:empty_message":
                  emptyMessage = String(_loc2_.value);
                  break;
               case "illumina_input:multiline":
                  multiline = Boolean(_loc2_.value);
                  break;
               case "illumina_input:max_chars":
                  maxChars = int(_loc2_.value);
                  break;
            }
         }
      }
      
      public function get buttonCaption() : String
      {
         return _submitButton.caption;
      }
      
      public function set buttonCaption(param1:String) : void
      {
         _submitButton.caption = param1;
         _submitButton.visible = param1 != null && param1.length > 0;
         refresh();
      }
      
      public function get emptyMessage() : String
      {
         return _emptyMessageLabel.caption;
      }
      
      public function set emptyMessage(param1:String) : void
      {
         _emptyMessageLabel.caption = param1;
      }
      
      public function get multiline() : Boolean
      {
         return var_1437.multiline;
      }
      
      public function set multiline(param1:Boolean) : void
      {
         var_1437.multiline = param1;
         var_464.setParamFlag(2048,param1);
         var_464.height = param1 ? var_1547.height : 28;
      }
      
      public function get maxChars() : int
      {
         return var_1437.maxChars;
      }
      
      public function set maxChars(param1:int) : void
      {
         var_1437.maxChars = param1;
      }
      
      public function get message() : String
      {
         return var_1437.caption;
      }
      
      public function set message(param1:String) : void
      {
         var_1437.caption = param1;
         refresh();
      }
      
      public function get submitHandler() : com.sulake.habbo.window.widgets.IIlluminaInputHandler
      {
         return var_3401;
      }
      
      public function set submitHandler(param1:com.sulake.habbo.window.widgets.IIlluminaInputHandler) : void
      {
         var_3401 = param1;
      }
      
      private function widgetProcedure(param1:class_3134, param2:class_3127) : void
      {
         switch(param1.type)
         {
            case "WE_CHANGE":
               if(param2 == var_1437)
               {
                  refresh();
                  break;
               }
               break;
            case "WKE_KEY_DOWN":
               if(param2 == var_1437 && WindowKeyboardEvent(param1).charCode == 13 && false)
               {
                  submitMessage();
                  break;
               }
               break;
            case "WME_CLICK":
               if(param2 == _submitButton)
               {
                  submitMessage();
                  break;
               }
         }
      }
      
      private function submitMessage() : void
      {
         if(var_3401 != null)
         {
            var_3401.onInput(var_1547,message);
         }
      }
      
      private function refresh() : void
      {
         _emptyMessageLabel.visible = false;
         var_1437.width = (!!_submitButton.visible ? _submitButton.x : int(var_464.width)) - 0;
      }
   }
}
