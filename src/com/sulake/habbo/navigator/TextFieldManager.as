package com.sulake.habbo.navigator
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.class_3134;
   import flash.geom.Point;
   
   public class TextFieldManager
   {
       
      
      private var _navigator:com.sulake.habbo.navigator.class_1686;
      
      private var var_1519:ITextFieldWindow;
      
      private var _includeInfo:Boolean;
      
      private var var_3469:String = "";
      
      private var _maxTextLen:int;
      
      private var _onEnter:Function;
      
      private var var_4297:String = "";
      
      private var _errorPopup:class_3151;
      
      private var var_4285:Boolean;
      
      private var _orgTextBackgroundColor:uint;
      
      public function TextFieldManager(param1:com.sulake.habbo.navigator.class_1686, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         _navigator = param1;
         var_1519 = param2;
         _maxTextLen = param3;
         param2.maxChars = param3;
         _onEnter = param4;
         if(param5 != null)
         {
            _includeInfo = true;
            var_3469 = param5;
            var_1519.text = param5;
         }
         Util.setProcDirectly(var_1519,onInputClick);
         var_1519.addEventListener("WKE_KEY_DOWN",checkEnterPress);
         var_1519.addEventListener("WE_CHANGE",checkMaxLen);
         this.var_4285 = var_1519.textBackground;
         this._orgTextBackgroundColor = var_1519.textBackgroundColor;
      }
      
      public function dispose() : void
      {
         if(var_1519)
         {
            var_1519.dispose();
            var_1519 = null;
         }
         if(_errorPopup)
         {
            _errorPopup.dispose();
            _errorPopup = null;
         }
         _navigator = null;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!isInputValid())
         {
            displayError(param1);
            return false;
         }
         restoreBackground();
         return true;
      }
      
      public function restoreBackground() : void
      {
         var_1519.textBackground = this.var_4285;
         var_1519.textBackgroundColor = this._orgTextBackgroundColor;
      }
      
      public function displayError(param1:String) : void
      {
         var_1519.textBackground = true;
         var_1519.textBackgroundColor = 4294021019;
         if(this._errorPopup == null)
         {
            this._errorPopup = class_3151(_navigator.getXmlWindow("nav_error_popup"));
            _navigator.refreshButton(this._errorPopup,"popup_arrow_down",true,null,0);
            class_3151(var_1519.parent).addChild(this._errorPopup);
         }
         var _loc4_:ITextWindow;
         (_loc4_ = ITextWindow(this._errorPopup.findChildByName("error_text"))).text = param1;
         _loc4_.width = _loc4_.textWidth + 5;
         _errorPopup.findChildByName("border").width = _loc4_.width + 15;
         _errorPopup.width = _loc4_.width + 15;
         var _loc2_:Point = new Point();
         var_1519.getLocalPosition(_loc2_);
         this._errorPopup.x = _loc2_.x;
         this._errorPopup.y = _loc2_.y - this._errorPopup.height + 3;
         var _loc3_:class_3127 = _errorPopup.findChildByName("popup_arrow_down");
         _loc3_.x = this._errorPopup.width / 2 - _loc3_.width / 2;
         _errorPopup.x += (0 - 0) / 2;
         this._errorPopup.visible = true;
      }
      
      public function goBackToInitialState() : void
      {
         clearErrors();
         if(var_3469 != null)
         {
            var_1519.text = var_3469;
            _includeInfo = true;
         }
         else
         {
            var_1519.text = "";
            _includeInfo = false;
         }
      }
      
      public function getText() : String
      {
         if(_includeInfo)
         {
            return var_4297;
         }
         return var_1519.text;
      }
      
      public function setText(param1:String) : void
      {
         _includeInfo = false;
         var_1519.text = param1;
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this._errorPopup != null)
         {
            _errorPopup.visible = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return var_1519;
      }
      
      private function isInputValid() : Boolean
      {
         return !_includeInfo && Util.trim(getText()).length > 2;
      }
      
      private function onInputClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WE_FOCUSED")
         {
            return;
         }
         if(!_includeInfo)
         {
            return;
         }
         var_1519.text = var_4297;
         _includeInfo = false;
         this.restoreBackground();
      }
      
      private function checkEnterPress(param1:WindowKeyboardEvent) : void
      {
         if(param1.charCode == 13)
         {
            if(_onEnter != null)
            {
               _onEnter();
            }
         }
      }
      
      private function checkMaxLen(param1:class_3134) : void
      {
         var _loc2_:String = "null";
         if(_loc2_.length > _maxTextLen)
         {
            var_1519.text = _loc2_.substring(0,_maxTextLen);
         }
      }
   }
}
