package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_344:int = 1;
      
      public static const const_223:int = 2;
      
      public static const const_281:int = 3;
      
      public static const const_325:int = 4;
      
      public static const const_201:int = 5;
      
      public static const const_408:int = 1;
      
      public static const const_965:int = 2;
      
      public static const const_832:int = 3;
      
      public static const const_789:int = 4;
      
      public static const const_233:int = 5;
      
      public static const const_774:int = 6;
      
      public static const const_858:int = 7;
      
      public static const const_253:int = 8;
      
      public static const const_425:int = 9;
      
      public static const const_2239:int = 10;
      
      public static const const_945:int = 11;
      
      public static const const_513:int = 12;
       
      
      private var var_429:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_429 = new Array();
         this.var_429.push(new Tab(this._navigator,const_344,const_513,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_477));
         this.var_429.push(new Tab(this._navigator,const_223,const_408,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_477));
         this.var_429.push(new Tab(this._navigator,const_325,const_945,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1210));
         this.var_429.push(new Tab(this._navigator,const_281,const_233,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_477));
         this.var_429.push(new Tab(this._navigator,const_201,const_253,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_833));
         this.setSelectedTab(const_344);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_325;
      }
      
      public function get tabs() : Array
      {
         return this.var_429;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_429)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_429)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_429)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
