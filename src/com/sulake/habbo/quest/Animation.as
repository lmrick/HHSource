package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.components.class_3282;
   import flash.display.BitmapData;
   
   public class Animation implements class_13
   {
       
      
      private var var_1492:class_3282;
      
      private var var_2478:int;
      
      private var var_2601:Boolean;
      
      private var var_1551:Array;
      
      public function Animation(param1:class_3282)
      {
         var_1551 = [];
         super();
         var_1492 = param1;
         var_1492.visible = false;
         if(param1.bitmap == null)
         {
            param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         }
      }
      
      public function dispose() : void
      {
         var_1492 = null;
         if(var_1551)
         {
            for each(var _loc1_ in var_1551)
            {
               _loc1_.dispose();
            }
            var_1551 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_1492 == null;
      }
      
      public function addObject(param1:AnimationObject) : void
      {
         var_1551.push(param1);
      }
      
      public function stop() : void
      {
         var_2601 = false;
         var_1492.visible = false;
      }
      
      public function restart() : void
      {
         var_2478 = 0;
         var_2601 = true;
         for each(var _loc1_ in var_1551)
         {
            _loc1_.onAnimationStart();
         }
         draw();
         var_1492.visible = true;
      }
      
      public function update(param1:uint) : void
      {
         if(var_2601)
         {
            var_2478 += param1;
            draw();
         }
      }
      
      private function draw() : void
      {
         var _loc1_:Boolean = false;
         var _loc3_:BitmapData = null;
         var_1492.bitmap.fillRect(var_1492.bitmap.rect,0);
         if(var_2601)
         {
            _loc1_ = false;
            for each(var _loc2_ in var_1551)
            {
               if(!_loc2_.isFinished(var_2478))
               {
                  _loc1_ = true;
                  _loc3_ = _loc2_.getBitmap(var_2478);
                  if(_loc3_ != null)
                  {
                     var_1492.bitmap.copyPixels(_loc3_,_loc3_.rect,_loc2_.getPosition(var_2478));
                  }
               }
            }
         }
         var_1492.invalidate();
         var_2601 = _loc1_;
      }
   }
}
