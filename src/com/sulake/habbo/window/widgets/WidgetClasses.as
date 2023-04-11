package com.sulake.habbo.window.widgets
{
   import flash.utils.Dictionary;
   
   public class WidgetClasses
   {
      
      public static var var_1521:Dictionary = new Dictionary();
      
      public static var WIDGET_TYPES:Array = [];
      
      private static var key:String;
      
      {
         var_1521["avatar_image"] = AvatarImageWidget;
         var_1521["badge_image"] = BadgeImageWidget;
         var_1521["balloon"] = BalloonWidget;
         var_1521["countdown"] = CountdownWidget;
         var_1521["hover_bitmap"] = HoverBitmapWidget;
         var_1521["illumina_border"] = IlluminaBorderWidget;
         var_1521["illumina_chat_bubble"] = IlluminaChatBubbleWidget;
         var_1521["illumina_input"] = IlluminaInputWidget;
         var_1521["progress_indicator"] = ProgressIndicatorWidget;
         var_1521["limited_item_overlay_grid"] = LimitedItemGridOverlayWidget;
         var_1521["limited_item_overlay_preview"] = LimitedItemPreviewOverlayWidget;
         var_1521["limited_item_overlay_supply"] = LimitedItemSupplyLeftOverlayWidget;
         var_1521["rarity_item_overlay_grid"] = RarityItemGridOverlayWidget;
         var_1521["rarity_item_overlay_preview"] = RarityItemPreviewOverlayWidget;
         var_1521["separator"] = SeparatorWidget;
         var_1521["updating_timestamp"] = UpdatingTimeStampWidget;
         var_1521["running_number"] = RunningNumberWidget;
         var_1521["pet_image"] = PetImageWidget;
         var_1521["furniture_image"] = FurnitureImageWidget;
         var_1521["room_previewer"] = RoomPreviewerWidget;
         var_1521["pixel_limit"] = PixelLimitWidget;
         var_1521["room_thumbnail"] = RoomThumbnailWidget;
         var_1521["room_user_count"] = RoomUserCountWidget;
         for(key in var_1521)
         {
            WIDGET_TYPES.push(key);
         }
         WIDGET_TYPES.sort();
      }
      
      public function WidgetClasses()
      {
         super();
      }
   }
}
