package com.sulake.habbo.sound.trax
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.sound.class_3153;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.IEventDispatcher;
   import flash.events.SampleDataEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class TraxSequencer implements class_3153, class_13
   {
      
      private static const SAMPLES_PER_SECOND:Number = 44100;
      
      private static const BUFFER_LENGTH:uint = 8192;
      
      private static const SAMPLES_BAR_LENGTH:uint = 88000;
      
      private static const BAR_LENGTH:uint = 88000;
      
      private static const MIXING_BUFFER:Vector.<int> = new Vector.<int>(8192,true);
      
      private static const INTERPOLATION_BUFFER:Vector.<int> = new Vector.<int>(8192,true);
       
      
      private var _disposed:Boolean = false;
      
      private var name_1:IEventDispatcher;
      
      private var _volume:Number;
      
      private var _sound:Sound;
      
      private var var_1885:SoundChannel;
      
      private var var_1916:com.sulake.habbo.sound.trax.TraxData;
      
      private var var_2926:class_24;
      
      private var var_174:Boolean;
      
      private var var_519:int;
      
      private var var_3437:int = 0;
      
      private var var_1642:uint;
      
      private var var_1806:Array;
      
      private var var_2703:Boolean;
      
      private var var_2039:Boolean = true;
      
      private var var_1694:uint;
      
      private var var_3631:uint = 30;
      
      private var var_2118:Boolean;
      
      private var var_2032:Boolean;
      
      private var var_2386:int;
      
      private var var_1998:int;
      
      private var var_2262:int;
      
      private var var_1735:int;
      
      private var var_2190:Timer;
      
      private var var_1997:Timer;
      
      private var var_3091:Boolean;
      
      private var _expectedStreamPosition:int = 0;
      
      private var var_3275:int = 0;
      
      public function TraxSequencer(param1:int, param2:com.sulake.habbo.sound.trax.TraxData, param3:class_24, param4:IEventDispatcher)
      {
         super();
         name_1 = param4;
         var_519 = param1;
         _volume = 1;
         _sound = new Sound();
         var_1885 = null;
         var_2926 = param3;
         var_1916 = param2;
         var_174 = true;
         var_1642 = 0;
         var_1806 = [];
         var_2703 = false;
         var_1694 = 0;
         var_2039 = false;
         var_2118 = false;
         var_2032 = false;
         var_2386 = 0;
         var_1998 = 0;
         var_2262 = 0;
         var_1735 = 0;
      }
      
      public function set position(param1:Number) : void
      {
         var_1642 = param1 * 44100;
      }
      
      public function get volume() : Number
      {
         return _volume;
      }
      
      public function get position() : Number
      {
         return var_1642 / 44100;
      }
      
      public function get ready() : Boolean
      {
         return var_174;
      }
      
      public function set ready(param1:Boolean) : void
      {
         var_174 = param1;
      }
      
      public function get finished() : Boolean
      {
         return var_2039;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return var_1998 / 44100;
      }
      
      public function set fadeOutSeconds(param1:Number) : void
      {
         var_1998 = param1 * 44100;
      }
      
      public function get fadeInSeconds() : Number
      {
         return var_2386 / 44100;
      }
      
      public function set fadeInSeconds(param1:Number) : void
      {
         var_2386 = param1 * 44100;
      }
      
      public function get traxData() : com.sulake.habbo.sound.trax.TraxData
      {
         return var_1916;
      }
      
      public function set volume(param1:Number) : void
      {
         _volume = param1;
         if(var_1885 != null)
         {
            var_1885.soundTransform = new SoundTransform(_volume);
         }
      }
      
      public function get length() : Number
      {
         return var_1694 / 44100;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            stopImmediately();
            var_1916 = null;
            var_2926 = null;
            var_1806 = null;
            name_1 = null;
            _sound = null;
            _disposed = true;
         }
      }
      
      public function prepare() : Boolean
      {
         if(!var_174)
         {
            class_14.log("Cannot start trax playback until samples ready!");
            return false;
         }
         if(!var_2703)
         {
            if(var_1916 != null)
            {
               var_3091 = false;
               if(false)
               {
                  var_3091 = var_1916.metaCutMode;
               }
               if(var_3091)
               {
                  if(!prepareSequence())
                  {
                     class_14.log("Cannot start playback, prepare sequence failed!");
                     return false;
                  }
               }
               else if(!prepareLegacySequence())
               {
                  class_14.log("Cannot start playback, prepare legacy sequence failed!");
                  return false;
               }
            }
         }
         return true;
      }
      
      private function prepareLegacySequence() : Boolean
      {
         var _loc8_:int = 0;
         var _loc3_:class_24 = null;
         var _loc7_:TraxChannel = null;
         var _loc4_:* = 0;
         var _loc2_:* = 0;
         var _loc9_:int = 0;
         var _loc5_:int = 0;
         var _loc12_:TraxSample = null;
         var _loc11_:int = 0;
         var _loc6_:int = 0;
         var _loc10_:int = 0;
         if(var_1806 == null)
         {
            return false;
         }
         var _loc1_:uint = uint(getTimer());
         _loc8_ = 0;
         while(_loc8_ < var_1916.channels.length)
         {
            _loc3_ = new class_24();
            _loc7_ = var_1916.channels[_loc8_] as TraxChannel;
            _loc4_ = 0;
            _loc2_ = 0;
            _loc9_ = 0;
            while(_loc9_ < _loc7_.itemCount)
            {
               _loc5_ = _loc7_.getItem(_loc9_).id;
               (_loc12_ = var_2926.getValue(_loc5_) as TraxSample).setUsageFromSong(var_519,_loc1_);
               if(_loc12_ == null)
               {
                  class_14.log("Error in prepareLegacySequence(), sample was null!");
                  return false;
               }
               _loc11_ = getSampleBars(_loc12_.length);
               _loc6_ = _loc7_.getItem(_loc9_).length / _loc11_;
               _loc10_ = 0;
               while(_loc10_ < _loc6_)
               {
                  if(_loc5_ != 0)
                  {
                     _loc3_.add(_loc4_,_loc12_);
                  }
                  _loc2_ += _loc11_;
                  _loc4_ = _loc2_ * 88000;
                  _loc10_++;
               }
               if(var_1694 < _loc4_)
               {
                  var_1694 = _loc4_;
               }
               _loc9_++;
            }
            var_1806.push(_loc3_);
            _loc8_++;
         }
         var_2703 = true;
         return true;
      }
      
      private function prepareSequence() : Boolean
      {
         var _loc6_:int = 0;
         var _loc12_:class_24 = null;
         var _loc5_:TraxChannel = null;
         var _loc2_:* = 0;
         var _loc11_:* = 0;
         var _loc13_:Boolean = false;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc9_:TraxSample = null;
         var _loc3_:int = 0;
         var _loc14_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:int = 0;
         if(var_1806 == null)
         {
            return false;
         }
         var _loc10_:uint = uint(getTimer());
         _loc6_ = 0;
         while(_loc6_ < var_1916.channels.length)
         {
            _loc12_ = new class_24();
            _loc5_ = var_1916.channels[_loc6_] as TraxChannel;
            _loc2_ = 0;
            _loc11_ = 0;
            _loc13_ = false;
            _loc7_ = 0;
            while(_loc7_ < _loc5_.itemCount)
            {
               _loc4_ = _loc5_.getItem(_loc7_).id;
               (_loc9_ = var_2926.getValue(_loc4_) as TraxSample).setUsageFromSong(var_519,_loc10_);
               if(_loc9_ == null)
               {
                  class_14.log("Error in prepareSequence(), sample was null!");
                  return false;
               }
               _loc3_ = _loc11_;
               _loc14_ = _loc2_;
               _loc8_ = getSampleBars(_loc9_.length);
               _loc1_ = _loc5_.getItem(_loc7_).length;
               while(_loc3_ < _loc11_ + _loc1_)
               {
                  if(_loc4_ != 0 || _loc13_)
                  {
                     _loc12_.add(_loc14_,_loc9_);
                     _loc13_ = false;
                  }
                  _loc3_ += _loc8_;
                  _loc14_ = _loc3_ * 88000;
                  if(_loc3_ > _loc11_ + _loc1_)
                  {
                     _loc13_ = true;
                  }
               }
               _loc2_ = (_loc11_ += _loc5_.getItem(_loc7_).length) * 88000;
               if(var_1694 < _loc2_)
               {
                  var_1694 = _loc2_;
               }
               _loc7_++;
            }
            var_1806.push(_loc12_);
            _loc6_++;
         }
         var_2703 = true;
         return true;
      }
      
      public function play(param1:Number = 0) : Boolean
      {
         if(!prepare())
         {
            return false;
         }
         removeFadeoutStopTimer();
         if(var_1885 != null)
         {
            stopImmediately();
         }
         if(var_2386 > 0)
         {
            var_2118 = true;
            var_2262 = 0;
         }
         var_2032 = false;
         var_1735 = 0;
         var_2039 = false;
         _sound.addEventListener("sampleData",onSampleData);
         var_3437 = param1 * 44100;
         _expectedStreamPosition = 0;
         var_3275 = 0;
         var_1885 = _sound.play();
         volume = _volume;
         return true;
      }
      
      public function render(param1:SampleDataEvent) : Boolean
      {
         if(!prepare())
         {
            return false;
         }
         while(!var_2039)
         {
            onSampleData(param1);
         }
         return true;
      }
      
      public function stop() : Boolean
      {
         if(var_1998 > 0 && !var_2039)
         {
            stopWithFadeout();
         }
         else
         {
            playingComplete();
         }
         return true;
      }
      
      private function stopImmediately() : void
      {
         removeStopTimer();
         if(var_1885 != null)
         {
            var_1885.stop();
            var_1885 = null;
         }
         if(_sound != null)
         {
            _sound.removeEventListener("sampleData",onSampleData);
         }
      }
      
      private function stopWithFadeout() : void
      {
         if(var_2190 == null)
         {
            var_2032 = true;
            var_1735 = 0;
            var_2190 = new Timer(var_3631 + var_1998 / 44.1,1);
            var_2190.start();
            var_2190.addEventListener("timerComplete",onFadeOutComplete);
         }
      }
      
      private function getSampleBars(param1:uint) : int
      {
         if(var_3091)
         {
            return Math.round(param1 / 88000);
         }
         return Math.ceil(param1 / 88000);
      }
      
      private function getChannelSequenceOffsets() : Array
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:class_24 = null;
         var _loc4_:int = 0;
         var _loc2_:* = [];
         if(var_1806 != null)
         {
            _loc1_ = 0;
            _loc3_ = 0;
            while(_loc3_ < _loc1_)
            {
               _loc5_ = var_1806[_loc3_];
               _loc4_ = 0;
               while(_loc4_ < _loc5_.length && _loc5_.getKey(_loc4_) < var_1642)
               {
                  _loc4_++;
               }
               _loc2_.push(_loc4_ - 1);
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      private function mixChannelsIntoBuffer() : void
      {
         var _loc6_:int = 0;
         var _loc7_:class_24 = null;
         var _loc14_:int = 0;
         var _loc8_:TraxSample = null;
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc13_:int = 0;
         var _loc11_:int = 0;
         var _loc3_:* = 0;
         var _loc10_:int = 0;
         var _loc9_:int = 0;
         if(var_1806 == null)
         {
            return;
         }
         var _loc4_:Array = getChannelSequenceOffsets();
         var _loc1_:int = 0;
         var _loc12_:* = null;
         _loc6_ = _loc1_ - 1;
         while(_loc6_ >= 0)
         {
            _loc7_ = var_1806[_loc6_];
            _loc14_ = int(_loc4_[_loc6_]);
            if((_loc8_ = _loc7_.getWithIndex(_loc14_)) == null)
            {
               _loc12_ = null;
            }
            else
            {
               _loc2_ = _loc7_.getKey(_loc14_);
               _loc5_ = var_1642 - _loc2_;
               if(_loc8_.id == 0 || _loc5_ < 0)
               {
                  _loc12_ = null;
               }
               else
               {
                  _loc12_ = new TraxChannelSample(_loc8_,_loc5_);
               }
            }
            _loc13_ = 8192;
            if(var_1694 - var_1642 < _loc13_)
            {
               _loc13_ = var_1694 - var_1642;
            }
            _loc11_ = 0;
            while(_loc11_ < _loc13_)
            {
               _loc3_ = _loc13_;
               if(_loc14_ < _loc7_.length - 1)
               {
                  _loc10_ = _loc7_.getKey(_loc14_ + 1);
                  if(_loc13_ + var_1642 >= _loc10_)
                  {
                     _loc3_ = _loc10_ - var_1642;
                  }
               }
               if(_loc3_ > _loc13_ - _loc11_)
               {
                  _loc3_ = _loc13_ - _loc11_;
               }
               if(_loc6_ == _loc1_ - 1)
               {
                  if(_loc12_ != null)
                  {
                     _loc12_.setSample(MIXING_BUFFER,_loc11_,_loc3_);
                     _loc11_ += _loc3_;
                  }
                  else
                  {
                     _loc9_ = 0;
                     while(_loc9_ < _loc3_)
                     {
                        MIXING_BUFFER[_loc11_++] = 0;
                        _loc9_++;
                     }
                  }
               }
               else
               {
                  if(_loc12_ != null)
                  {
                     _loc12_.addSample(MIXING_BUFFER,_loc11_,_loc3_);
                  }
                  _loc11_ += _loc3_;
               }
               if(_loc11_ < _loc13_)
               {
                  _loc14_++;
                  if((_loc8_ = _loc7_.getWithIndex(_loc14_)) == null || _loc8_.id == 0)
                  {
                     _loc12_ = null;
                  }
                  else
                  {
                     _loc12_ = new TraxChannelSample(_loc8_,0);
                  }
               }
            }
            _loc6_--;
         }
      }
      
      private function checkSongFinishing() : void
      {
         var _loc1_:int = int(var_1694 < var_3437 ? var_1694 : (var_3437 > 0 ? var_3437 : var_1694));
         if(var_1642 > _loc1_ + var_3631 * 44.1 && !var_2039)
         {
            var_2039 = true;
            if(var_1997 != null)
            {
               var_1997.reset();
               var_1997.removeEventListener("timerComplete",onPlayingComplete);
            }
            var_1997 = new Timer(2,1);
            var_1997.start();
            var_1997.addEventListener("timerComplete",onPlayingComplete);
         }
         else if(var_1642 > _loc1_ - var_1998 && !var_2032)
         {
            var_2118 = false;
            var_2032 = true;
            var_1735 = 0;
         }
      }
      
      private function onSampleData(param1:SampleDataEvent) : void
      {
         if(param1.position > _expectedStreamPosition)
         {
            var_3275++;
            class_14.log("Audio buffer under run...");
            _expectedStreamPosition = param1.position;
         }
         if(volume > 0)
         {
            mixChannelsIntoBuffer();
         }
         var _loc2_:int = 8192;
         if(var_1694 - var_1642 < _loc2_)
         {
            _loc2_ = var_1694 - var_1642;
            if(_loc2_ < 0)
            {
               _loc2_ = 0;
            }
         }
         if(volume <= 0)
         {
            _loc2_ = 0;
         }
         writeAudioToOutputStream(param1.data,_loc2_);
         var_1642 += 8192;
         _expectedStreamPosition += 8192;
         if(var_1885 != null)
         {
            var_3631 = param1.position / 44100 * 1000 - 0;
         }
         checkSongFinishing();
      }
      
      private function writeAudioToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc6_:* = 0;
         if(param2 > 0)
         {
            if(!var_2118 && !var_2032)
            {
               writeMixingBufferToOutputStream(param1,param2);
            }
            else
            {
               if(var_2118)
               {
                  _loc3_ = 1 / var_2386;
                  _loc4_ = var_2262 / var_2386;
                  var_2262 += 8192;
                  if(var_2262 > var_2386)
                  {
                     var_2118 = false;
                  }
               }
               else if(var_2032)
               {
                  _loc3_ = -1 / var_1998;
                  _loc4_ = 1 - var_1735 / var_1998;
                  var_1735 += 8192;
                  if(var_1735 > var_1998)
                  {
                     var_1735 = var_1998;
                  }
               }
               writeMixingBufferToOutputStreamWithFade(param1,param2,_loc4_,_loc3_);
            }
         }
         var _loc5_:Number = 0;
         _loc6_ = param2;
         while(_loc6_ < 8192)
         {
            param1.writeFloat(_loc5_);
            param1.writeFloat(_loc5_);
            _loc6_++;
         }
      }
      
      private function writeMixingBufferToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = 0;
         _loc3_ = 0;
         while(_loc3_ < param2)
         {
            _loc4_ = 0;
            param1.writeFloat(_loc4_);
            param1.writeFloat(_loc4_);
            _loc3_++;
         }
      }
      
      private function writeMixingBufferToOutputStreamWithFade(param1:ByteArray, param2:int, param3:Number, param4:Number) : void
      {
         var _loc6_:Number = 0;
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < param2)
         {
            if(param3 < 0 || param3 > 1)
            {
               break;
            }
            _loc6_ = 0 * param3;
            param3 += param4;
            param1.writeFloat(_loc6_);
            param1.writeFloat(_loc6_);
            _loc5_++;
         }
         if(param3 < 0)
         {
            while(_loc5_ < param2)
            {
               param1.writeFloat(0);
               param1.writeFloat(0);
               _loc5_++;
            }
         }
         else if(param3 > 1)
         {
            while(_loc5_ < param2)
            {
               _loc6_ = 0;
               param3 += param4;
               param1.writeFloat(_loc6_);
               param1.writeFloat(_loc6_);
               _loc5_++;
            }
         }
      }
      
      private function onPlayingComplete(param1:TimerEvent) : void
      {
         if(var_2039)
         {
            playingComplete();
         }
      }
      
      private function onFadeOutComplete(param1:TimerEvent) : void
      {
         removeFadeoutStopTimer();
         playingComplete();
      }
      
      private function playingComplete() : void
      {
         stopImmediately();
         name_1.dispatchEvent(new SoundCompleteEvent("SCE_TRAX_SONG_COMPLETE",var_519));
      }
      
      private function removeFadeoutStopTimer() : void
      {
         if(var_2190 != null)
         {
            var_2190.removeEventListener("timerComplete",onFadeOutComplete);
            var_2190.reset();
            var_2190 = null;
         }
      }
      
      private function removeStopTimer() : void
      {
         if(var_1997 != null)
         {
            var_1997.reset();
            var_1997.removeEventListener("timerComplete",onPlayingComplete);
            var_1997 = null;
         }
      }
   }
}
