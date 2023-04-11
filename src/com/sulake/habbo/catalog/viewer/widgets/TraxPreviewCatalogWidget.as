package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.viewer.class_3169;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.class_2089;
   
   public class TraxPreviewCatalogWidget extends CatalogWidget implements class_3321
   {
       
      
      private var _soundManager:class_2089;
      
      private var _playButton:class_3140;
      
      private var var_2073:int = -1;
      
      public function TraxPreviewCatalogWidget(param1:class_3151, param2:class_2089)
      {
         super(param1);
         _playButton = _window.findChildByName("listen") as class_3140;
         class_14.log("Trax listener found button: " + _playButton);
         if(_playButton != null)
         {
            _playButton.addEventListener("WME_CLICK",onClickPlay);
            _playButton.disable();
         }
         _soundManager = param2;
      }
      
      override public function dispose() : void
      {
         if(_playButton != null)
         {
            _playButton.removeEventListener("WME_CLICK",onClickPlay);
         }
         if(_soundManager != null && false)
         {
            _soundManager.musicController.stop(3);
            _soundManager = null;
         }
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         if(page.offers.length == 0)
         {
            return false;
         }
         events.addEventListener("SELECT_PRODUCT",onSelectProduct);
         return true;
      }
      
      override public function closed() : void
      {
         super.closed();
         if(_soundManager != null && false)
         {
            _soundManager.musicController.stop(3);
         }
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null || param1.offer == null)
         {
            return;
         }
         var _loc3_:Boolean = false;
         var _loc2_:class_3169 = param1.offer.product;
         if(_loc2_.extraParam.length > 0)
         {
            var_2073 = parseInt(_loc2_.extraParam);
            _loc3_ = true;
         }
         if(_playButton != null)
         {
            if(_loc3_)
            {
               _playButton.enable();
            }
            else
            {
               _playButton.disable();
            }
         }
      }
      
      private function onClickPlay(param1:WindowMouseEvent) : void
      {
         if(_soundManager != null && false)
         {
            forceNoFadeoutOnPlayingSong(0);
            forceNoFadeoutOnPlayingSong(3);
            _soundManager.musicController.playSong(var_2073,3,15,40,0,2);
         }
      }
      
      private function forceNoFadeoutOnPlayingSong(param1:int) : void
      {
         var _loc2_:ISongInfo = null;
         var _loc3_:int = _soundManager.musicController.getSongIdPlayingAtPriority(param1);
         if(_loc3_ != -1)
         {
            _loc2_ = _soundManager.musicController.getSongInfo(_loc3_);
            if(_loc2_.soundObject != null)
            {
               _loc2_.soundObject.fadeOutSeconds = 0;
            }
         }
      }
   }
}
