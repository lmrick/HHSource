package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   public class FurnisHaveNoAvatars extends FurnisHaveAvatars
   {
       
      
      public function FurnisHaveNoAvatars()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.NOT_FURNIS_HAVE_AVATARS;
      }
   }
}
