package com.sulake.habbo.sound
{
   import com.sulake.core.runtime.class_41;
   import flash.media.Sound;
   import flash.media.SoundTransform;
   import flash.utils.ByteArray;
   
   public class HabboSoundWithPitch extends HabboSoundBase implements class_41
   {
       
      
      private const SILENCE_MS:uint = 50;
      
      private const FADEIN_MS:uint = 175;
      
      private var var_2661:Number;
      
      private var var_2905:Sound;
      
      private var var_1751:ByteArray;
      
      private var var_3871:int;
      
      private var var_3198:uint = 0;
      
      private var var_3465:uint = 0;
      
      private var var_3411:Boolean = false;
      
      public function HabboSoundWithPitch(param1:Sound, param2:Number = 1)
      {
         super(param1);
         var_2661 = param2;
         var_2905 = new Sound();
         extractMonoSamples();
         setPitch(var_2661);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_2905 = null;
         if(var_1751 != null)
         {
            var_1751.clear();
            var_1751 = null;
         }
      }
      
      override public function play(param1:Number = 0) : Boolean
      {
         stop();
         var_3465 = var_3198;
         var_3411 = false;
         setComplete(false);
         setSoundChannel(var_2905.play(0,0,new SoundTransform(0)));
         return true;
      }
      
      override public function stop() : Boolean
      {
         if(getSoundChannel() != null)
         {
            getSoundChannel().stop();
         }
         return true;
      }
      
      public function update(param1:uint) : void
      {
         var_3198 += param1;
         var _loc2_:uint = uint(var_3198 - var_3465);
         if(var_3465 > 0 && _loc2_ < 50)
         {
            setChannelVolume(0);
         }
         else if(var_3465 > 0 && _loc2_ >= 50 && _loc2_ < 175)
         {
            setChannelVolume(volume * (_loc2_ / 175));
         }
         else if(!var_3411)
         {
            setChannelVolume(volume);
            var_3411 = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_1751 == null;
      }
      
      public function setPitch(param1:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc4_:int = 0;
         var_2661 = param1;
         var _loc6_:ByteArray = new ByteArray();
         var _loc3_:uint = uint(int(0 * var_2661));
         var _loc2_:Number = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc3_ && int(_loc2_) * 4 < var_1751.length)
         {
            var_1751.position = int(_loc2_) * 4;
            _loc5_ = var_1751.readFloat();
            _loc6_.writeFloat(_loc5_);
            _loc6_.writeFloat(_loc5_);
            _loc2_ += var_2661;
            _loc4_++;
         }
         _loc6_.position = 0;
         var_2905.loadPCMFromByteArray(_loc6_,_loc6_.length / 8,"float");
      }
      
      private function extractMonoSamples() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc1_:ByteArray = new ByteArray();
         _soundObject.extract(_loc1_,0,0);
         var_1751 = new ByteArray();
         var_3871 = _loc1_.length / 8;
         _loc1_.position = 0;
         _loc2_ = 0;
         while(_loc2_ < var_3871)
         {
            _loc3_ = _loc1_.readFloat();
            _loc1_.readFloat();
            var_1751.writeFloat(_loc3_);
            _loc2_++;
         }
      }
   }
}
