package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1548:Number = 12;
       
      
      private var var_2680:int = -1;
      
      private var var_2673:int = -2;
      
      private var var_212:Vector3d = null;
      
      private var var_1256:Number = 0;
      
      private var var_1522:Number = 0;
      
      private var var_1939:Boolean = false;
      
      private var var_188:Vector3d = null;
      
      private var var_1940:Vector3d;
      
      private var var_2678:Boolean = false;
      
      private var var_2676:Boolean = false;
      
      private var var_2679:Boolean = false;
      
      private var var_2677:Boolean = false;
      
      private var var_2674:int = 0;
      
      private var var_2682:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2681:int = 0;
      
      private var var_2675:int = 0;
      
      private var var_1663:int = -1;
      
      private var var_1937:int = 0;
      
      private var var_1938:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1940 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_188;
      }
      
      public function get targetId() : int
      {
         return this.var_2680;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2673;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1940;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2678;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2676;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2679;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2677;
      }
      
      public function get screenWd() : int
      {
         return this.var_2674;
      }
      
      public function get screenHt() : int
      {
         return this.var_2682;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2681;
      }
      
      public function get roomHt() : int
      {
         return this.var_2675;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1663;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_212 != null && this.var_188 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2680 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1940.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2673 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2678 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2676 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2679 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2677 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2674 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2682 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1938 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2681 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2675 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1663 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_212 == null)
         {
            this.var_212 = new Vector3d();
         }
         if(this.var_212.x != param1.x || this.var_212.y != param1.y || this.var_212.z != param1.z)
         {
            this.var_212.assign(param1);
            this.var_1937 = 0;
            _loc2_ = Vector3d.dif(this.var_212,this.var_188);
            this.var_1256 = _loc2_.length;
            this.var_1939 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_212 = null;
         this.var_188 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_188 != null)
         {
            return;
         }
         this.var_188 = new Vector3d();
         this.var_188.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_188 == null)
         {
            this.var_188 = new Vector3d();
         }
         this.var_188.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_212 != null && this.var_188 != null)
         {
            ++this.var_1937;
            if(this.var_1938)
            {
               this.var_1938 = false;
               this.var_188 = this.var_212;
               this.var_212 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_212,this.var_188);
            if(_loc3_.length > this.var_1256)
            {
               this.var_1256 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_188 = this.var_212;
               this.var_212 = null;
               this.var_1522 = 0;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1256);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1256 / const_1548;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_1939)
               {
                  if(_loc7_ < this.var_1522)
                  {
                     _loc7_ = this.var_1522;
                     if(_loc7_ > _loc3_.length)
                     {
                        _loc7_ = _loc3_.length;
                     }
                  }
                  else
                  {
                     this.var_1939 = false;
                  }
               }
               this.var_1522 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_188 = Vector3d.sum(this.var_188,_loc3_);
            }
         }
      }
      
      public function reset() : void
      {
         this.var_1663 = -1;
      }
   }
}
