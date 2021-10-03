package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.utils.PropertyDefaults;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.geom.Rectangle;
   
   public class TabSelectorController extends SelectorController implements ITabSelectorWindow
   {
       
      
      protected var _spacing:int = 0;
      
      private var var_1653:Boolean = false;
      
      public function TabSelectorController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_2183 = false;
      }
      
      public function get spacing() : int
      {
         return this._spacing;
      }
      
      public function set spacing(param1:int) : void
      {
         this._spacing = param1;
         this.updateSelectableRegion();
      }
      
      override public function update(param1:WindowController, param2:WindowEvent) : Boolean
      {
         if(param2.type == WindowEvent.const_356)
         {
            this.updateSelectableRegion();
         }
         else if(param2.type == WindowEvent.const_119)
         {
            this.updateSelectableRegion();
         }
         else if(param2.type == WindowEvent.const_197)
         {
            this.updateSelectableRegion();
         }
         return super.update(param1,param2);
      }
      
      private function updateSelectableRegion() : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         if(this.var_1653)
         {
            return;
         }
         this.var_1653 = true;
         var _loc1_:uint = numSelectables;
         var _loc3_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc1_)
         {
            _loc2_ = getSelectableAt(_loc4_);
            _loc2_.x = _loc3_;
            _loc3_ += _loc2_.width + this._spacing;
            _loc4_++;
         }
         this.var_1653 = false;
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         if(this._spacing != PropertyDefaults.const_585)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_381,this._spacing,PropertyStruct.const_42,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1299);
         }
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case PropertyDefaults.const_381:
                  if(_loc2_.value != this._spacing)
                  {
                     this.spacing = _loc2_.value as int;
                  }
                  break;
            }
         }
         super.properties = param1;
      }
   }
}
