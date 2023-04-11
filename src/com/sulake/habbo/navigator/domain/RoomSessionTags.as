package com.sulake.habbo.navigator.domain
{
   import package_2.class_820;
   
   public class RoomSessionTags
   {
       
      
      private var _tag1:String;
      
      private var _tag2:String;
      
      public function RoomSessionTags(param1:String, param2:String)
      {
         super();
         _tag1 = param1;
         _tag2 = param2;
      }
      
      public function getMsg() : class_820
      {
         return new class_820(_tag1,_tag2);
      }
   }
}
