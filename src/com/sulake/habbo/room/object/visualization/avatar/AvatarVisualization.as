package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_1075:String = "avatar";
      
      private static const const_666:Number = -0.01;
      
      private static const const_665:Number = -0.409;
      
      private static const const_1074:int = 2;
      
      private static const const_1418:Array = [0,0,0];
      
      private static const const_1520:int = 3;
       
      
      private var var_636:AvatarVisualizationData = null;
      
      private var var_509:Map;
      
      private var var_529:Map;
      
      private var var_1151:int = 0;
      
      private var var_911:Boolean;
      
      private var var_605:String;
      
      private var var_941:String;
      
      private var var_1152:int = 0;
      
      private var var_634:BitmapDataAsset;
      
      private var var_988:BitmapDataAsset;
      
      private var var_1760:int = -1;
      
      private var var_1858:int = -1;
      
      private var var_1864:int = -1;
      
      private const const_1076:int = 0;
      
      private const const_1984:int = 1;
      
      private const const_2001:int = 2;
      
      private const const_2002:int = 3;
      
      private const const_1419:int = 4;
      
      private var var_1663:int = -1;
      
      private var var_261:String = "";
      
      private var var_1496:String = "";
      
      private var var_1860:Boolean = false;
      
      private var var_1862:Boolean = false;
      
      private var var_1863:Boolean = false;
      
      private var var_1497:Boolean = false;
      
      private var var_599:Boolean = false;
      
      private var var_1435:int = 0;
      
      private var _danceStyle:int = 0;
      
      private var var_1859:int = 0;
      
      private var var_788:int = 0;
      
      private var var_787:int = 0;
      
      private var var_635:int = 0;
      
      private var var_1498:int = 0;
      
      private var var_1214:Boolean = false;
      
      private var var_1865:Boolean = false;
      
      private var var_1213:int = 0;
      
      private var var_786:int = 0;
      
      private var var_1861:Boolean = false;
      
      private var var_1212:int = 0;
      
      private var var_58:IAvatarImage = null;
      
      private var var_1110:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_509 = new Map();
         this.var_529 = new Map();
         this.var_911 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_509 != null)
         {
            this.resetImages();
            this.var_509.dispose();
            this.var_529.dispose();
            this.var_509 = null;
         }
         this.var_636 = null;
         this.var_634 = null;
         this.var_988 = null;
         super.dispose();
         this.var_1110 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1110;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_636 = param1 as AvatarVisualizationData;
         createSprites(this.const_1419);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_155)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_273) > 0 && param3);
            if(_loc5_ != this.var_1860)
            {
               this.var_1860 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_385) > 0;
            if(_loc5_ != this.var_1862)
            {
               this.var_1862 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_442) > 0;
            if(_loc5_ != this.var_1863)
            {
               this.var_1863 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_720) > 0 && param3);
            if(_loc5_ != this.var_1497)
            {
               this.var_1497 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1250) > 0;
            if(_loc5_ != this.var_599)
            {
               this.var_599 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_154);
            if(_loc6_ != this.var_1435)
            {
               this.var_1435 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_265);
            if(_loc7_ != this.var_261)
            {
               this.var_261 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_882);
            if(_loc7_ != this.var_1496)
            {
               this.var_1496 = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1257);
            if(_loc6_ != this._danceStyle)
            {
               this._danceStyle = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_619);
            if(_loc6_ != this.var_788)
            {
               this.var_788 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_522);
            if(_loc6_ != this.var_787)
            {
               this.var_787 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_393);
            if(_loc6_ != this.var_635)
            {
               this.var_635 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_220);
            if(_loc6_ != this.var_1760)
            {
               this.var_1760 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_787 > 0 && param1.getNumber(RoomObjectVariableEnum.const_393) > 0)
            {
               if(this.var_635 != this.var_787)
               {
                  this.var_635 = this.var_787;
                  _loc4_ = true;
               }
            }
            else if(this.var_635 != 0)
            {
               this.var_635 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_991);
            if(_loc6_ != this.var_1213)
            {
               this.var_1213 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.AVATAR_GENDER);
            if(_loc7_ != this.var_941)
            {
               this.var_941 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_203);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_881);
            if(_loc6_ != this.var_1859)
            {
               _loc4_ = true;
            }
            var_155 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_605 != param1)
         {
            this.var_605 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_509)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_529)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_509.reset();
         this.var_529.reset();
         this.var_58 = null;
         _loc2_ = getSprite(this.const_1076);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1497 = false;
         }
         if(this.var_261 == "sit" || this.var_261 == "lay")
         {
            this.var_1498 = param1 / 2;
         }
         else
         {
            this.var_1498 = 0;
         }
         this.var_1865 = false;
         this.var_1214 = false;
         if(this.var_261 == "lay")
         {
            this.var_1214 = true;
            _loc2_ = int(this.var_1496);
            if(_loc2_ < 0)
            {
               this.var_1865 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_509.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_529.getValue(_loc4_) as IAvatarImage;
            if(_loc3_)
            {
               _loc3_.forceActionUpdate();
            }
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_636.getAvatar(this.var_605,param1,this.var_941,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_509.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_529.length >= const_1520)
                  {
                     _loc5_ = this.var_529.remove(this.var_529.getKey(0));
                     if(_loc5_)
                     {
                        _loc5_.dispose();
                     }
                  }
                  this.var_529.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_489 != param1.getUpdateID() || this.var_1663 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1760;
            if(this.var_261 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1858 || param4)
            {
               _loc5_ = true;
               this.var_1858 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_58.setDirectionAngle(AvatarSetType.const_43,_loc6_);
            }
            if(_loc7_ != this.var_1864 || param4)
            {
               _loc5_ = true;
               this.var_1864 = _loc7_;
               if(this.var_1864 != this.var_1858)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_58.setDirectionAngle(AvatarSetType.const_52,_loc7_);
               }
            }
            var_489 = param1.getUpdateID();
            this.var_1663 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1984);
         this.var_634 = null;
         if(this.var_261 == "mv" || this.var_261 == "std")
         {
            _loc2_.visible = true;
            if(this.var_634 == null || param1 != var_94)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_634 = this.var_58.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_634 = this.var_58.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_634 != null)
               {
                  _loc2_.asset = this.var_634.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_634 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_988 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_2001);
         if(this.var_599)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_988 = this.var_636.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_988 = this.var_636.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_261 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_261 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_988 != null)
            {
               _loc2_.asset = this.var_988.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_2002);
         if(this.var_1213 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_636.getAvatarRendererAsset("number_" + this.var_1213 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_636.getAvatarRendererAsset("number_" + this.var_1213 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_261 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_261 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_786 = 1;
               this.var_1861 = true;
               this.var_1212 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_786 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_2002);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1861)
         {
            ++this.var_1212;
            if(this.var_1212 < 10)
            {
               return false;
            }
            if(this.var_786 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1212 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_786 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_786 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_786 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_786 = 0;
               this.var_1861 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc5_:IRoomObject = object;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_636 == null)
         {
            return;
         }
         var _loc6_:IRoomObjectModel = _loc5_.getModel();
         var _loc7_:Number = param1.scale;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = this.var_788;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = this.updateModel(_loc6_,_loc7_,param3);
         if(this.animateNumberBubble(_loc7_))
         {
            increaseUpdateId();
         }
         if(_loc13_ || _loc7_ != var_94 || this.var_58 == null)
         {
            if(_loc7_ != var_94)
            {
               _loc9_ = true;
               this.validateActions(_loc7_);
            }
            if(_loc11_ != this.var_788)
            {
               _loc12_ = true;
            }
            if(_loc9_ || this.var_58 == null || _loc12_)
            {
               this.var_58 = this.getAvatarImage(_loc7_,this.var_788);
               if(this.var_58 == null)
               {
                  return;
               }
               _loc8_ = true;
               _loc16_ = getSprite(this.const_1076);
               if(_loc16_ && this.var_58 && this.var_58.isPlaceholder())
               {
                  _loc16_.alpha = 150;
               }
               else if(_loc16_)
               {
                  _loc16_.alpha = 255;
               }
            }
            if(this.var_58 == null)
            {
               return;
            }
            this.updateShadow(_loc7_);
            if(_loc9_)
            {
               this.updateTypingBubble(_loc7_);
               this.updateNumberBubble(_loc7_);
            }
            _loc10_ = this.updateObject(_loc5_,param1,param3,true);
            this.updateActions(this.var_58);
            var_94 = _loc7_;
         }
         else
         {
            _loc10_ = this.updateObject(_loc5_,param1,param3);
         }
         var _loc14_:Boolean = _loc10_ || _loc13_ || _loc9_;
         var _loc15_:Boolean = (this.var_911 || this.var_1152 > 0) && param3;
         if(_loc14_)
         {
            this.var_1152 = const_1074;
         }
         if(_loc14_ || _loc15_)
         {
            increaseUpdateId();
            --this.var_1152;
            --this.var_1151;
            if(!(this.var_1151 <= 0 || _loc9_ || _loc13_ || _loc8_))
            {
               return;
            }
            this.var_58.updateAnimationByFrames(1);
            this.var_1151 = const_1074;
            _loc18_ = this.var_58.getCanvasOffsets();
            if(_loc18_ == null || _loc18_.length < 3)
            {
               _loc18_ = const_1418;
            }
            _loc17_ = getSprite(this.const_1076);
            if(_loc17_ != null)
            {
               _loc21_ = this.var_58.getImage(AvatarSetType.const_43,false);
               if(_loc21_ != null)
               {
                  _loc17_.asset = _loc21_;
               }
               if(_loc17_.asset)
               {
                  _loc17_.offsetX = -1 * _loc7_ / 2 + _loc18_[0];
                  _loc17_.offsetY = -_loc17_.asset.height + _loc7_ / 4 + _loc18_[1] + this.var_1498;
               }
               if(this.var_1214)
               {
                  if(this.var_1865)
                  {
                     _loc17_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc17_.relativeDepth = const_665 + _loc18_[2];
                  }
               }
               else
               {
                  _loc17_.relativeDepth = const_666 + _loc18_[2];
               }
            }
            _loc17_ = getSprite(this.const_2001);
            if(_loc17_ != null && _loc17_.visible)
            {
               if(!this.var_1214)
               {
                  _loc17_.relativeDepth = const_666 - 0.01 + _loc18_[2];
               }
               else
               {
                  _loc17_.relativeDepth = const_665 - 0.01 + _loc18_[2];
               }
            }
            this.var_911 = this.var_58.isAnimating();
            _loc19_ = this.const_1419;
            for each(_loc20_ in this.var_58.getSprites())
            {
               if(_loc20_.id == const_1075)
               {
                  _loc17_ = getSprite(this.const_1076);
                  _loc22_ = this.var_58.getLayerData(_loc20_);
                  _loc23_ = _loc20_.getDirectionOffsetX(this.var_58.getDirection());
                  _loc24_ = _loc20_.getDirectionOffsetY(this.var_58.getDirection());
                  if(_loc22_ != null)
                  {
                     _loc23_ += _loc22_.dx;
                     _loc24_ += _loc22_.dy;
                  }
                  if(_loc7_ < 48)
                  {
                     _loc23_ /= 2;
                     _loc24_ /= 2;
                  }
                  _loc17_.offsetX += _loc23_;
                  _loc17_.offsetY += _loc24_;
               }
               else
               {
                  _loc17_ = getSprite(_loc19_);
                  if(_loc17_ != null)
                  {
                     _loc17_.capturesMouse = false;
                     _loc17_.visible = true;
                     _loc25_ = this.var_58.getLayerData(_loc20_);
                     _loc26_ = 0;
                     _loc27_ = _loc20_.getDirectionOffsetX(this.var_58.getDirection());
                     _loc28_ = _loc20_.getDirectionOffsetY(this.var_58.getDirection());
                     _loc29_ = _loc20_.getDirectionOffsetZ(this.var_58.getDirection());
                     _loc30_ = 0;
                     if(_loc20_.hasDirections)
                     {
                        _loc30_ = this.var_58.getDirection();
                     }
                     if(_loc25_ != null)
                     {
                        _loc26_ = _loc25_.animationFrame;
                        _loc27_ += _loc25_.dx;
                        _loc28_ += _loc25_.dy;
                        _loc30_ += _loc25_.directionOffset;
                     }
                     if(_loc7_ < 48)
                     {
                        _loc27_ /= 2;
                        _loc28_ /= 2;
                     }
                     if(_loc30_ < 0)
                     {
                        _loc30_ += 8;
                     }
                     else if(_loc30_ > 7)
                     {
                        _loc30_ -= 8;
                     }
                     _loc31_ = this.var_58.getScale() + "_" + _loc20_.member + "_" + _loc30_ + "_" + _loc26_;
                     _loc32_ = this.var_58.getAsset(_loc31_);
                     if(_loc32_ == null)
                     {
                        continue;
                     }
                     _loc17_.asset = _loc32_.content as BitmapData;
                     _loc17_.offsetX = -_loc32_.offset.x - _loc7_ / 2 + _loc27_;
                     _loc17_.offsetY = -_loc32_.offset.y + _loc28_ + this.var_1498;
                     if(this.var_1214)
                     {
                        _loc17_.relativeDepth = const_665 - 0.001 * spriteCount * _loc29_;
                     }
                     else
                     {
                        _loc17_.relativeDepth = const_666 - 0.001 * spriteCount * _loc29_;
                     }
                     if(_loc20_.ink == 33)
                     {
                        _loc17_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc17_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc19_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_378,this.var_261,this.var_1496);
         if(this.var_1435 > 0)
         {
            param1.appendAction(AvatarAction.const_328,AvatarAction.const_1829[this.var_1435]);
         }
         if(this._danceStyle > 0)
         {
            param1.appendAction(AvatarAction.const_753,this._danceStyle);
         }
         if(this.var_1859 > 0)
         {
            param1.appendAction(AvatarAction.const_748,this.var_1859);
         }
         if(this.var_787 > 0)
         {
            param1.appendAction(AvatarAction.const_981,this.var_787);
         }
         if(this.var_635 > 0)
         {
            param1.appendAction(AvatarAction.const_746,this.var_635);
         }
         if(this.var_1860)
         {
            param1.appendAction(AvatarAction.const_340);
         }
         if(this.var_1863 || this.var_1497)
         {
            param1.appendAction(AvatarAction.const_502);
         }
         if(this.var_1862)
         {
            param1.appendAction(AvatarAction.const_260);
         }
         if(this.var_788 > 0)
         {
            param1.appendAction(AvatarAction.const_323,this.var_788);
         }
         param1.endActionAppends();
         this.var_911 = param1.isAnimating();
         var _loc2_:int = this.const_1419;
         for each(_loc3_ in this.var_58.getSprites())
         {
            if(_loc3_.id != const_1075)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
