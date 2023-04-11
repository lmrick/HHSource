package com.sulake.habbo.window.widgets
{
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   
   public class RunningNumberWidget implements IRunningNumberWidget, class_41
   {
      
      public static const TYPE:String = "running_number";
      
      private static const NUMBER_KEY:String = "running_number:number";
      
      private static const const_809:String = "running_number:digits";
      
      private static const COLOR_STYLE_KEY:String = "running_number:color_style";
      
      private static const const_925:String = "running_number:update_frequency";
      
      private static const NUMBER_DEFAULT:PropertyStruct = new PropertyStruct("running_number:number",0,"int");
      
      private static const DIGITS_DEFAULT:PropertyStruct = new PropertyStruct("running_number:digits",8,"uint");
      
      private static const COLOR_STYLE_DEFAULT:PropertyStruct = new PropertyStruct("running_number:color_style",0,"int");
      
      private static const UPDATE_FREQUENCY_DEFAULT:PropertyStruct = new PropertyStruct("running_number:update_frequency",50,"int");
       
      
      private var _disposed:Boolean;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      private var var_3239:int;
      
      private var var_3111:uint;
      
      private var var_2415:int;
      
      private var _newNumber:int;
      
      private var _displayedNumber:Number = 0;
      
      private var _millisSinceLastUpdate:uint = 0;
      
      public function RunningNumberWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         var_3239 = 0;
         var_3111 = 0;
         var_2415 = 0;
         _newNumber = 0;
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("running_number_xml").content as XML) as class_3151;
         _windowManager.registerUpdateReceiver(this,var_2415);
         var_1547.setParamFlag(147456);
         var_1547.rootWindow = var_464;
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
            _windowManager.removeUpdateReceiver(this);
            _windowManager = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get properties() : Array
      {
         var _loc1_:* = [];
         if(_disposed)
         {
            return _loc1_;
         }
         _loc1_.push(NUMBER_DEFAULT.withValue(colorStyle));
         _loc1_.push(COLOR_STYLE_DEFAULT.withValue(colorStyle));
         _loc1_.push(DIGITS_DEFAULT.withValue(digits));
         _loc1_.push(UPDATE_FREQUENCY_DEFAULT.withValue(updateFrequency));
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
               case "running_number:number":
                  number = int(_loc2_.value);
                  break;
               case "running_number:digits":
                  digits = uint(_loc2_.value);
                  break;
               case "running_number:color_style":
                  colorStyle = int(_loc2_.value);
                  break;
               case "running_number:update_frequency":
                  updateFrequency = int(_loc2_.value);
                  break;
            }
         }
      }
      
      public function get iterator() : IIterator
      {
         return EmptyIterator.INSTANCE;
      }
      
      public function update(param1:uint) : void
      {
         if(_displayedNumber < number)
         {
            _millisSinceLastUpdate += param1;
            if(_millisSinceLastUpdate > var_2415)
            {
               _displayedNumber = Math.min(_newNumber,_displayedNumber + _millisSinceLastUpdate / var_2415);
               _millisSinceLastUpdate -= var_2415;
            }
            fieldValue = _displayedNumber;
         }
      }
      
      private function set fieldValue(param1:uint) : void
      {
         var _loc3_:String = param1.toString();
         while(_loc3_.length < var_3111)
         {
            _loc3_ = "0" + _loc3_;
         }
         var _loc2_:ITextWindow = ITextWindow(var_464.findChildByName("number_field"));
         _loc2_.text = _loc3_;
         _loc2_.invalidate();
      }
      
      public function get digits() : uint
      {
         return var_3111;
      }
      
      public function set digits(param1:uint) : void
      {
         var_3111 = param1;
      }
      
      public function get colorStyle() : int
      {
         return var_3239;
      }
      
      public function set colorStyle(param1:int) : void
      {
         var_3239 = param1;
      }
      
      public function get updateFrequency() : int
      {
         return var_2415;
      }
      
      public function set updateFrequency(param1:int) : void
      {
         var_2415 = param1;
      }
      
      public function get number() : int
      {
         return _newNumber;
      }
      
      public function set number(param1:int) : void
      {
         _newNumber = param1;
      }
      
      public function set initialNumber(param1:int) : void
      {
         _displayedNumber = param1;
         _newNumber = param1;
         fieldValue = _displayedNumber;
      }
   }
}
