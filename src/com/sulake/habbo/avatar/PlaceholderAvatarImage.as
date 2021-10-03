package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_839:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1110)
         {
            _structure = null;
            _assets = null;
            var_279 = null;
            var_290 = null;
            var_605 = null;
            var_582 = null;
            var_339 = null;
            if(!var_1378 && var_46)
            {
               var_46.dispose();
            }
            var_46 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_836 = null;
            var_1110 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_839[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_839[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_378:
               switch(_loc3_)
               {
                  case AvatarAction.const_760:
                  case AvatarAction.const_533:
                  case AvatarAction.const_386:
                  case AvatarAction.const_976:
                  case AvatarAction.const_375:
                  case AvatarAction.const_813:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_323:
            case AvatarAction.const_753:
            case AvatarAction.const_260:
            case AvatarAction.const_748:
            case AvatarAction.const_981:
            case AvatarAction.const_746:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
