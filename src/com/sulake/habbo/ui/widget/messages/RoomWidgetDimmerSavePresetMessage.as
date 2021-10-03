package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_702:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2267:int;
      
      private var var_2266:int;
      
      private var _color:uint;
      
      private var var_1321:int;
      
      private var var_2265:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_702);
         this.var_2267 = param1;
         this.var_2266 = param2;
         this._color = param3;
         this.var_1321 = param4;
         this.var_2265 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2267;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2266;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1321;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2265;
      }
   }
}
