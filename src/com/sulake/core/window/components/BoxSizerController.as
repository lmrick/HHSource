package com.sulake.core.window.components
{
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.geom.Rectangle;
   
   public class BoxSizerController extends ContainerController implements class_3399
   {
       
      
      private var var_1823:int = 5;
      
      private var var_2609:int = 8;
      
      private var var_2562:int = 8;
      
      private var var_2528:Boolean = false;
      
      private var var_3624:Boolean = true;
      
      public function BoxSizerController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:class_3127, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      override public function update(param1:WindowController, param2:class_3134) : Boolean
      {
         switch(param2.type)
         {
            case "WE_CHILD_RELOCATED":
            case "WE_CHILD_REMOVED":
            case "WE_CHILD_ADDED":
            case "WE_CHILD_RESIZED":
            case "WE_RESIZED":
            case "WE_CHILD_VISIBILITY":
               arrangeChildren();
         }
         return super.update(param1,param2);
      }
      
      private function arrangeChildren() : void
      {
         var _loc4_:* = null;
         if(!var_3624)
         {
            return;
         }
         var _loc1_:* = null;
         var _loc3_:int = calculateSpaceForRelatives();
         var _loc2_:int = getRelativeValuesSum();
         if(!var_2528)
         {
            for each(_loc4_ in _children)
            {
               if(_loc4_.visible)
               {
                  if(!_loc1_)
                  {
                     _loc4_.x = var_2609;
                  }
                  else
                  {
                     _loc4_.x = _loc1_.x + _loc1_.width + var_1823;
                  }
                  _loc4_.y = var_2562;
                  if(getRelativeValue(_loc4_) > 0)
                  {
                     _loc4_.width = _loc3_ * getRelativeValue(_loc4_) / _loc2_;
                  }
                  _loc1_ = _loc4_;
               }
            }
         }
         else
         {
            for each(_loc4_ in _children)
            {
               if(_loc4_.visible)
               {
                  if(!_loc1_)
                  {
                     _loc4_.y = var_2562;
                  }
                  else
                  {
                     _loc4_.y = _loc1_.y + _loc1_.height + var_1823;
                  }
                  _loc4_.x = var_2609;
                  if(getRelativeValue(_loc4_) > 0)
                  {
                     _loc4_.height = _loc3_ * getRelativeValue(_loc4_) / _loc2_;
                  }
                  _loc1_ = _loc4_;
               }
            }
         }
      }
      
      private function getRelativeValue(param1:class_3127) : int
      {
         var _loc3_:String = null;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.tags.length)
         {
            _loc3_ = String(param1.tags[_loc2_]);
            if(_loc3_.indexOf("relative") != -1)
            {
               if((_loc4_ = int(_loc3_.slice(_loc3_.indexOf("(") + 1,_loc3_.indexOf(")")))) < 0)
               {
                  _loc4_ = 0;
               }
               param1.tags.splice(_loc2_,1,"relative(" + _loc4_ + ")");
            }
            _loc2_++;
         }
         return _loc4_;
      }
      
      private function getRelativeValuesSum() : int
      {
         var _loc1_:int = 0;
         for each(var _loc2_ in _children)
         {
            if(_loc2_.visible)
            {
               _loc1_ += getRelativeValue(_loc2_);
            }
         }
         return _loc1_;
      }
      
      private function calculateSpaceForRelatives() : int
      {
         var _loc1_:int = var_2528 ? this.height - var_2562 * 2 : this.width - var_2609 * 2;
         for each(var _loc2_ in _children)
         {
            if(_loc2_.visible != false)
            {
               if(getRelativeValue(_loc2_) == 0)
               {
                  if(var_2528)
                  {
                     _loc1_ -= _loc2_.height + var_1823;
                  }
                  else
                  {
                     _loc1_ -= _loc2_.width + var_1823;
                  }
               }
               else
               {
                  _loc1_ -= var_1823;
               }
            }
         }
         return _loc1_ + var_1823;
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         _loc1_.push(createProperty("spacing",var_1823));
         _loc1_.push(createProperty("vertical",var_2528));
         _loc1_.push(createProperty("padding_horizontal",var_2609));
         _loc1_.push(createProperty("padding_vertical",var_2562));
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         for each(var _loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "spacing":
                  var_1823 = _loc2_.value as int;
                  break;
               case "padding_horizontal":
                  var_2609 = _loc2_.value as int;
                  break;
               case "padding_vertical":
                  var_2562 = _loc2_.value as int;
                  break;
               case "vertical":
                  var_2528 = _loc2_.value as Boolean;
                  break;
            }
         }
         super.properties = param1;
         arrangeChildren();
      }
      
      public function setHorizontalPadding(param1:int) : void
      {
         var_2609 = param1;
         arrangeChildren();
      }
      
      public function setVerticalPadding(param1:int) : void
      {
         var_2562 = param1;
         arrangeChildren();
      }
      
      public function setSpacing(param1:int) : void
      {
         var_1823 = param1;
         arrangeChildren();
      }
      
      public function setVertical(param1:Boolean) : void
      {
         var_2528 = param1;
         arrangeChildren();
      }
      
      public function setAutoRearrange(param1:Boolean) : void
      {
         var_3624 = param1;
         if(param1)
         {
            arrangeChildren();
         }
      }
      
      public function getAutoRearrange() : Boolean
      {
         return var_3624;
      }
   }
}
