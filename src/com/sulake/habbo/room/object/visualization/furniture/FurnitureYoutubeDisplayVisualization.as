package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.core.utils.class_24;
   import com.sulake.room.object.IRoomObjectModel;
   
   public class FurnitureYoutubeDisplayVisualization extends ExternalIsometricImageFurniVisualization
   {
      
      protected static const THUMBNAIL_URL_KEY:String = "THUMBNAIL_URL";
       
      
      public function FurnitureYoutubeDisplayVisualization()
      {
         super();
      }
      
      override protected function getThumbnailURL() : String
      {
         var _loc3_:IRoomObjectModel = object.getModel();
         var _loc2_:class_24 = _loc3_.getStringToStringMap("furniture_data");
         var _loc1_:String = String(_loc3_.getString("session_url_prefix"));
         if(_loc1_ == null)
         {
            return null;
         }
         return _loc1_ + _loc2_.getValue("THUMBNAIL_URL");
      }
   }
}
