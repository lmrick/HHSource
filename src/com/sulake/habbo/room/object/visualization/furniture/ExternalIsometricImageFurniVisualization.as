package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.core.runtime.exceptions.Exception;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class ExternalIsometricImageFurniVisualization extends IsometricImageFurniVisualization
   {
       
      
      private var var_254:String = null;
      
      public function ExternalIsometricImageFurniVisualization()
      {
         super();
      }
      
      private static function onThumbnailError(param1:ErrorEvent) : void
      {
         class_14.log("External Image thumbnail download error: " + param1.toString());
      }
      
      override protected function updateModel(param1:Number) : Boolean
      {
         var _loc4_:String = null;
         var _loc2_:Loader = null;
         var _loc3_:LoaderContext = null;
         if(object != null)
         {
            _loc4_ = getThumbnailURL();
            if(var_254 != _loc4_)
            {
               var_254 = _loc4_;
               if(var_254 != null && var_254 != "")
               {
                  _loc2_ = new Loader();
                  _loc2_.name = _loc4_;
                  _loc2_.contentLoaderInfo.addEventListener("complete",onThumbnailLoaded);
                  _loc2_.contentLoaderInfo.addEventListener("ioError",onThumbnailError);
                  _loc2_.contentLoaderInfo.addEventListener("securityError",onThumbnailError);
                  _loc3_ = new LoaderContext(true);
                  _loc3_.checkPolicyFile = true;
                  _loc2_.load(new URLRequest(_loc4_),_loc3_);
               }
               else
               {
                  setThumbnailImages(null);
               }
            }
         }
         return super.updateModel(param1);
      }
      
      protected function getThumbnailURL() : String
      {
         throw new Exception("This method must be overridden!");
      }
      
      private function onThumbnailLoaded(param1:Event) : void
      {
         var _loc3_:LoaderInfo = param1.target as LoaderInfo;
         var _loc2_:Bitmap = _loc3_.content as Bitmap;
         if(_loc2_ != null)
         {
            setThumbnailImages(_loc2_.bitmapData);
         }
         else
         {
            setThumbnailImages(null);
         }
      }
   }
}
