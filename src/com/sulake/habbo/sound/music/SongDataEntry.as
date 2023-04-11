package com.sulake.habbo.sound.music
{
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.class_3153;
   import package_93.class_1544;
   
   public class SongDataEntry extends class_1544 implements ISongInfo
   {
       
      
      private var _soundObject:class_3153 = null;
      
      private var var_986:String;
      
      private var var_3926:int = -1;
      
      public function SongDataEntry(param1:int, param2:int, param3:String, param4:String, param5:class_3153)
      {
         _soundObject = param5;
         var_986 = "";
         super(param1,param2,param3,param4);
      }
      
      override public function get id() : int
      {
         return var_519;
      }
      
      override public function get length() : int
      {
         return var_846;
      }
      
      override public function get name() : String
      {
         return _songName;
      }
      
      override public function get creator() : String
      {
         return var_988;
      }
      
      public function get loaded() : Boolean
      {
         return _soundObject == null ? false : _soundObject.ready;
      }
      
      public function get soundObject() : class_3153
      {
         return _soundObject;
      }
      
      public function get songData() : String
      {
         return var_986;
      }
      
      public function get diskId() : int
      {
         return var_3926;
      }
      
      public function set soundObject(param1:class_3153) : void
      {
         _soundObject = param1;
      }
      
      public function set songData(param1:String) : void
      {
         var_986 = param1;
      }
      
      public function set diskId(param1:int) : void
      {
         var_3926 = param1;
      }
   }
}
