package com.sulake.habbo.sound
{
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSoundBase implements class_3153
   {
       
      
      private var var_1885:SoundChannel = null;
      
      private var var_1589:Boolean;
      
      private var _volume:Number;
      
      private var var_3321:int;
      
      protected var _soundObject:Sound = null;
      
      public function HabboSoundBase(param1:Sound, param2:int = 0)
      {
         super();
         _soundObject = param1;
         _soundObject.addEventListener("complete",onComplete);
         _volume = 1;
         var_1589 = false;
         var_3321 = param2;
      }
      
      protected function getSoundObject() : Sound
      {
         return _soundObject;
      }
      
      protected function getSoundChannel() : SoundChannel
      {
         return var_1885;
      }
      
      protected function setSoundChannel(param1:SoundChannel) : void
      {
         var_1885 = param1;
      }
      
      protected function setComplete(param1:Boolean) : void
      {
         var_1589 = param1;
      }
      
      public function dispose() : void
      {
         stop();
         var_1885 = null;
         _soundObject = null;
      }
      
      public function play(param1:Number = 0) : Boolean
      {
         var_1589 = false;
         var_1885 = _soundObject.play(0,var_3321);
         this.volume = _volume;
         return true;
      }
      
      public function stop() : Boolean
      {
         if(var_1885)
         {
            var_1885.stop();
         }
         return true;
      }
      
      public function get volume() : Number
      {
         return _volume;
      }
      
      public function set volume(param1:Number) : void
      {
         _volume = param1;
         setChannelVolume(param1);
      }
      
      protected function setChannelVolume(param1:Number) : void
      {
         if(var_1885 != null)
         {
            var_1885.soundTransform = new SoundTransform(param1);
         }
      }
      
      public function get position() : Number
      {
         return var_1885.position;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get length() : Number
      {
         return _soundObject.length;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get finished() : Boolean
      {
         return !var_1589;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return 0;
      }
      
      public function set fadeOutSeconds(param1:Number) : void
      {
      }
      
      public function get fadeInSeconds() : Number
      {
         return 0;
      }
      
      public function set fadeInSeconds(param1:Number) : void
      {
      }
      
      private function onComplete(param1:Event) : void
      {
         var_1589 = true;
      }
   }
}
