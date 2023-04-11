package com.sulake.habbo.room.object.visualization.furniture
{
   import adobe.serialization.json.JSONDecoder;
   import com.sulake.habbo.room.object.visualization.data.ExtraDataManager;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class FurnitureExternalImageVisualization extends ExternalIsometricImageFurniVisualization
   {
       
      
      private var var_4109:Boolean;
      
      private var var_138:String;
      
      private var var_3581:String;
      
      private var var_90:String;
      
      private var var_3257:Boolean = false;
      
      private var var_2832:String = "";
      
      private var var_4023:String;
      
      public function FurnitureExternalImageVisualization()
      {
         super();
         hasOutline = true;
      }
      
      override public function setExternalBaseUrls(param1:String, param2:String, param3:Boolean) : void
      {
         var_138 = param1;
         var_3581 = param2;
         var_4109 = param3;
      }
      
      override protected function getThumbnailURL() : String
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         if(!object || var_138 == "disabled" || var_90 == "REJECTED")
         {
            return null;
         }
         if(var_90)
         {
            return var_90;
         }
         var _loc1_:String = String(object.getModel().getString("furniture_data"));
         if(_loc1_ == null)
         {
            return null;
         }
         try
         {
            if(object.getType().indexOf("external_image_wallitem_poster") != -1)
            {
               var_2832 = "";
            }
            else
            {
               var_2832 = "postcards/selfie/";
            }
            _loc2_ = getJsonValue(_loc1_,"id",null);
            if(_loc2_ && _loc2_.length > 0)
            {
               if(!var_3257)
               {
                  var_4023 = _loc2_;
                  var_3257 = true;
                  if(var_4109)
                  {
                     ExtraDataManager.requestExtraDataUrl(this);
                  }
                  else
                  {
                     loadExtraData(_loc2_);
                  }
               }
               return null;
            }
            _loc3_ = getJsonValue(_loc1_,"w","url");
            _loc3_ = buildThumbnailUrl(_loc3_,var_2832);
         }
         catch(error:Error)
         {
            return null;
         }
         var_90 = _loc3_;
         return _loc3_;
      }
      
      public function getExternalImageUUID() : String
      {
         return var_4023;
      }
      
      private function buildThumbnailUrl(param1:String, param2:String) : String
      {
         if(param1 == "REJECTED")
         {
            return param1;
         }
         if(param1.indexOf("http") != 0)
         {
            param1 = var_138 + param2 + param1;
         }
         param1 = param1.replace(".png","_small.png");
         if(param1.indexOf(".png") == -1)
         {
            param1 += "_small.png";
         }
         return param1;
      }
      
      private function getJsonValue(param1:String, param2:String, param3:String) : String
      {
         var _loc4_:String;
         var _loc5_:Object;
         if((_loc4_ = String((_loc5_ = new JSONDecoder(param1,false).getValue())[param2])) == null && param3 != null)
         {
            _loc4_ = String(_loc5_[param3]);
         }
         return _loc4_;
      }
      
      private function loadExtraData(param1:String) : void
      {
         var _loc3_:String = var_3581 + param1;
         var _loc2_:URLLoader = new URLLoader(new URLRequest(_loc3_));
         _loc2_.addEventListener("complete",onExtraDataLoaded);
         _loc2_.addEventListener("ioError",onExtraDataError);
         var_3257 = true;
      }
      
      private function onExtraDataError(param1:Event) : void
      {
         class_14.log("Extra data failed to load " + param1.toString());
      }
      
      private function onExtraDataLoaded(param1:Event) : void
      {
         var _loc2_:String = String(URLLoader(param1.target).data);
         if(_loc2_.length == 0)
         {
            return;
         }
         var _loc3_:String = getJsonValue(_loc2_,"w","url");
         var_90 = buildThumbnailUrl(_loc3_,var_2832);
      }
      
      public function onUrlFromExtraDataService(param1:String) : void
      {
         var_90 = buildThumbnailUrl(param1,var_2832);
      }
      
      public function getExtraDataUrl() : String
      {
         return var_3581;
      }
      
      override public function dispose() : void
      {
         ExtraDataManager.furnitureDisposed(this);
         super.dispose();
      }
      
      override public function getImage(param1:int, param2:int) : BitmapData
      {
         if(!assetCollection)
         {
            return new BitmapData(1,1,true,0);
         }
         var _loc3_:String = getFullThumbnailAssetName(param2,32);
         if(assetCollection.getAsset(_loc3_) == null && object)
         {
            _loc3_ = object.getType() + "_icon_a";
         }
         if(assetCollection.getAsset(_loc3_) == null)
         {
            return new BitmapData(1,1,true,0);
         }
         var _loc4_:Object;
         if(!(_loc4_ = assetCollection.getAsset(_loc3_).asset.content))
         {
            return new BitmapData(1,1,true,0);
         }
         return (_loc4_ as BitmapData).clone();
      }
      
      override protected function getLibraryAssetNameForSprite(param1:IGraphicAsset, param2:IRoomObjectSprite) : String
      {
         return var_90;
      }
   }
}
