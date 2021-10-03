package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_159:Number = 0;
      
      private var var_158:Number = 0;
      
      private var var_2827:Number = 0;
      
      private var var_2825:Number = 0;
      
      private var var_2824:Number = 0;
      
      private var var_2829:Number = 0;
      
      private var var_454:int = 0;
      
      private var var_2826:int = 0;
      
      private var var_339:Array;
      
      private var var_2828:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_339 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_159 = param3;
         this.var_158 = param4;
         this.var_2827 = param5;
         this.var_454 = param6;
         this.var_2826 = param7;
         this.var_2825 = param8;
         this.var_2824 = param9;
         this.var_2829 = param10;
         this.var_2828 = param11;
         this.var_339 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_159;
      }
      
      public function get z() : Number
      {
         return this.var_158;
      }
      
      public function get localZ() : Number
      {
         return this.var_2827;
      }
      
      public function get targetX() : Number
      {
         return this.var_2825;
      }
      
      public function get targetY() : Number
      {
         return this.var_2824;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2829;
      }
      
      public function get dir() : int
      {
         return this.var_454;
      }
      
      public function get dirHead() : int
      {
         return this.var_2826;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2828;
      }
      
      public function get actions() : Array
      {
         return this.var_339.slice();
      }
   }
}
