package com.sulake.habbo.room.object
{
   import flash.utils.Dictionary;
   
   public class RoomObjectUserTypes
   {
      
      public static const USER:String = "user";
      
      public static const PET:String = "pet";
      
      public static const BOT:String = "bot";
      
      public static const RENTABLE_BOT:String = "rentable_bot";
      
      public static const MONSTERPLANT:String = "monsterplant";
      
      private static const const_413:Dictionary = new Dictionary();
      
      {
         const_413["user"] = 1;
         const_413["pet"] = 2;
         const_413["bot"] = 3;
         const_413["rentable_bot"] = 4;
      }
      
      public function RoomObjectUserTypes()
      {
         super();
      }
      
      public static function getTypeId(param1:String) : int
      {
         return const_413[param1];
      }
      
      public static function getName(param1:int) : String
      {
         for(var _loc2_ in const_413)
         {
            if(const_413[_loc2_] == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function getVisualizationType(param1:String) : String
      {
         switch(param1)
         {
            case "bot":
            case "rentable_bot":
               break;
            default:
               return param1;
         }
         return "user";
      }
   }
}
