package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_455:RoomObjectLocationCacheItem = null;
      
      private var var_213:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_455 = new RoomObjectLocationCacheItem(param1);
         this.var_213 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_455;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_213;
      }
      
      public function dispose() : void
      {
         if(this.var_455 != null)
         {
            this.var_455.dispose();
            this.var_455 = null;
         }
         if(this.var_213 != null)
         {
            this.var_213.dispose();
            this.var_213 = null;
         }
      }
   }
}
