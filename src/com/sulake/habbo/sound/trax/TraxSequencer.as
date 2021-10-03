package com.sulake.habbo.sound.trax
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.sound.IHabboSound;
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
   
   public class TraxSequencer implements IHabboSound, IDisposable
   {
      
      private static const const_115:Number = 44100;
      
      private static const const_190:uint = 8192;
      
      private static const const_1525:uint = 88000;
      
      private static const const_1526:uint = 88000;
      
      private static const const_299:Vector.<int> = new Vector.<int>(const_190,true);
       
      
      private var _disposed:Boolean = false;
      
      private var _events:IEventDispatcher;
      
      private var var_926:Number;
      
      private var var_1000:Sound;
      
      private var var_442:SoundChannel;
      
      private var var_1219:TraxData;
      
      private var var_1873:Map;
      
      private var var_1107:Boolean;
      
      private var var_1690:int;
      
      private var var_1501:int = 0;
      
      private var var_208:uint;
      
      private var var_443:Array;
      
      private var var_1871:Boolean;
      
      private var var_642:Boolean = true;
      
      private var var_365:uint;
      
      private var var_1500:uint;
      
      private var var_999:Boolean;
      
      private var var_792:Boolean;
      
      private var var_793:int;
      
      private var var_444:int;
      
      private var var_1001:int;
      
      private var var_532:int;
      
      private var var_643:Timer;
      
      private var var_441:Timer;
      
      private var var_1220:int = 0;
      
      private var var_1872:int = 0;
      
      public function TraxSequencer(param1:int, param2:TraxData, param3:Map, param4:IEventDispatcher)
      {
         this.var_1500 = uint(30);
         super();
         this._events = param4;
         this.var_1690 = param1;
         this.var_926 = 1;
         this.var_1000 = new Sound();
         this.var_442 = null;
         this.var_1873 = param3;
         this.var_1219 = param2;
         this.var_1107 = true;
         this.var_208 = 0;
         this.var_443 = [];
         this.var_1871 = false;
         this.var_365 = 0;
         this.var_642 = false;
         this.var_999 = false;
         this.var_792 = false;
         this.var_793 = 0;
         this.var_444 = 0;
         this.var_1001 = 0;
         this.var_532 = 0;
      }
      
      public function set position(param1:Number) : void
      {
         this.var_208 = uint(param1 * const_115);
      }
      
      public function get volume() : Number
      {
         return this.var_926;
      }
      
      public function get position() : Number
      {
         return this.var_208 / const_115;
      }
      
      public function get ready() : Boolean
      {
         return this.var_1107;
      }
      
      public function set ready(param1:Boolean) : void
      {
         this.var_1107 = param1;
      }
      
      public function get finished() : Boolean
      {
         return this.var_642;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_444 / const_115;
      }
      
      public function set fadeOutSeconds(param1:Number) : void
      {
         this.var_444 = int(param1 * const_115);
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_793 / const_115;
      }
      
      public function set fadeInSeconds(param1:Number) : void
      {
         this.var_793 = int(param1 * const_115);
      }
      
      public function get traxData() : TraxData
      {
         return this.var_1219;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_926 = param1;
         if(this.var_442 != null)
         {
            this.var_442.soundTransform = new SoundTransform(this.var_926);
         }
      }
      
      public function get length() : Number
      {
         return this.var_365 / const_115;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.stopImmediately();
            this.var_1219 = null;
            this.var_1873 = null;
            this.var_443 = null;
            this._events = null;
            this.var_1000 = null;
            this._disposed = true;
         }
      }
      
      public function prepare() : Boolean
      {
         if(!this.var_1107)
         {
            Logger.log("Cannot start trax playback until samples ready!");
            return false;
         }
         if(!this.var_1871)
         {
            if(!this.prepareSequence())
            {
               Logger.log("Cannot start playback, prepare sequence failed!");
               return false;
            }
         }
         return true;
      }
      
      private function prepareSequence() : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(this.var_443 == null)
         {
            return false;
         }
         var _loc1_:uint = getTimer();
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1219.channels.length)
         {
            _loc3_ = new Map();
            _loc4_ = this.var_1219.channels[_loc2_] as TraxChannel;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            while(_loc7_ < _loc4_.itemCount)
            {
               _loc8_ = _loc4_.getItem(_loc7_).id;
               _loc9_ = this.var_1873.getValue(_loc8_) as TraxSample;
               _loc9_.setUsageFromSong(this.var_1690,_loc1_);
               if(_loc9_ == null)
               {
                  Logger.log("Error in prepareSequence(), sample was null!");
               }
               continue;
               _loc10_ = this.getSampleBars(_loc9_.length);
               _loc11_ = _loc4_.getItem(_loc7_).length / _loc10_;
               _loc12_ = 0;
               while(_loc12_ < _loc11_)
               {
                  if(_loc8_ != 0)
                  {
                     _loc3_.add(_loc5_,_loc9_);
                  }
                  _loc6_ += _loc10_;
                  _loc5_ = uint(_loc6_ * const_1526);
                  _loc12_++;
               }
               if(this.var_365 < _loc5_)
               {
                  this.var_365 = _loc5_;
               }
               _loc7_++;
               return false;
            }
            this.var_443.push(_loc3_);
            _loc2_++;
         }
         this.var_1871 = true;
         return true;
      }
      
      public function play(param1:Number = 0.0) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         this.removeFadeoutStopTimer();
         if(this.var_442 != null)
         {
            this.stopImmediately();
         }
         if(this.var_793 > 0)
         {
            this.var_999 = true;
            this.var_1001 = 0;
         }
         this.var_792 = false;
         this.var_532 = 0;
         this.var_642 = false;
         this.var_1000.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         this.var_1501 = param1 * const_115;
         this.var_1220 = 0;
         this.var_1872 = 0;
         this.var_442 = this.var_1000.play();
         this.volume = this.var_926;
         return true;
      }
      
      public function render(param1:SampleDataEvent) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         while(!this.var_642)
         {
            this.onSampleData(param1);
         }
         return true;
      }
      
      public function stop() : Boolean
      {
         if(this.var_444 > 0 && !this.var_642)
         {
            this.stopWithFadeout();
         }
         else
         {
            this.playingComplete();
         }
         return true;
      }
      
      private function stopImmediately() : void
      {
         this.removeStopTimer();
         if(this.var_442 != null)
         {
            this.var_442.stop();
            this.var_442 = null;
         }
         if(this.var_1000 != null)
         {
            this.var_1000.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         }
      }
      
      private function stopWithFadeout() : void
      {
         if(this.var_643 == null)
         {
            this.var_792 = true;
            this.var_532 = 0;
            this.var_643 = new Timer(this.var_1500 + this.var_444 / (const_115 / 1000),1);
            this.var_643.start();
            this.var_643.addEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
         }
      }
      
      private function getSampleBars(param1:uint) : int
      {
         return Math.ceil(param1 / const_1525);
      }
      
      private function getChannelSequenceOffsets() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:* = [];
         if(this.var_443 != null)
         {
            _loc2_ = this.var_443.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.var_443[_loc3_];
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length && _loc4_.getKey(_loc5_) < this.var_208)
               {
                  _loc5_++;
               }
               _loc1_.push(_loc5_ - 1);
               _loc3_++;
            }
         }
         return _loc1_;
      }
      
      private function mixChannelsIntoBuffer() : void
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(this.var_443 == null)
         {
            return;
         }
         var _loc1_:Array = this.getChannelSequenceOffsets();
         var _loc2_:int = this.var_443.length;
         var _loc3_:* = null;
         var _loc4_:int = _loc2_ - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = this.var_443[_loc4_];
            _loc6_ = _loc1_[_loc4_];
            _loc7_ = _loc5_.getWithIndex(_loc6_);
            if(_loc7_ == null)
            {
               _loc3_ = null;
            }
            else
            {
               _loc10_ = _loc5_.getKey(_loc6_);
               _loc11_ = this.var_208 - _loc10_;
               if(_loc7_.id == 0 || _loc11_ < 0)
               {
                  _loc3_ = null;
               }
               else
               {
                  _loc3_ = new TraxChannelSample(_loc7_,_loc11_);
               }
            }
            _loc8_ = const_190;
            if(this.var_365 - this.var_208 < _loc8_)
            {
               _loc8_ = this.var_365 - this.var_208;
            }
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc12_ = _loc8_;
               if(_loc6_ < _loc5_.length - 1)
               {
                  _loc13_ = _loc5_.getKey(_loc6_ + 1);
                  if(_loc8_ + this.var_208 >= _loc13_)
                  {
                     _loc12_ = _loc13_ - this.var_208;
                  }
               }
               if(_loc12_ > _loc8_ - _loc9_)
               {
                  _loc12_ = _loc8_ - _loc9_;
               }
               if(_loc4_ == _loc2_ - 1)
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.setSample(const_299,_loc9_,_loc12_);
                     _loc9_ += _loc12_;
                  }
                  else
                  {
                     _loc14_ = 0;
                     while(_loc14_ < _loc12_)
                     {
                        var _loc15_:*;
                        const_299[_loc15_ = _loc9_++] = 0;
                        _loc14_++;
                     }
                  }
               }
               else
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.addSample(const_299,_loc9_,_loc12_);
                  }
                  _loc9_ += _loc12_;
               }
               if(_loc9_ < _loc8_)
               {
                  _loc7_ = _loc5_.getWithIndex(++_loc6_);
                  if(_loc7_ == null || _loc7_.id == 0)
                  {
                     _loc3_ = null;
                  }
                  else
                  {
                     _loc3_ = new TraxChannelSample(_loc7_,0);
                  }
               }
            }
            _loc4_--;
         }
      }
      
      private function checkSongFinishing() : void
      {
         var _loc1_:int = this.var_365 < this.var_1501 ? int(this.var_365) : (this.var_1501 > 0 ? int(this.var_1501) : int(this.var_365));
         if(this.var_208 > _loc1_ + this.var_1500 * (const_115 / 1000) && !this.var_642)
         {
            this.var_642 = true;
            if(this.var_441 != null)
            {
               this.var_441.reset();
               this.var_441.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
            }
            this.var_441 = new Timer(2,1);
            this.var_441.start();
            this.var_441.addEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
         }
         else if(this.var_208 > _loc1_ - this.var_444 && !this.var_792)
         {
            this.var_999 = false;
            this.var_792 = true;
            this.var_532 = 0;
         }
      }
      
      private function onSampleData(param1:SampleDataEvent) : void
      {
         if(param1.position > this.var_1220)
         {
            ++this.var_1872;
            Logger.log("Audio buffer under run...");
            this.var_1220 = param1.position;
         }
         if(this.volume > 0)
         {
            this.mixChannelsIntoBuffer();
         }
         var _loc2_:int = const_190;
         if(this.var_365 - this.var_208 < _loc2_)
         {
            _loc2_ = this.var_365 - this.var_208;
            if(_loc2_ < 0)
            {
               _loc2_ = 0;
            }
         }
         if(this.volume <= 0)
         {
            _loc2_ = 0;
         }
         this.writeAudioToOutputStream(param1.data,_loc2_);
         this.var_208 += const_190;
         this.var_1220 += const_190;
         if(this.var_442 != null)
         {
            this.var_1500 = param1.position / const_115 * 1000 - this.var_442.position;
         }
         this.checkSongFinishing();
      }
      
      private function writeAudioToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(param2 > 0)
         {
            if(!this.var_999 && !this.var_792)
            {
               this.writeMixingBufferToOutputStream(param1,param2);
            }
            else
            {
               if(this.var_999)
               {
                  _loc5_ = 1 / this.var_793;
                  _loc6_ = this.var_1001 / Number(this.var_793);
                  this.var_1001 += const_190;
                  if(this.var_1001 > this.var_793)
                  {
                     this.var_999 = false;
                  }
               }
               else if(this.var_792)
               {
                  _loc5_ = -1 / this.var_444;
                  _loc6_ = 1 - this.var_532 / Number(this.var_444);
                  this.var_532 += const_190;
                  if(this.var_532 > this.var_444)
                  {
                     this.var_532 = this.var_444;
                  }
               }
               this.writeMixingBufferToOutputStreamWithFade(param1,param2,_loc6_,_loc5_);
            }
         }
         var _loc4_:int = param2;
         while(_loc4_ < const_190)
         {
            param1.writeFloat(0);
            param1.writeFloat(0);
            _loc4_++;
         }
      }
      
      private function writeMixingBufferToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc3_ = Number(Number(const_299[_loc4_]) * 0);
            param1.writeFloat(_loc3_);
            param1.writeFloat(_loc3_);
            _loc4_++;
         }
      }
      
      private function writeMixingBufferToOutputStreamWithFade(param1:ByteArray, param2:int, param3:Number, param4:Number) : void
      {
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < param2)
         {
            if(param3 < 0 || param3 > 1)
            {
               break;
            }
            _loc5_ = Number(Number(const_299[_loc6_]) * 0 * param3);
            param3 += param4;
            param1.writeFloat(_loc5_);
            param1.writeFloat(_loc5_);
            _loc6_++;
         }
         if(param3 < 0)
         {
            while(_loc6_ < param2)
            {
               param1.writeFloat(0);
               param1.writeFloat(0);
               _loc6_++;
            }
         }
         else if(param3 > 1)
         {
            while(_loc6_ < param2)
            {
               _loc5_ = Number(Number(const_299[_loc6_]) * 0);
               param3 += param4;
               param1.writeFloat(_loc5_);
               param1.writeFloat(_loc5_);
               _loc6_++;
            }
         }
      }
      
      private function onPlayingComplete(param1:TimerEvent) : void
      {
         if(this.var_642)
         {
            this.playingComplete();
         }
      }
      
      private function onFadeOutComplete(param1:TimerEvent) : void
      {
         this.removeFadeoutStopTimer();
         this.playingComplete();
      }
      
      private function playingComplete() : void
      {
         this.stopImmediately();
         this._events.dispatchEvent(new SoundCompleteEvent(SoundCompleteEvent.TRAX_SONG_COMPLETE,this.var_1690));
      }
      
      private function removeFadeoutStopTimer() : void
      {
         if(this.var_643 != null)
         {
            this.var_643.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
            this.var_643.reset();
            this.var_643 = null;
         }
      }
      
      private function removeStopTimer() : void
      {
         if(this.var_441 != null)
         {
            this.var_441.reset();
            this.var_441.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
            this.var_441 = null;
         }
      }
   }
}
