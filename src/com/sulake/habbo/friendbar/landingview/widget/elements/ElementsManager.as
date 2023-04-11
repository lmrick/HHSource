package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
   
   public class ElementsManager
   {
      
      public static const CAPTION:String = "caption";
      
      public static const TITLE:String = "title";
      
      public static const const_653:String = "subcaption";
      
      public static const BODYTEXT:String = "bodytext";
      
      public static const SPACING:String = "spacing";
      
      public static const CATALOGBUTTON:String = "catalogbutton";
      
      public static const PROMOTEDROOMBUTTON:String = "promotedroombutton";
      
      public static const LINK:String = "link";
      
      public static const const_992:String = "gotoroombutton";
      
      public static const REQUESTBADGEBUTTON:String = "requestbadgebutton";
      
      public static const REQUESTBADGEBUTTONSECOND:String = "requestbadgebuttonsecond";
      
      public static const REQUESTBADGEBUTTONTHIRD:String = "requestbadgebuttonthird";
      
      public static const REQUESTBADGEBUTTONFOURTH:String = "requestbadgebuttonfourth";
      
      public static const REQUESTBADGEBUTTONFIFTH:String = "requestbadgebuttonfifth";
      
      public static const CREDITHABBLETBUTTON:String = "credithabbletbutton";
      
      public static const COMMUNITYGOALTIMER:String = "communitygoaltimer";
      
      public static const CUSTOMTIMER:String = "customtimer";
      
      public static const const_851:String = "gotohomeroombutton";
      
      public static const const_535:String = "gotocompetitionroombutton";
      
      public static const REWARDBADGE:String = "rewardbadge";
      
      public static const IMAGE:String = "image";
      
      public static const SUBMITCOMPETITIONROOM:String = "submitcompetitionroom";
      
      public static const CONCURRENTUSERSMETER:String = "concurrentusersmeter";
      
      public static const CONCURRENTUSERSINFO:String = "concurrentusersinfo";
      
      public static const DAILYQUEST:String = "dailyquest";
      
      public static const const_1014:String = "buyvipbutton";
      
      public static const COMMUNITYGOALSCORE:String = "communitygoalscore";
      
      public static const INTERNAL_LINK_BUTTON:String = "internallinkbutton";
       
      
      public function ElementsManager()
      {
         super();
      }
      
      public static function createHandler(param1:String) : IElementHandler
      {
         switch(param1)
         {
            case "caption":
            case "subcaption":
            case "bodytext":
               return new class_3527();
            case "title":
               return new TitleElementHandler();
            case "spacing":
               return new class_3532();
            case "catalogbutton":
               return new CatalogButtonElementHandler();
            case "promotedroombutton":
               return new class_3543();
            case "link":
               return new class_3535();
            case "gotoroombutton":
               return new class_3542();
            case "requestbadgebutton":
            case "requestbadgebuttonsecond":
            case "requestbadgebuttonthird":
            case "requestbadgebuttonfourth":
            case "requestbadgebuttonfifth":
               break;
            case "credithabbletbutton":
               return new class_3530();
            case "communitygoaltimer":
               return new class_3539();
            case "customtimer":
               return new class_3537();
            case "gotohomeroombutton":
               return new class_3531();
            case "gotocompetitionroombutton":
               return new class_3540();
            case "rewardbadge":
               return new class_3528();
            case "image":
               return new class_3546();
            case "submitcompetitionroom":
               return new class_3544();
            case "concurrentusersmeter":
               return new class_3547();
            case "concurrentusersinfo":
               return new ConcurrentUsersInfoElementHandler();
            case "dailyquest":
               return new class_3541();
            case "buyvipbutton":
               return new class_3545();
            case "communitygoalscore":
               return new class_3533();
            case "internallinkbutton":
               return new class_3534();
            default:
               return null;
         }
         return new class_3538();
      }
   }
}
