package com.sulake.habbo.window.enum
{
   public class class_3506
   {
      
      public static const UP_LEFT:String = "up, left";
      
      public static const UP_CENTER:String = "up, center";
      
      public static const UP_RIGHT:String = "up, right";
      
      public static const DOWN_LEFT:String = "down, left";
      
      public static const DOWN_CENTER:String = "down, center";
      
      public static const DOWN_RIGHT:String = "down, right";
      
      public static const LEFT_TOP:String = "left, top";
      
      public static const LEFT_MIDDLE:String = "left, middle";
      
      public static const LEFT_BOTTOM:String = "left, bottom";
      
      public static const RIGHT_TOP:String = "right, top";
      
      public static const RIGHT_MIDDLE:String = "right, middle";
      
      public static const RIGHT_BOTTOM:String = "right, bottom";
      
      public static const ALL:Array = ["up, left","up, center","up, right","down, left","down, center","down, right","left, top","left, middle","left, bottom","right, top","right, middle","right, bottom"];
      
      public static const UP:String = "up";
      
      public static const DOWN:String = "down";
      
      public static const LEFT:String = "left";
      
      public static const RIGHT:String = "right";
      
      public static const MINIMUM:String = "minimum";
      
      public static const MIDDLE:String = "middle";
      
      public static const MAXIMUM:String = "maximum";
       
      
      public function class_3506()
      {
         super();
      }
      
      public static function directionFromPivot(param1:String) : String
      {
         return param1.substr(0,param1.indexOf(","));
      }
      
      public static function positionFromPivot(param1:String) : String
      {
         switch(param1)
         {
            case "up, left":
            case "down, left":
            case "left, top":
            case "right, top":
               break;
            case "up, right":
            case "down, right":
            case "left, bottom":
            case "right, bottom":
               return "maximum";
            default:
               return "middle";
         }
         return "minimum";
      }
   }
}
