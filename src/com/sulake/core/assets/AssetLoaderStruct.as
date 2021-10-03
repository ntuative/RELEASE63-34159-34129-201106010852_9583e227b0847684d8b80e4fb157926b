package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_1024:IAssetLoader;
      
      private var var_2584:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_2584 = param1;
         this.var_1024 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_2584;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_1024;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_1024 != null)
            {
               if(!this.var_1024.disposed)
               {
                  this.var_1024.dispose();
                  this.var_1024 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
